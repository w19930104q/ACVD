/*=========================================================================

  Program:   Deterministic canonical renumbering of remeshed surfaces
  Module:    vtkMeshCanonicalizer.h
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
 * @file vtkMeshCanonicalizer.h
 *
 * @brief Standalone, deterministic output stage for ACVD.
 *
 * The remeshing pipeline produces a vtkSurface whose vertex and face ordering
 * depends on internal cluster ids and on the order faces were discovered.
 * With the multithreaded clusterer, that discovery order changes from run to
 * run, so two identical runs emit PLY files with different byte content even
 * when the geometry is identical.
 *
 * This module is deliberately independent from the clustering and from the
 * boundary fixing stages: it only consumes a finished vtkSurface and produces
 * another vtkSurface whose numbering is a pure function of the geometry and
 * connectivity, so the emitted file is byte-stable across runs and machines
 * (for the same VTK version and floating point inputs).
 *
 * Ordering rules:
 *  - unused (zero-valence) vertices are removed;
 *  - vertices are sorted lexicographically by quantized coordinates and then
 *    by exact coordinates, giving a canonical order independent of input ids;
 *  - faces are sorted lexicographically by their canonical vertex id triple
 *    with a deterministic orientation convention.
 *
 * Point/cell attributes (e.g. colors) are carried over with the renumbering.
 */
#ifndef __vtkMeshCanonicalizer_h
#define __vtkMeshCanonicalizer_h

#include <vector>
#include <algorithm>
#include <cmath>

#include <vtkIdTypeArray.h>
#include <vtkPoints.h>
#include <vtkDataArray.h>
#include <vtkPointData.h>
#include <vtkCellData.h>

#include "vtkSurface.h"

class VTK_EXPORT vtkMeshCanonicalizer
{
public:

	/// Quantization used only for the ordering tie-breaking key.
	/// Coordinates are rounded to 1e-9 of the bounding box diagonal, which
	/// is far below the numerical noise of the clustering but collapses
	/// bit-identical points onto the same key.
	static constexpr double QuantizationEpsilon = 1e-9;

	/**
	 * @brief Builds a canonically renumbered copy of @p input.
	 *
	 * The input mesh is never modified. Vertices with no incident face are
	 * dropped (this also removes the duplicate placeholder vertices created
	 * for empty clusters during BuildDelaunayTriangulation()).
	 *
	 * @param input finished mesh (clustering + boundary fixing done)
	 * @return new vtkSurface in canonical order (caller owns it)
	 */
	static vtkSurface *Canonicalize(vtkSurface *input)
	{
		vtkSurface *output = vtkSurface::New();

		const vtkIdType numberOfPoints = input->GetNumberOfPoints();
		const vtkIdType numberOfCells = input->GetNumberOfCells();

		double bounds[6];
		input->GetBounds(bounds);
		double diagonal = 0.0;
		for (int k = 0; k < 3; k++) {
			double d = bounds[2 * k + 1] - bounds[2 * k];
			if (d > diagonal) diagonal = d;
		}
		if (diagonal <= 0.0) diagonal = 1.0;
		const double scale = QuantizationEpsilon / diagonal;

		// ---- 1. keep only active vertices with incident faces --------------
		std::vector<vtkIdType> usedVertices;
		usedVertices.reserve(numberOfPoints);
		for (vtkIdType v = 0; v < numberOfPoints; v++) {
			if (input->IsVertexActive(v) && input->GetValence(v) > 0)
				usedVertices.push_back(v);
		}

		// ---- 2. canonical vertex ordering ----------------------------------
		// Sort by quantized key first (stable grouping of identical points),
		// then by exact coordinates, then by original id as last resort.
		std::vector<VertexKey> keys;
		keys.reserve(usedVertices.size());
		for (size_t i = 0; i < usedVertices.size(); i++) {
			double p[3];
			input->GetPointCoordinates(usedVertices[i], p);
			VertexKey key;
			key.originalId = usedVertices[i];
			for (int k = 0; k < 3; k++) {
				key.p[k] = p[k];
				key.q[k] = llround(p[k] / scale);
			}
			keys.push_back(key);
		}

		std::sort(keys.begin(), keys.end(), VertexKey::Compare);

		// old id -> new id
		std::vector<vtkIdType> remap(numberOfPoints, -1);
		for (size_t i = 0; i < keys.size(); i++) {
			vtkIdType oldId = keys[i].originalId;
			// AddVertex keeps ActiveVertices and the vertex ring topology
			// consistent; SetPoints alone would leave those arrays stale.
			remap[oldId] = output->AddVertex(keys[i].p);
		}

		// carry point data (colors, scalars...) through the renumbering
		vtkPointData *inPD = input->GetPointData();
		vtkPointData *outPD = output->GetPointData();
		CopyAttributes(inPD, outPD, remap,
			static_cast<vtkIdType>(keys.size()));

		// ---- 3. canonical face ordering -------------------------------------
		std::vector<FaceKey> faceKeys;
		faceKeys.reserve(numberOfCells);
		for (vtkIdType f = 0; f < numberOfCells; f++) {
			if (!input->IsFaceActive(f)) continue;
			vtkIdType n, *verts;
			input->GetFaceVertices(f, n, verts);
			if (n != 3) continue; // ACVD outputs triangles only

			FaceKey fk;
			fk.originalId = f;
			for (int k = 0; k < 3; k++) {
				vtkIdType nv = remap[verts[k]];
				if (nv < 0) break; // face references an unused vertex
				fk.v[k] = nv;
			}
			if (fk.v[0] < 0 || fk.v[1] < 0 || fk.v[2] < 0) continue;
			fk.CanonicalizeOrientation();
			faceKeys.push_back(fk);
		}

		std::sort(faceKeys.begin(), faceKeys.end(), FaceKey::Compare);

		for (size_t i = 0; i < faceKeys.size(); i++) {
			output->AddFace(faceKeys[i].v[0],
				faceKeys[i].v[1], faceKeys[i].v[2]);
		}

		// carry cell data following the canonical face order
		std::vector<vtkIdType> faceRemap(numberOfCells, -1);
		for (size_t i = 0; i < faceKeys.size(); i++)
			faceRemap[faceKeys[i].originalId] = static_cast<vtkIdType>(i);
		vtkCellData *inCD = input->GetCellData();
		vtkCellData *outCD = output->GetCellData();
		CopyAttributes(inCD, outCD, faceRemap,
			static_cast<vtkIdType>(faceKeys.size()));

		return output;
	}

private:

