.. _geometry_validation:

Geometry Validation & Repair Pipeline
======================================

Overview
--------

The geometry validation and repair pipeline is a critical component of CHORAS that ensures input geometries meet the requirements for acoustic simulation. The pipeline performs three main stages:

1. **Detection** — Validates geometry against a set of rules to identify defects and inconsistencies
2. **Repair** — Automatically fixes common issues where possible (e.g., removing degenerate faces, merging duplicate vertices)
3. **Export** — Produces solver-ready output files in multiple formats (OBJ, Rhino 3DM, Gmsh `.geo`)

Geometry Issues & Validation Details
-------------------------------------

The following sections describe each geometry issue type, its tolerance, repair limitations, and manual fix/avoidance strategies:

.. toctree::
   :maxdepth: 2

   issues/duplicate_vertices
   issues/zero_area_faces
   issues/collinear_faces
   issues/non_planar_faces
   issues/self_intersections
   issues/t_junctions
   issues/small_faces
   issues/overlapping_faces
   issues/possible_holes
   issues/boundary_edges
