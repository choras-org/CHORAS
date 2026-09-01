.. _overlapping_faces:

Overlapping Faces
=================

Description
-----------

.. image:: /_static/images/overlapping.gif
   :align: center
   :alt: Overlapping faces visualization

Overlapping faces are two or more faces that occupy the same spatial region (coplanar or nearly coplanar and overlapping in projection).

Detection
---------

**Detection Method:** Spatial overlap detection using AABB and coplanarity checks

**Algorithm:**

1. For each pair of faces:
   - Check if bounding boxes overlap significantly
   - Test if faces are coplanar (or nearly coplanar within tolerance)
   - If coplanar, check if 2D projections overlap
2. Report overlapping face pairs with overlap region coordinates

**Tolerance:** Implicit (based on face planarity classification)

Auto-Repair
-----------

**Status:** ❌ No automatic repair

**Action:** Detection and reporting only

Manual Fix / Avoidance
----------------------

**In 3D Modelling tools (Before Export):**

1. **Remove duplicates:**
   - Delete obviously duplicate faces
   - If for example, a room floor overlaps with a sofa bottom face, remove one of the faces and connect the remaining face to the mesh properly
