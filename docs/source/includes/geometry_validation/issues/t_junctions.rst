.. _t_junctions:

T-Junctions
===========

Description
-----------

.. image:: /_static/images/t-junction.gif
   :align: center
   :alt: T-junctions visualization

A T-junction is also a form of intersection. It occurs when a vertex lies on the edge of another face (but is not an endpoint of that edge). This creates a topological inconsistency:

- The vertex "belongs" to one face
- The edge it touches "belongs" to a different face
- The shared vertex is not explicitly recognized as an edge endpoint

Detection
---------

**Detection Method:** Geometric vertex-on-edge detection

**Algorithm:**

1. For each vertex V:
   - Check if V lies on any edge E that doesn't have V as an endpoint
2. Use point-on-segment test with numerical tolerance
3. Report vertices that are "inside" other edges

Auto-Repair
-----------

**Status:** ✅ Automatic repair available

**Repair Method:** Vertex insertion and face splitting

- For each T-junction vertex V on edge E:
  - Split edge E into two parts at V
  - Update both faces sharing E to recognize V as an edge endpoint
  - Preserve face connectivity and orientation

**Repair Limitations:**

- May create degenerate faces if insertion point is too close to existing endpoints
- If many T-junctions exist, repair can be slow

Manual Fix / Avoidance
----------------------

**In 3D Modelling Tools (Before Export):**

1. **Detect T-junctions:**
   - It's hard to detect T-junctions with visualization. In Blender we can: Enter Edit Mode, then use "Select > Select All by Trait > Non-Manifold"
   - In Non-Manifold select "Turn on Boundaries" to see edges that are not connected properly
