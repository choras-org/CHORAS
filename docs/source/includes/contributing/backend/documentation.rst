Documentation Guidelines
------------------------

New code should follow the :doc:`numpy style guide<numpydoc:format>` for the docstring. A docstring has to consist at least of

- a short and/or extended summary,
- the *Parameters* section, and
- the *Returns* section.

Optional fields that are often used are

- *References*,
- *Examples*, and
- *Notes*.

See the `Sphinx homepage <https://www.sphinx-doc.org>`_ for more information.

Building the Documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^

You can build the documentation of your branch using Sphinx by executing the make script inside the docs folder.

.. code-block:: console

    $ cd docs/
    $ make html -j

After Sphinx finishes you can open the generated html using any browser.

.. code-block:: console

    $ build/html/index.html

If the documentation is rebuilt a second time, Sphinx will simply re-build the changes.
As a result, some warnings appear only during the first build.
To reset the build, run

.. code-block:: console

    $ make clean

before re-building the documentation.
