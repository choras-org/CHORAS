.. _small_faces:

Small Faces
===========

Description
-----------

A small face is a polygon whose longest dimension (bounding box extent) is below the tolerance threshold.

These faces are almost always modelling artifacts or unintended slivers, as acoustic wave-based solvers degrade with faces much smaller than the wavelength of interest.

Detection
---------

**Detection Method:** Bounding-box max-dimension check

**Tolerance:** ``0.10 m`` (10 cm) — absolute, scale-independent

The pipeline checks each face's **maximum extent** in any direction (x, y, or z):

This catches any face whose bounding box fits within a 10 cm cube, regardless of actual area.

Auto-Repair
-----------

**Status:** ❌ No automatic repair

**Action:** Detection and reporting only


Manual Fix / Avoidance
----------------------

**In 3D Modelling tools (Before Export):**

1. **Remove or merge:**
   - Delete small faces if they're artifacts
   - Merge with neighboring faces (if topology allows)
   
