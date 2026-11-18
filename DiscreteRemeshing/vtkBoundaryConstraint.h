/*=========================================================================

  Program:   Boundary and sharp-feature protection for ACVD
  Module:    vtkBoundaryConstraint.h
  Language:  C++

  Copyright (c) CREATIS-LRMN (Centre de Recherche en Imagerie Medicale)
  Author : Sebastien Valette

  This software is governed by the CeCILL-B license under French law and
  abiding by the rules of distribution of free software. You can use,
  modify and/ or redistribute the software under the terms of the CeCILL-B
  license as circulated by CEA, CNRS and INRIA at the following URL
  http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html
  or in the file LICENSE.txt.
------------------------------------------------------------------------ */

/**
 * @file vtkBoundaryConstraint.h
 *
 * @brief Standalone detection of vertices that must survive simplification.
 *
 * ACVD's energy minimization tends to relocate clusters away from hole
 * borders and to smooth out sharp creases, because nothing distinguishes a
 * boundary/feature vertex from an interior one. This class collects the
 * vertices that have to be preserved before the clustering starts; the
 * remesher then turns each of them into its own anchored cluster via the
 * existing vtkUniformClustering::FixedClusters mechanism.
 *
 * Three independent constraint sources are supported:
 *  - topological boundaries (edges with a single incident face);
 *  - sharp creases (dihedral angle above a threshold);
 *  - color discontinuities (point/cell scalar components changing across an
 *    edge), which protect the borders between colored regions.
 *
 * The class is a pure pre-processing stage: it does not touch the clustering
 * data structures nor the output mesh, and it is deterministic (all traversals
 * iterate over fixed vtkSurface index ranges).
 */
#ifndef __vtkBoundaryConstraint_h
#define __vtkBoundaryConstraint_h

#include <vector>
#include <cmath>

#include <vtkIdList.h>
#include <vtkDataArray.h>
#include <vtkPointData.h>
#include <vtkCellData.h>
#include <vtkMath.h>

#include "vtkSurface.h"

class VTK_EXPORT vtkBoundaryConstraint
{
public:

	struct Options
	{
		/// Protect topological hole boundaries.
		bool protectTopologicalBoundaries;

		/// Protect sharp crease edges (dihedral angle > sharpAngleDegrees).
		bool protectSharpEdges;

		/// Protect edges where scalar/color attributes change.
		bool protectColorBoundaries;

		/// Crease threshold in degrees.
		double sharpAngleDegrees;

		Options()
			: protectTopologicalBoundaries(true),
			protectSharpEdges(true),
			protectColorBoundaries(true),
			sharpAngleDegrees(40.0)
		{}
	};

	/// Constraint categories, ordered by protection priority. Lower value
	/// means higher priority when the constraint budget has to be trimmed:
	/// hole borders are non-negotiable, then color region borders, then the
	/// (far more numerous) sharp creases.
	enum Priority
	{
		TopologicalBoundary = 0,
		ColorBoundary = 1,
		SharpEdge = 2
	};

	/**
	 * @brief Detects the constrained vertices of @p mesh.
	 *
	 * @param mesh input triangular mesh
	 * @param options constraint sources and thresholds
	 * @return a new vtkIdList of input vertex ids (caller owns the list).
	 *         The list is sorted and contains unique ids only.
	 */
	static vtkIdList *DetectConstrainedVertices(vtkSurface *mesh,
		const Options &options)
	{
		std::vector<unsigned char> priorities;
		return DetectConstrainedVertices(mesh, options, priorities);
	}

	/**
	 * @brief Same as above, but also reports the protection priority (one of
	 * the Priority enum values) attached to every input vertex. Unconstrained
	 * vertices get a value of 255. @p priorities is resized to the number of
	 * input points. Used by the budget-aware selection so the most important
	 * constraints survive trimming.
	 */
	static vtkIdList *DetectConstrainedVertices(vtkSurface *mesh,
		const Options &options, std::vector<unsigned char> &priorities)
	{
		const vtkIdType numberOfPoints = mesh->GetNumberOfPoints();
		// 255 = "not constrained"; any real Priority value is smaller.
		priorities.assign(numberOfPoints, 255);

		auto flag = [&](vtkIdType v, unsigned char priority) {
			// keep the highest (numerically smallest) priority
			if (priority < priorities[v]) priorities[v] = priority;
		};

		for (vtkIdType e = 0; e < mesh->GetNumberOfEdges(); e++) {

			vtkIdType v1, v2, f1, f2;
			mesh->GetEdgeVertices(e, v1, v2);
			mesh->GetEdgeFaces(e, f1, f2);

			bool isBoundaryEdge = (f2 < 0 && f1 >= 0);
			if (options.protectTopologicalBoundaries && isBoundaryEdge) {
				flag(v1, TopologicalBoundary);
				flag(v2, TopologicalBoundary);
			}

			if (!isBoundaryEdge && f1 >= 0 && f2 >= 0) {
				if (options.protectSharpEdges &&
					IsSharpEdge(mesh, f1, f2, options.sharpAngleDegrees)) {
					flag(v1, SharpEdge);
					flag(v2, SharpEdge);
				}
			}

			if (options.protectColorBoundaries &&
				IsColorBoundary(mesh, e, v1, v2, f1, f2)) {
				flag(v1, ColorBoundary);
				flag(v2, ColorBoundary);
			}
		}

		vtkIdList *result = vtkIdList::New();
		for (vtkIdType v = 0; v < numberOfPoints; v++) {
			if (priorities[v] != 255) result->InsertNextId(v);
		}
		return result;
	}

