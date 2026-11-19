.. _zero_area_faces:

Zero Area Faces
===============

Description
-----------

A zero area face is a polygon that has collapsed into a point, line, or has effectively zero area. These faces cannot bound a volume and contribute nothing to the mesh topology. They are typically created by:

- Coincident vertices (point)
- Collinear vertices (line)
- Self-intersecting polygons (bowties, figure-eights)
- Numerical errors in mesh generation

Detection
---------

**Detection Method:** Newell area calculation (signed 3D normal)

**Tolerance:**

- **Area threshold:** ``1e-12`` m² (area squared)
- **Altitude (sliver) threshold:** ``1e-4`` m (0.1 mm)

A face is marked as having **zero area** if:

1. Its calculated area is ≤ 1e-12 m² (effectively zero)

**Why Newell?** The Newell method computes a signed normal by summing cross products around the perimeter. Zero area polygons and bowties produce zero or near-zero results due to cancellation.

Auto-Repair
-----------

**Status:** ✅ Automatic repair available

**Repair Method:** Face removal

- All degenerate faces are deleted from the mesh
- No mesh remeshing is performed; only the face is removed
- Surrounding topology remains unchanged

**Repair Limitations:**

- Removal can create **boundary edges** (edges shared by only one face) or **holes** in the mesh

Manual Fix / Avoidance
----------------------

**In 3D Modelling Tools (Before Export):**

1. **Identify sliver faces:**
   - Use CAD tool's geometry checking
   - Look for very thin or nearly flat triangles

2. **Clean up:**
   - Delete obvious slivers manually
   - Use mesh smoothing or remeshing tools
   - Increase mesh quality/refinement settings

3. **Verify before export:**
   - Ensure all faces have non-zero area
   - Check that no vertices are coincident within mesh tolerance

