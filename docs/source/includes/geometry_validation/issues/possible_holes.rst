.. _possible_holes:

Possible Holes
==============

Description
-----------

A possible hole is a closed loop of boundary edges that suggests a missing face or gap in the mesh. Unlike boundary edges (which report every unpaired edge individually), a possible hole is a **closed loop** of connected boundary edges that traces the perimeter of a suspected hole.

Possible holes indicate the mesh is not fully closed/watertight in some region, or that a filled interior region has a rim of boundary edges rather than a solid face.

Detection
---------

**Detection Method:** Boundary edge loop tracing + coplanarity check

Auto-Repair
-----------

**Status:** ❌ Detection and reporting only (no automatic repair)

**Action:** Possible holes are reported with coordinates of the loop edges, but no repair is attempted.

Manual Fix / Avoidance
----------------------

**In 3D Modelling Tools (Before Export):**

1. **Check for gaps:**
   - In Blender: Enter Edit Mode, then use "Select > Select All by Trait > Non-Manifold"
   - Select "Turn on Boundaries" to visualize unpaired edges
   