	struct VertexKey
	{
		vtkIdType originalId;
		double p[3];
		long long q[3];

		static bool Compare(const VertexKey &a, const VertexKey &b)
		{
			for (int k = 0; k < 3; k++)
				if (a.q[k] != b.q[k]) return a.q[k] < b.q[k];
			for (int k = 0; k < 3; k++)
				if (a.p[k] != b.p[k]) return a.p[k] < b.p[k];
			return a.originalId < b.originalId;
		}
	};

	struct FaceKey
	{
		vtkIdType originalId;
		vtkIdType v[3];

		// Rotate the triangle so the smallest canonical id comes first.
		// The handedness of the original face is preserved (no swap), only
		// the cyclic starting vertex is normalized for stable comparison.
		void CanonicalizeOrientation()
		{
			int imin = 0;
			if (v[1] < v[imin]) imin = 1;
			if (v[2] < v[imin]) imin = 2;
			if (imin != 0) {
				vtkIdType t[3] = {v[0], v[1], v[2]};
				for (int k = 0; k < 3; k++)
					v[k] = t[(imin + k) % 3];
			}
		}

		static bool Compare(const FaceKey &a, const FaceKey &b)
		{
			for (int k = 0; k < 3; k++)
				if (a.v[k] != b.v[k]) return a.v[k] < b.v[k];
			return a.originalId < b.originalId;
		}
	};

	static void CopyAttributes(vtkFieldData *inFD, vtkFieldData *outFD,
		const std::vector<vtkIdType> &remap, vtkIdType outCount)
	{
		if (!inFD || !outFD || inFD->GetNumberOfArrays() == 0) return;

		for (int a = 0; a < inFD->GetNumberOfArrays(); a++) {
			vtkDataArray *inArray = inFD->GetArray(a);
			if (!inArray) continue;
			vtkDataArray *outArray = vtkDataArray::CreateDataArray(
				inArray->GetDataType());
			outArray->SetName(inArray->GetName());
			outArray->SetNumberOfComponents(inArray->GetNumberOfComponents());
			outArray->SetNumberOfTuples(outCount);

			// remap each tuple from its source id to its canonical id
			for (size_t oldId = 0; oldId < remap.size(); oldId++) {
				vtkIdType newId = remap[oldId];
				if (newId < 0) continue;
				outArray->SetTuple(newId, oldId, inArray);
			}
			outFD->AddArray(outArray);
			outArray->Delete();
		}
	}
};

#endif
