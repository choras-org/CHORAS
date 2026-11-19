.. _duplicate_vertices:

Duplicate Vertices
===================

Description
-----------

This issue occurs when two or more vertices in the mesh occupy nearly the same spatial location. These are often introduced during mesh import from CAD systems or when combining multiple mesh objects.

Duplicate vertices can cause:

- Inconsistent topology (ambiguous face connectivity)
- Numerical errors in intersection and planarity calculations
- Issues with mesh processing and repair algorithms

Detection
---------

**Detection Method:** Euclidean distance comparison

**Tolerance:** ``1e-2`` (0.01 m = 1 cm)

Vertices within this distance are considered duplicates. This tolerance is intentionally large to catch duplicates introduced during CAD export where coordinate precision can be limited.

.. note::
   The tolerance is **absolute** (scale-independent). For very small models (< 1 cm), adjust the tolerance in the pipeline configuration.

Auto-Repair
-----------

**Status:** ✅ Automatic repair available

**Repair Method:** Vertex deduplication

- All duplicate vertices are merged into a single representative vertex (if within tolerance)
- Face definitions are updated to reference the merged vertex
- The merge is deterministic (earlier vertices are preserved)

**Repair Limitations:**

- If multiple vertices merge, the resulting position is the average of all duplicates
- This can introduce small shifts in geometry (on the order of the tolerance)
- No repair logging is performed for individual merge pairs (only count)

Manual Fix / Avoidance
----------------------

**In 3D Modelling Tools (Before Export):**

1. **Use mesh cleanup tools:**
   - In Blender: use "Mesh > Merge by Distance" to merge nearby vertices
  