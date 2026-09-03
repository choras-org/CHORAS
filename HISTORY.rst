=======
History
=======

Unreleased
----------

0.2.0 (2026-09-03)
------------------

This is only a list of highlights of the changes made since the last release.

This version of CHORAS uses the following versions of

- frontend: v0.1.0
- backend: v0.2.0
- simulation-backend: v0.1.0

For a complete list of changes, please refer to the changelogs of backend, frontend, and simulation-backend.

Added
^^^^^

- Added the following simulation methods:

  - `misuka <https://github.com/misuka-renderer/misuka>`_
  - `sparrowpy <https://github.com/sparrow-acoustics/sparrowpy>`_
  - `MoD-ART <https://github.com/IoSR-Surrey/MoD-ART>`_

- Added support for configuring local and remote (SSH access) execution of simulations
- Include an example project to get started quickly
- Room acoustic parameter calculation on all simulation methods

Fixed
^^^^^

- Fixed errors and improved geometry conversion and mesh import.
- Multiple user interface improvements and bug fixes.

Changed
^^^^^^^

- Simulation methods are now executed in separate isolated Docker containers, which are started and removed on demand.


0.1.0 (2025-11-04)
------------------

Version of CHORAS used at ASSA 2025.
