=======
History
=======

Unreleased
----------

0.3.0 (2026-11-24)
------------------

This is only a list of highlights of the changes made since the last release.

This version of CHORAS uses the following versions of

- frontend: v0.2.0
- backend: v0.3.0
- simulation-backend: v0.2.0

For a complete list of changes, please refer to the changelogs of backend, frontend, and simulation-backend.

Added
^^^^^

- Geometry inspection and repair: uploaded models are checked for issues and
  repaired in the background, users can accept or reject the repaired geometry,
  and each simulation method reports whether it can handle the original and the
  repaired geometry (choras-org/CHORAS#80, choras-org/backend#143,
  choras-org/backend#156, choras-org/backend#160, choras-org/backend#164,
  choras-org/backend#166, choras-org/frontend-v2#209,
  choras-org/simulation-backend#32, choras-org/simulation-backend#56)
- Interactive result plots of the impulse response, energy decay curve and
  spectrum (choras-org/backend#138, choras-org/backend#165,
  choras-org/frontend-v2#192)
- Database migrations, applied automatically on startup, so existing databases
  are upgraded without manual steps (choras-org/backend#137, choras-org/CHORAS#97)
- Production Docker image for the frontend, served by Nginx
  (choras-org/frontend-v2#207, choras-org/CHORAS#96)
- Several CHORAS instances can share one Docker host, with optional CPU and
  memory limits for simulation containers (choras-org/backend#153)
- Atmospheric rendering for misuka: speed of sound and air attenuation
  (choras-org/simulation-backend#34)

Fixed
^^^^^

- Room acoustic parameters: EDT and T20 of DE, and EDT, T20 and T30 of sparrowpy
  and misuka (choras-org/simulation-backend#34, choras-org/simulation-backend#53,
  choras-org/simulation-backend#54)
- Geometry and material handling in sparrowpy, DG and pyroomacoustics, so
  non-rectangular surfaces, physical groups and per-surface absorption are
  simulated correctly (choras-org/simulation-backend#42,
  choras-org/simulation-backend#48, choras-org/simulation-backend#50,
  choras-org/simulation-backend#52, choras-org/simulation-backend#55)
- The selected simulation method is no longer overwritten when a simulation is
  loaded (choras-org/frontend-v2#210)

Changed
^^^^^^^

- Faster sparrowpy simulations, and a coarser surface mesh for pyroomacoustics
  so large rooms stay tractable (choras-org/simulation-backend#41,
  choras-org/simulation-backend#52)
- DG treats absorption coefficients as random-incidence values, which changes
  its results (choras-org/simulation-backend#51)

0.2.1 (2026-11-04)
------------------

This version of CHORAS uses the following versions of

- frontend: v0.1.0
- backend: v0.2.1
- simulation-backend: v0.1.0

For a complete list of changes, please refer to the changelogs of backend, frontend, and simulation-backend.

Fixed
^^^^^

- Explicitly set the psycop2 dialect. Fixes database access for the backend

Added
^^^^^

- Add documentation on explicitly specifying the psycopg2 dialect when connecting to a PostgreSQL database in the backend.

Changed
^^^^^^^

- Updated the accent color in the docs to match the orange used in dark mode.

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
