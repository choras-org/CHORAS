Release Workflow
================

A reminder for the maintainers on how to release a new version.

The ``simulation-backend`` repo has two release tracks:

1. Independent **per-method releases** — each packaged simulation method (``de``, ``dg``, ``pyroomacoustics``, ``sparrowpy``, ``misuka``, ``modart``) is versioned independently with a scoped SemVer tag (e.g. ``dg-v1.2.0``). Run ``bump-my-version`` from **inside** the method's directory.
2. **Umbrella releases** to release a new version bundling all simulation methods — the whole repo gets a plain ``vX.Y.Z`` tag whenever there are changes to any of the simulation methods or the configuration files in the repository. Run ``bump-my-version`` from the **repository root**.

For the general versioning scheme, see the
`versioning section <../general/releasing.html#versioning>`_
in the general contributing guidelines.

----

Releasing a simulation method
------------------------------

Each of the simulation methods (e.g. ``de``, ``dg``, ``pyroomacoustics``, ...) is versioned independently.
Tags are **scoped** to avoid ambiguity with each other and with the umbrella tag:
``dg-v1.2.0``, ``de-v0.9.1``, etc.

Patch releases are made directly on ``main``; minor and major releases are branched
off ``develop`` and merged into ``main`` before tagging, following the same
branch strategy as the backend. In case multiple PRs are planned for a single ``minor`` release,
it might be worth considering creating a scoped ``develop`` branch such as ``develop/de``.

Prepare the release
~~~~~~~~~~~~~~~~~~~

- Update the method's ``HISTORY.rst`` (inside ``<method>_method/``) and commit any
  outstanding changes.
- Run the method's test suite and make sure all tests pass.

Incrementing the version number
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Each method carries has an individual configuration for ``bumpversion`` section inside its
``<method>_method/pyproject.toml``
On use, bumpversion will set a method specific git tag (e.g. ``dg-v{new_version}``).

**Run the bump command from inside the method's directory** so that
``bump-my-version`` picks up the correct config:

.. code-block:: console

   $ cd dg_method
   $ bump-my-version bump patch --verbose

Replace ``dg_method`` with the relevant method directory and ``patch`` with
``minor`` or ``major`` as appropriate.
This updates the version in ``pyproject.toml``, commits the change, and creates the
scoped git tag (e.g. ``dg-v0.1.1``) in one step.

Publishing the new version
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Push the commit and the new scoped tag from the **repository root**:

.. code-block:: console

   $ git push --follow-tags

Post-release steps
~~~~~~~~~~~~~~~~~~

Check whether the method's interface change also requires an update to
``methods-config.json`` or any ``example_settings/*.json`` file.
If so, make that update and bump the umbrella version as a **separate, deliberate
step** — see `Releasing the simulation-backend umbrella`_ below.

----

Releasing the simulation-backend umbrella
------------------------------------------

The umbrella version (root ``pyproject.toml``, plain ``vX.Y.Z`` tag) tracks the
**shared configuration** that no individual method owns:

- ``methods-config.json`` — the method registry read by the backend at runtime.
- ``example_settings/<method>_setting.json`` — per-method settings files.
- The set of packaged methods itself (method added or removed).

Bump this version whenever any of the above change — independent of any per-method
version bump.
A method's own ``bump-my-version`` run **never** touches this; the umbrella bump is
always a deliberate, separate step.

When to bump
~~~~~~~~~~~~

In addition to the `versioning section <../general/releasing.html#versioning>`_, you can consider the following:

- **MAJOR** — breaking change to ``methods-config.json`` schema or a method's settings contract.
- **MINOR** — new method added to ``methods-config.json``, or a backward-compatible change to a settings file or config entry.
- **PATCH** — bug fix or correction in settings/config.

Prepare the release
~~~~~~~~~~~~~~~~~~~

- Update ``HISTORY.rst`` at the **repository root** and commit any outstanding changes.
- Confirm the relevant method's scoped release (if any) has already been tagged and
  pushed before bumping the umbrella.

Incrementing the version number
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run from the **repository root** (the root ``pyproject.toml`` is the config target):

.. code-block:: console

   $ bump-my-version bump patch --verbose

Replace ``patch`` with ``minor`` or ``major`` as appropriate.
This updates the version in the root ``pyproject.toml``, commits the change, and
creates the plain ``vX.Y.Z`` tag in one step.

Publishing the new version
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Push the commit and tag:

.. code-block:: console

   $ git push --follow-tags

Post-release steps
~~~~~~~~~~~~~~~~~~

After the umbrella tag is pushed, update the ``simulation-backend`` submodule pointer
in the CHORAS umbrella repo to this new tag.
See the `CHORAS versioning guide <../general/releasing.html#updating-the-combined-choras-version>`_
for the full combined-CHORAS-version procedure.
