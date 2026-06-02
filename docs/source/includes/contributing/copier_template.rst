Prerequisites
=============

Install Copier:

.. code-block:: bash

   pip install copier

Or with uv:

.. code-block:: bash

   uv tool install copier

Usage
=====

Creating a New Simulation Method
--------------------------------

From the ``simulation-backend`` directory, run:

.. code-block:: bash

   copier copy https://github.com/choras-org/template_simulation_method ./

Questions You'll Be Asked
-------------------------

Copier will ask you several questions to customize your interface.
These questions cover information about the author,

- **author_name**: Your name
- **author_email**: Your email

the implemented method,

- **method_name**: The name of your simulation method (e.g., "DG", "MyMethod")
- **method_name_lower**: Lowercase version (usually auto-generated)
- **method_description**: Brief description of your method
- **method_keywords**: Comma-separated keywords
- **method_class_name**: Main class name (e.g., "MyMethod")

and dependencies

- **python_version_min**: Minimum Python version (e.g., "3.11")
- **python_version_max**: Maximum Python version (optional)
- **additional_dependencies**: Extra packages needed (comma-separated)

.. note::
   The template always includes ``*.msh`` and ``*.geo`` files (named
   ``test_room_<method_name_lower>.*``) and ``gmsh`` as a dependency.
   Simply remove the ``.msh`` file if your method automatically generates
   mesh files based on the geometry data defined in the ``*.geo`` file.

**About gmsh initialization:** If your method requires ``gmsh.initialize()`` and
``gmsh.finalize()``, add them in your simulation method implementation (not in the CLI).
This keeps the CLI simple and allows better control over gmsh lifecycle.

Example
-------

.. code-block:: bash

   $ copier copy simulation_method_template/ ./

   🎤 Author name
      Your Name
   🎤 Author email
      your.email@example.com
   🎤 What is the name of your simulation method (e.g., "DG", "DE", "Pyroomacoustics")?
      MyMethod
   🎤 What is the lowercase (snake_case) version of your method name (used for package naming)?
      mymethod
   🎤 Brief description of your simulation method
      Python package for acoustic simulation using MyMethod
   ...

This will create a directory structure like:

.. code-block:: text

   mymethod_method/
   ├── Dockerfile
   ├── pyproject.toml
   ├── mymethod_interface/
   │   ├── __init__.py
   │   ├── __main__.py
   │   ├── __cli__.py
   │   ├── definition.py
   │   └── mymethod_interface.py
   └── tests/
       ├── conftest.py
       ├── test_definition.py
       ├── test_mymethod_cli.py
       ├── test_fixtures.py
       ├── test_input_mymethod.json
       └── test_room_mymethod.geo

Next Steps After Generation
===========================

1. **Navigate to your new package:**

   .. code-block:: bash

      cd <method_name_lower>_method

2. **Implement your simulation logic:**
   Edit ``<method_name_lower>_interface/<method_name_lower>_interface.py`` and implement the
   ``_<method_name_lower>_method()`` function.

3. **Update dependencies:**
   Add any specific dependencies your method needs to ``pyproject.toml``.

4. **Update test data:**
   Modify the test JSON file in ``tests/test_input_<test_room_name>.json`` to match your
   method's expected input structure.

5. **Add specific tests:**
   Update the CLI test in ``tests/test_<method_name_lower>_cli.py`` with assertions specific to
   your method.

6. **Install and test:**

   .. code-block:: bash

      pip install -e .
      pytest tests/

7. **Build Docker image:**

   .. code-block:: bash

      docker build -t <method_name_lower>_method .

Structure Explanation
=====================

Package Files
-------------

- **``__init__.py``**: Exports the main class and CLI entry point
- **``__main__.py``**: Allows running as a module (``python -m <package>``)
- **``__cli__.py``**: CLI implementation that reads ``JSON_PATH`` env variable
- **``definition.py``**: Contains the ``SimulationMethod`` abstract base class
- **``<method>_interface.py``**: Your main implementation file

Key Design Patterns
-------------------

1. **Validation in ``SimulationMethod.__init__``**:
   - Single source of truth for input validation
   - Checks for None/empty paths and file existence

2. **CLI calls ``main()`` directly in tests**:
   - Enables in-process mocking of ``requests.post``
   - Avoids subprocess boundary issues

3. **``save_results()`` method**:
   - Handles retries and error logging
   - Sends results back to the simulation executor

4. **Test structure**:
   - ``test_definition.py``: Tests the base class
   - ``test_<method>_cli.py``: Tests the CLI with mocks
   - ``test_fixtures.py``: Tests fixture functionality
   - ``conftest.py``: Shared fixtures for all tests

Customization Tips
==================

If Your Method Doesn't Need Mesh Files
--------------------------------------

The template includes ``.msh`` and ``.geo`` files by default. To remove them:

1. Delete ``tests/test_room_*.msh`` and ``tests/test_room_*.geo``
2. Remove ``gmsh`` from ``pyproject.toml`` dependencies
3. Remove ``gmsh`` from ``Dockerfile``
4. Update ``tests/conftest.py`` to not copy these files
5. Update ``tests/test_input_*.json`` to remove ``geo_path`` and ``msh_path``

If Your Method Needs gmsh Initialization
----------------------------------------

Instead of wrapping the CLI, handle gmsh in your simulation method:

.. code-block:: python

   def run_simulation(self) -> None:
       """Run the simulation."""
       import gmsh

       gmsh.initialize()
       try:
           self._mymethod_method(self.input_json_path)
       finally:
           gmsh.finalize()

This approach:

- Keeps the CLI simple and method-agnostic
- Allows better control over gmsh lifecycle
- Makes it easier to test without gmsh

Adding Custom Simulation Settings
---------------------------------

Edit the test JSON template to include your method-specific settings in the
``simulationSettings`` section:

.. code-block:: json

   "simulationSettings": {
       "your_setting_1": value1,
       "your_setting_2": value2
   }

Integration with CHORAS Backend
===============================

After creating your method:

1. Update the main backend's ``methods-config.json`` to include your new method
2. Add a workflow job in ``.github/workflows/`` if needed
3. Update documentation in the main README

Common Patterns from Existing Methods
=====================================

Reading Input Data
------------------

.. code-block:: python

   with open(json_file_path, "r") as json_file:
       result_container = json.load(json_file)

Extracting Source/Receiver Positions
------------------------------------

.. code-block:: python

   source_coords = [
       result_container["results"][0]["sourceX"],
       result_container["results"][0]["sourceY"],
       result_container["results"][0]["sourceZ"],
   ]
   receiver_coords = [
       result_container["results"][0]["responses"][0]["x"],
       result_container["results"][0]["responses"][0]["y"],
       result_container["results"][0]["responses"][0]["z"],
   ]

Writing Results
---------------

.. code-block:: python

   result_container["results"][0]["responses"][0]["receiverResults"] = results.tolist()

   with open(json_file_path, "w") as json_output:
       json_output.write(json.dumps(result_container, indent=4))
