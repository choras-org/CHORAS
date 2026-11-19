.. _boundary_edges:

Boundary Edges
==============

Description
-----------

A boundary edge is an edge that is shared by only one face (instead of the normal two faces in a closed mesh). Boundary edges can be intentional, for example a floating surface representing a furniture inside the room. However, unintentional boundary edges indicate that the mesh is not watertight and may have holes or missing faces.

Detection
---------

**Detection Method:** Edge degree counting

**Algorithm:**

1. Build a complete edge map from all faces
2. For each edge, count how many faces share it
3. Flag edges with degree ≠ 2 as boundary edges
   - Degree 1 = boundary edge (open to outside)
   - Degree 0 = unused edge (orphaned)
   - Degree > 2 = non-manifold (multiple disconnected shells meeting)

Auto-Repair
-----------

**Status:** ❌ No automatic repair

**Action:** Detection and reporting only


Manual Fix / Avoidance
----------------------

**In CAD (Before Export):**

1. **Determine if intentional:**
   - In Blender we can: Enter Edit Mode, then use "Select > Select All by Trait > Non-Manifold"
   - In Non-Manifold select "Turn on Boundaries" to see edges that are not connected properly

