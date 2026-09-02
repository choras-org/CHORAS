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


Updating the combined CHORAS version
====================================

After tagging a new simulation-backend umbrella release (plain ``vX.Y.Z``), update
the ``simulation-backend`` submodule pointer in the CHORAS umbrella repo to that tag
and bump the combined CHORAS version:

1. Check out ``simulation-backend`` at the new tag:

   .. code-block:: console

      $ git -C simulation-backend checkout vX.Y.Z
      $ git add simulation-backend

2. Commit and tag the umbrella repo:

   .. code-block:: console

      $ git commit -m "Bump CHORAS version: update simulation-backend to vX.Y.Z"
      $ git tag vA.B.C

3. Push:

   .. code-block:: console

      $ git push --follow-tags
