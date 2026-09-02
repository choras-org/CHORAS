Release Workflow
================

A reminder for the maintainers on how to release a new version.

Prepare the release
~~~~~~~~~~~~~~~~~~~

When preparing for a new major or minor release, please merge the dev branch into main.
Patch releases are directly made on the main branch without merging from dev.
The following steps are then required to prepare a new release:

- Make sure that the changelog in HISTORY.rst is up to date and update if neccessary.
- Commit all required changes.
- Run the test suite and ensure that all tests pass.

Incrementing the version number
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The CHORAS backend uses `bump-my-version <https://pypi.org/project/bump-my-version/>`_ to manage version numbers.
For more information on the versioning scheme, please refer to the `versioning section <../general/releasing.html#versioning>`_ in the general contributing guidelines

To increment the version number (can be major, minor, or patch), run the following commands:

.. code-block:: console

   $ bump-my-version bump patch --verbose


This will update the version number in all required files and create a git tag for the new version.
The --verbose flag will output all files that were changed.

Publishing the new version
~~~~~~~~~~~~~~~~~~~~~~~~~~

Finally, the tag needs to be pushed to the remote repository via:

.. code-block:: console

   $ git push --follow-tags


Afterwards, the test suite will automatically be run remotely.

Post-release steps
~~~~~~~~~~~~~~~~~~

After the release is published, please make sure to merge the main branch back into develop.
