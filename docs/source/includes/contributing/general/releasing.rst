Release Guidelines
------------------

Versioning
==========

CHORAS uses the `Semantic Versioning <https://semver.org>`_ scheme.
This means that version numbers are of the form ``MAJOR.MINOR.PATCH``.

In short, this means the following:

- MAJOR version when you make incompatible API changes
- MINOR version when you add functionality in a backward compatible manner
- PATCH version when you make backward compatible bug fixes

If unsure, please refer to the `Semantic Versioning`_ documentation for details.

PRs falling into the PATCH category are made against the main branch (and consequently need a branch off main),
while MINOR and MAJOR changes are made against the develop branch (and consequently need a branch off develop).
Note that PRs that only change documentation or examples are considered PATCH changes.
Updates to the CI configuration or similar infrastructure which do not affect the API
are not considered for version increments.
