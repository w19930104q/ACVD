#!/usr/bin/env python3
"""Generate a deterministic triangular PLY mesh with a scalar color boundary.

The mesh is a regular grid in the XY plane triangulated into two triangles
per cell. A scalar field splits the grid into two regions (left=0, right=1)
along a sharp vertical line, and a rectangular hole is punched in the middle
so the output exercises both color-boundary and topological-hole protection.

The writer emits ASCII PLY with a per-vertex `region` scalar property. Run with
`python3 -I` and pass all paths as arguments; the output directory is expected
to be an isolated, dedicated folder for this untrusted-looking synthetic data.
"""

import argparse


def build_grid(nx, ny, spacing):
    points = []
    grid_id = [[-1 for _ in range(nx + 1)] for _ in range(ny + 1)]
    for j in range(ny + 1):
        for i in range(nx + 1):
            grid_id[j][i] = len(points)
            points.append((i * spacing, j * spacing, 0.0))

    def in_hole(i, j):
        # rectangular hole in the central area
        return (nx // 2 - 2 <= i <= nx // 2 + 1 and
                ny // 2 - 2 <= j <= ny // 2 + 1)

    faces = []
    for j in range(ny):
        for i in range(nx):
            corners = [
                grid_id[j][i], grid_id[j][i + 1],
                grid_id[j + 1][i + 1], grid_id[j + 1][i],
            ]
            if in_hole(i, j):
                continue
            # two triangles per cell, consistent CCW winding in XY
            faces.append((corners[0], corners[1], corners[2]))
            faces.append((corners[0], corners[2], corners[3]))

    # per-vertex region label: discontinuity at the middle column
    mid = (nx + 1) // 2
    regions = [0 if i < mid else 1
               for j in range(ny + 1) for i in range(nx + 1)]
    return points, faces, regions


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True)
    parser.add_argument("--nx", type=int, default=24)
    parser.add_argument("--ny", type=int, default=24)
    parser.add_argument("--spacing", type=float, default=1.0)
    args = parser.parse_args()

    points, faces, regions = build_grid(args.nx, args.ny, args.spacing)

    with open(args.out, "w", encoding="ascii") as fh:
        fh.write("ply\n")
        fh.write("format ascii 1.0\n")
        fh.write("element vertex %d\n" % len(points))
        fh.write("property float x\n")
        fh.write("property float y\n")
        fh.write("property float z\n")
        fh.write("property int region\n")
        fh.write("element face %d\n" % len(faces))
        fh.write("property list uchar int vertex_indices\n")
        fh.write("end_header\n")
        for (x, y, z), region in zip(points, regions):
            fh.write("%g %g %g %d\n" % (x, y, z, region))
        for tri in faces:
            fh.write("3 %d %d %d\n" % tri)

    print("wrote %s: %d vertices, %d faces" %
          (args.out, len(points), len(faces)))


if __name__ == "__main__":
    main()
