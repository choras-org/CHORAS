Releasing
=========

Versioning is handled by `standard-version
<https://github.com/conventional-changelog/standard-version>`_, driven by
`Conventional Commits <https://www.conventionalcommits.org/>`_. It bumps the
version in ``package.json``, updates ``CHANGELOG.md``, and creates a
``chore(release): X.Y.Z`` commit and a matching ``vX.Y.Z`` git tag.

Commit messages
----------------

Use Conventional Commits so the release script can determine the version
bump automatically:

- ``fix: ...`` -> patch release
- ``feat: ...`` -> minor release
- ``feat: ...`` with a ``BREAKING CHANGE:`` footer -> major release

This strategy is based on semantic versioning, see the `versioning section <../general/releasing.html#versioning>`_ in the general contributing guidelines.

Cutting a release
------------------

Run from ``frontend-v2``, on the branch you want to release from:

.. code-block:: bash

   npm run release:dry   # preview the version bump and changelog, no changes
   npm run release       # bump version, update changelog, commit, tag

Force a specific bump instead of the auto-detected one with
``release:patch``, ``release:minor``, or ``release:major``.

To release an exact version instead of a bump level, pass it directly:

.. code-block:: bash

   npm run release -- --release-as 1.2.3

**Then push both the commit and the tag:**

.. code-block:: bash

   git push --follow-tags

A plain ``git push`` does **not** push tags. Forgetting ``--follow-tags`` is
the most common mistake here — it leaves the release commit on the remote
but the tag only on your machine, silently breaking the changelog's compare
links and anyone else's ability to check out that version.

Notes
-----

- There is no CI automation for releases (no release workflow, no
  post-commit hook). The steps above are entirely manual.
- The Docker image build (``.github/workflows/docker-build.yml``) is
  independent of app versioning: it always publishes ``:latest`` on push to
  ``dev`` and does not consume the semver tag.