	/**
	 * @brief Selects at most @p budget constrained vertices, keeping the
	 * highest-priority ones and spreading each priority tier spatially so a
	 * long protected curve is not reduced to a single point.
	 *
	 * The selection is deterministic: within a priority tier the candidates are
	 * visited in ascending input id order and accepted greedily until the tier
	 * quota is exhausted; topological boundaries (the smallest, most important
	 * set) are always kept in full before any lower tier is considered.
	 *
	 * @param mesh input mesh (used only for coordinates)
	 * @param allConstraints full constrained vertex list
	 * @param priorities per-vertex priority produced by DetectConstrainedVertices
	 * @param budget maximum number of constraints to retain
	 * @return a new vtkIdList with at most @p budget ids (caller owns it)
	 */
	static vtkIdList *SelectWithinBudget(vtkSurface *mesh,
		vtkIdList *allConstraints,
		const std::vector<unsigned char> &priorities, vtkIdType budget)
	{
		vtkIdList *selected = vtkIdList::New();
		const vtkIdType total = allConstraints->GetNumberOfIds();
		if (budget <= 0) return selected;
		if (total <= budget) {
			for (vtkIdType i = 0; i < total; i++)
				selected->InsertNextId(allConstraints->GetId(i));
			return selected;
		}

		// Gather candidates per priority tier, input id order (already sorted
		// because detection iterates vertices in ascending order).
		std::vector<std::vector<vtkIdType> > tiers(3);
		for (vtkIdType i = 0; i < total; i++) {
			vtkIdType v = allConstraints->GetId(i);
			unsigned char pr = priorities[v];
			if (pr < 3) tiers[pr].push_back(v);
		}

		// Tier 0 (topological boundaries) is protected unconditionally; if it
		// alone exceeds the budget, spread the budget evenly along it.
		vtkIdType used = 0;
		for (int tier = 0; tier < 3 && used < budget; tier++) {
			vtkIdType remaining = budget - used;
			vtkIdType take = static_cast<vtkIdType>(tiers[tier].size());
			if (tier < 2) {
				// reserve at least a quarter of the budget for lower tiers so
				// sharp/color features still get represented when boundaries
				// are abundant; topological tier itself is never trimmed below
				// its own size unless the hard budget forces it.
				vtkIdType reserveLower = (budget + 3) / 4;
				if (tier == 0 && take > remaining - reserveLower &&
					remaining > reserveLower)
					take = remaining - reserveLower;
			}
			if (take > remaining) take = remaining;

			AppendSpread(mesh, tiers[tier], take, selected);
			used += take;
		}
		return selected;
	}

	/// Dihedral angle (degrees) between the two faces of an edge.
	static double EdgeDihedralAngle(vtkSurface *mesh,
		vtkIdType f1, vtkIdType f2)
	{
		double n1[3], n2[3];
		mesh->GetTriangleNormal(f1, n1);
		mesh->GetTriangleNormal(f2, n2);
		double dot = vtkMath::Dot(n1, n2);
		if (dot > 1.0) dot = 1.0;
		if (dot < -1.0) dot = -1.0;
		return vtkMath::DegreesFromRadians(acos(dot));
	}

private:

	/// Appends at most @p take ids from @p candidates (already in ascending
	/// input id order) to @p selected using a deterministic stride, so a long
	/// feature curve is sampled uniformly instead of keeping only its head.
	static void AppendSpread(vtkSurface *mesh,
		const std::vector<vtkIdType> &candidates, vtkIdType take,
		vtkIdList *selected)
	{
		(void)mesh;
		const vtkIdType n = static_cast<vtkIdType>(candidates.size());
		if (take <= 0 || n == 0) return;
		if (take >= n) {
			for (vtkIdType i = 0; i < n; i++)
				selected->InsertNextId(candidates[i]);
			return;
		}
		// Fixed-point stride walk; the same input always yields the same pick.
		for (vtkIdType k = 0; k < take; k++) {
			vtkIdType idx = static_cast<vtkIdType>(
				(static_cast<long long>(k) * n) / take);
			selected->InsertNextId(candidates[idx]);
		}
	}

	static bool IsSharpEdge(vtkSurface *mesh, vtkIdType f1, vtkIdType f2,
		double thresholdDegrees)
	{
		return EdgeDihedralAngle(mesh, f1, f2) >= thresholdDegrees;
	}

	/// Compares scalar attributes on both sides of an edge. Point scalars
	/// are compared at the two endpoints; cell scalars are compared between
	/// the incident faces. Any component difference flags a color border.
	static bool IsColorBoundary(vtkSurface *mesh, vtkIdType edge,
		vtkIdType v1, vtkIdType v2, vtkIdType f1, vtkIdType f2)
	{
		(void)edge;

		vtkDataArray *pointScalars =
			mesh->GetPointData() ? mesh->GetPointData()->GetScalars() : 0;
		if (pointScalars && pointScalars->GetNumberOfComponents() > 0 &&
			TuplesDiffer(pointScalars, v1, v2)) {
			return true;
		}

		vtkDataArray *cellScalars =
			mesh->GetCellData() ? mesh->GetCellData()->GetScalars() : 0;
		if (cellScalars && f1 >= 0 && f2 >= 0 &&
			cellScalars->GetNumberOfComponents() > 0 &&
			TuplesDiffer(cellScalars, f1, f2)) {
			return true;
		}

		return false;
	}

	static bool TuplesDiffer(vtkDataArray *array, vtkIdType a, vtkIdType b)
	{
		const int n = array->GetNumberOfComponents();
		for (int k = 0; k < n; k++) {
			if (array->GetComponent(a, k) != array->GetComponent(b, k))
				return true;
		}
		return false;
	}
};

#endif
