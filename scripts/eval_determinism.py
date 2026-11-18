#!/usr/bin/env python3
"""Deterministic ACVD evaluation harness.

Runs a given ACVD executable twice on a fixed set of meshes and reports,
for every mesh:
  - output vertex / face counts,
  - approximate Hausdorff distance to the input mesh,
  - boundary retention (fraction of input boundary edges whose endpoints are
    reproduced within tolerance, plus boundary Hausdorff distance),
  - sha256 hashes of the two output files (determinism check).

The harness only reads/writes paths passed on the command line and runs with
sys.isolated mode semantics (-I) so untrusted data directories cannot inject
modules.
"""

import argparse
import hashlib
import os
import struct
import subprocess
import sys

# Under `python -I`, neither the current directory nor PYTHONPATH is honored.
# The runner passes the trusted site-packages location explicitly here so the
# untrusted mesh directory can never shadow numpy/scipy.
for extra in os.environ.get("ACVD_PYTHON_PATH", "").split(os.pathsep):
    if extra and extra not in sys.path:
        sys.path.append(extra)

import numpy as np
from scipy.spatial import cKDTree


# ---------------------------------------------------------------------------
# Minimal PLY reader (ascii + binary_little_endian), sufficient for ACVD output
# ---------------------------------------------------------------------------
def read_ply(path):
    with open(path, "rb") as fh:
        header_lines = []
        while True:
            line = fh.readline()
            if not line:
                raise ValueError("truncated PLY header: %s" % path)
            header_lines.append(line.decode("ascii", "replace").strip())
            if line.strip() == b"end_header":
                break

        fmt = "ascii"
        n_vertices = n_faces = 0
        vertex_types = []
        section = None
        for line in header_lines:
            tokens = line.split()
            if not tokens:
                continue
            if tokens[0] == "format":
                fmt = tokens[1]
            elif tokens[0] == "element":
                section = tokens[1]
                if section == "vertex":
                    n_vertices = int(tokens[2])
                elif section == "face":
                    n_faces = int(tokens[2])
            elif tokens[0] == "property" and section == "vertex":
                # "property <type> <name>"
                vertex_types.append(tokens[1])

        points = np.zeros((n_vertices, 3), dtype=np.float64)
        faces = np.zeros((n_faces, 3), dtype=np.int64)

        if fmt == "ascii":
            for i in range(n_vertices):
                values = fh.readline().split()
                points[i] = [float(values[0]), float(values[1]), float(values[2])]
            for i in range(n_faces):
                values = fh.readline().split()
                count = int(values[0])
                faces[i] = [int(values[1]), int(values[2]), int(values[3])]
                if count != 3:
                    raise ValueError("only triangles supported")
        elif fmt == "binary_little_endian":
            type_map = {
                "float": ("f", 4), "float32": ("f", 4), "double": ("d", 8),
                "uchar": ("B", 1), "uint8": ("B", 1), "int": ("i", 4),
                "int32": ("i", 4), "uint": ("I", 4), "short": ("h", 2),
                "ushort": ("H", 2),
            }
            vertex_stride = 0
            vertex_xyz = []
            for column, vtype in enumerate(vertex_types):
                _, size = type_map[vtype]
                if column < 3:
                    vertex_xyz.append((vertex_stride, size))
                vertex_stride += size
            for i in range(n_vertices):
                record = fh.read(vertex_stride)
                coords = []
                for offset, size in vertex_xyz:
                    coords.append(struct.unpack_from("<f", record, offset)[0]
                                  if size == 4 else
                                  struct.unpack_from("<d", record, offset)[0])
                points[i] = coords
            for i in range(n_faces):
                # face layout: uchar list-size then three ints in ACVD output
                count_byte = fh.read(1)
                count = count_byte[0]
                if count != 3:
                    raise ValueError("only triangles supported")
                record = fh.read(3 * 4)
                faces[i] = struct.unpack_from("<iii", record, 0)
        else:
            raise ValueError("unsupported PLY format: %s" % fmt)

    return points, faces


# ---------------------------------------------------------------------------
# Minimal OBJ reader for the fixed input meshes
# ---------------------------------------------------------------------------
def read_obj(path):
    points = []
    faces = []
    with open(path, "r", encoding="utf-8", errors="replace") as fh:
        for line in fh:
            if line.startswith("v "):
                _, x, y, z = line.split()[:4]
                points.append([float(x), float(y), float(z)])
            elif line.startswith("f "):
                verts = []
                for token in line.split()[1:]:
                    verts.append(int(token.split("/")[0]) - 1)
                if len(verts) == 3:
                    faces.append(verts)
    return np.asarray(points, dtype=np.float64), np.asarray(faces, dtype=np.int64)


# ---------------------------------------------------------------------------
# Metrics
# ---------------------------------------------------------------------------
def boundary_edges(faces):
    """Return the set of undirected boundary edges (each as a sorted pair)."""
    edge_count = {}
    for face in faces:
        for k in range(3):
            edge = tuple(sorted((int(face[k]), int(face[(k + 1) % 3]))))
            edge_count[edge] = edge_count.get(edge, 0) + 1
    return np.asarray([e for e, count in edge_count.items() if count == 1],
                      dtype=np.int64)


def hausdorff_points(a, b):
    """Symmetric Hausdorff distance between two point clouds (approximation)."""
    tree_b = cKDTree(b)
    tree_a = cKDTree(a)
    d_ab = tree_b.query(a, k=1)[0].max()
    d_ba = tree_a.query(b, k=1)[0].max()
    return float(max(d_ab, d_ba))


def boundary_retention(in_points, in_faces, out_points, out_faces, diagonal):
    """Measure how well the input hole borders survive.

    A coarsened mesh cannot reproduce every input border vertex, so a fixed
    tiny tolerance gives meaningless zeros. The tolerance is instead tied to
    the output resolution: half the mean output edge length, i.e. a border
    vertex counts as retained when an output border vertex lies within roughly
    half an output edge. The raw boundary Hausdorff distance is always
    reported as well so the choice of tolerance does not hide information.

    Returns (retention_ratio, boundary_hausdorff, tolerance).
    """
    in_border = boundary_edges(in_faces)
    if len(in_border) == 0:
        return 1.0, 0.0, 0.0

    in_border_vertices = np.unique(in_border.reshape(-1))
    in_border_points = in_points[in_border_vertices]

    out_border = boundary_edges(out_faces)
    if len(out_border) == 0:
        # no boundary left at all: nothing was retained
        return 0.0, hausdorff_points(in_border_points, out_points), 0.0

    out_border_vertices = np.unique(out_border.reshape(-1))
    out_border_points = out_points[out_border_vertices]

    # Resolution-aware tolerance: half the mean length of output border edges.
    border_edge_lengths = np.linalg.norm(
        out_points[out_border[:, 0]] - out_points[out_border[:, 1]], axis=1)
    tolerance = 0.5 * float(np.mean(border_edge_lengths))

    tree = cKDTree(out_border_points)
    distances = tree.query(in_border_points, k=1)[0]
    retention = float(np.mean(distances <= tolerance))
    bhaus = float(max(
        distances.max(),
        cKDTree(in_border_points).query(out_border_points, k=1)[0].max()))
    return retention, bhaus, tolerance


def sha256_file(path):
    digest = hashlib.sha256()
    with open(path, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--executable", required=True)
    parser.add_argument("--meshes", nargs="+", required=True,
                        help="input mesh paths (.obj or .ply)")
    parser.add_argument("--workdir", required=True)
    parser.add_argument("--nvertices", type=int, default=1000)
    parser.add_argument("--gradation", type=float, default=0.0)
    parser.add_argument("--extra", default="",
                        help="extra ACVD flags, quoted as one string")
    parser.add_argument("--report", required=True)
    parser.add_argument("--library-path", default="")
    args = parser.parse_args()

    env = dict(os.environ)
    if args.library_path:
        env["LD_LIBRARY_PATH"] = args.library_path

    rows = []
    for mesh in args.meshes:
        name = os.path.splitext(os.path.basename(mesh))[0]
        outputs = []
        for run in (1, 2):
            run_dir = os.path.join(args.workdir, "%s-run%d" % (name, run))
            os.makedirs(run_dir, exist_ok=True)
            out_file = os.path.join(run_dir, "out.ply")
            cmd = [
                args.executable, mesh, str(args.nvertices),
                str(args.gradation), "-d", "0",
                "-of", "out.ply", "-o", run_dir + "/",
            ]
            if args.extra.strip():
                cmd += args.extra.split()
            result = subprocess.run(cmd, env=env, capture_output=True, text=True)
            if result.returncode != 0:
                print(result.stdout)
                print(result.stderr, file=sys.stderr)
                raise SystemExit("ACVD failed on %s run %d" % (name, run))
            outputs.append(out_file)

        if mesh.lower().endswith(".obj"):
            in_points, in_faces = read_obj(mesh)
        else:
            in_points, in_faces = read_ply(mesh)
        out_points, out_faces = read_ply(outputs[0])

        diagonal = float(np.linalg.norm(
            in_points.max(axis=0) - in_points.min(axis=0)))
        haus = hausdorff_points(in_points, out_points)
        retention, bhaus, tolerance = boundary_retention(
            in_points, in_faces, out_points, out_faces, diagonal)
        hashes = [sha256_file(p) for p in outputs]

        rows.append({
            "mesh": name,
            "input_vertices": int(len(in_points)),
            "input_faces": int(len(in_faces)),
            "output_vertices": int(len(out_points)),
            "output_faces": int(len(out_faces)),
            "hausdorff": haus,
            "hausdorff_relative": haus / diagonal if diagonal else 0.0,
            "boundary_retention": retention,
            "boundary_hausdorff": bhaus,
            "boundary_tolerance": tolerance,
            "hash_run1": hashes[0],
            "hash_run2": hashes[1],
            "deterministic": hashes[0] == hashes[1],
        })

    with open(args.report, "w", encoding="utf-8") as fh:
        fh.write("mesh\tVout\tFout\tHausdorff\tHausdorff/bbox\t"
                 "boundary_retention\tboundary_Hausdorff\tdeterministic\t"
                 "sha256\n")
        for row in rows:
            fh.write("%(mesh)s\t%(output_vertices)d\t%(output_faces)d\t"
                     "%(hausdorff).6g\t%(hausdorff_relative).6g\t"
                     "%(boundary_retention).4f\t%(boundary_hausdorff).6g\t"
                     "%(deterministic)s\t%(hash_run1)s\n" % row)

    for row in rows:
        print("%(mesh)-18s V=%(output_vertices)5d F=%(output_faces)5d "
              "H=%(hausdorff).4g (rel %(hausdorff_relative).4g) "
              "border=%(boundary_retention).3f det=%(deterministic)s" % row)


if __name__ == "__main__":
    main()
