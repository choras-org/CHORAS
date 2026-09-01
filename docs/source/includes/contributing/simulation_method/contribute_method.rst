The Simulation Method Interface
===============================

Each simulation method interface in CHORAS is implemented in the format of a Python package which also specifies a command line interface (CLI) for running the method.


The CHORAS backend shares information and data with the simulation methods via JSON files.
When a simulation is scheduled, the backend writes a JSON file with all required configurations and input data.
The simulation method's interface executes the simulation based on the provided configuration and extends the same JSON
file with progress updates and finally the results, which are then returned and read by the backend.
Since the each simulation method is executed in an encapsulated container and does not have access to the backend, the JSON file is the only way to communicate with the backend.
Accordingly, also error messages are requred to be written to the JSON file, so that the backend can read and forward them to the frontend where they are displayed for the user.


Creating the Scaffolding
------------------------

To simplify the process of adding a new method, we provide a template using the ``copier`` tool.
Copier allows you to generate a customized template based on input you provide.

You can install copier with pip:

.. code-block:: bash

   pip install copier

Or with uv:

.. code-block:: bash

   uv tool install copier

From the ``simulation-backend`` directory, run:

.. code-block:: bash

   copier copy https://github.com/choras-org/template_simulation_method ./ --trust

Note that the ``--trust`` flag is required. No code will be executed except for printing additional instructions.

.. warning::
   Make sure to run the above command from the ``simulation-backend`` directory or that you point the output path correctly, otherwise the generated files will be created in the wrong location.

Questions for Customization
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copier will ask you several questions to customize your interface.
These questions cover information about the author, the implemented method, and dependencies.

.. note::
   The template always includes ``*.msh`` and ``*.geo`` files (named
   ``test_room_<method_name_lower>.*``) and ``gmsh`` as a dependency.
   Simply remove the ``.msh`` file if your method automatically generates
   mesh files based on the geometry data defined in the ``*.geo`` file.

**About gmsh initialization:** If your method requires ``gmsh.initialize()`` and
``gmsh.finalize()``, add them in your simulation method implementation (not in the CLI).
This keeps the CLI simple and allows better control over gmsh lifecycle.

Example
~~~~~~~

.. code-block:: bash

   $ copier copy https://github.com/choras-org/template_simulation_method ./

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
---------------------------

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

      docker build -f ./Dockerfile ../ --platform=linux/amd64 -t <method_name_lower>-test:latest


Dependencies
~~~~~~~~~~~~

- Include your method's dependencies with **explicit version numbers**.
- Prefer libraries that are installable via pip
- If your package is only hosted in a git repository, you can install it using:

  .. code-block:: shell

     "package_name @ git+https://gitprovider.com/user/project.git@{version}"

  If your package does not have a version number, you can use the commit hash:

  .. code-block:: shell

     "package_name @ git+https://gitprovider.com/user/project.git@{commit_hash}"

Refer to the `Python Packaging Authority guide <https://packaging.python.org/en/latest/tutorials/installing-packages/#installing-from-vcs>`_ for more options.

**Note that providing a specific version number (or hash) is important** to ensure reproducibility (and stability) of the results and CHORAS as a platform. If your method is not yet installable via pip, please refer to `packaging guidelines <https://packaging.python.org/en/latest/flow/>`_ provided by the Python Packaging Authority.

Structure Explanation
~~~~~~~~~~~~~~~~~~~~~

- ``definition.py``: Contains the ``SimulationMethod`` abstract base class.

  - Specifies the required methods for any simulation method implementation.
  - Checks for None/empty paths and file existence.
  - Provides a standardized way to export results to the backend and database.

- ``<method>_interface.py``: Your main implementation file

  - Implements the simulation logic into the standardized interface defined by ``SimulationMethod``.
- ``__init__.py``: Exports the main class and CLI entry point
- ``__main__.py``: Allows running as a module (``python -m <package>``)
- ``__cli__.py``: CLI implementation that reads ``JSON_PATH`` env variable
- ``tests/``: Contains tests for your method

  - ``test_definition.py``: Tests the base class
  - ``test_<method>_cli.py``: Tests the CLI with mocks
  - ``test_fixtures.py``: Tests fixture functionality
  - ``conftest.py``: Shared fixtures for all tests


Customization Tips
------------------

Mesh Files
~~~~~~~~~~

The template includes ``.msh`` and ``.geo`` files by default. To remove them:

1. Delete ``tests/test_room_*.msh`` and ``tests/test_room_*.geo``
2. Remove ``gmsh`` from ``pyproject.toml`` dependencies
3. Remove ``gmsh`` from ``Dockerfile``
4. Update ``tests/conftest.py`` to not copy these files
5. Update ``tests/test_input_*.json`` to remove ``geo_path`` and ``msh_path``

Gmsh Initialization
~~~~~~~~~~~~~~~~~~~

Gmsh requires explicit initialization and finalization.
Try to keep gmsh-related code as compact as possible and make sure that ``gmsh.finalize()`` is always called, even if errors occur.

This can for example be achieved by wrapping corresponding code in a try-finally block:

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

- Allows better control over gmsh lifecycle
- Makes it easier to test without gmsh

Adding Custom Simulation Settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Edit the test JSON template to include your method-specific settings in the
``simulationSettings`` section:

.. code-block:: json

   "simulationSettings": {
       "your_setting_1": value1,
       "your_setting_2": value2
   }

Writing Error Messages to the JSON File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As mentioned above, the simulation method interface is executed in an encapsulated container and does not have access to the backend.
To surface error messages to the user, they need to be forwarded to the backend via the JSON file.
This can be done by writing the error type and message to the ``error`` field in the JSON file.

.. code-block:: python

   json_config_file['error'] = {
        'type': "RuntimeError",
        'message': "Simulation failed due to ....",
   }


For convenience, it is recommended to catch exceptions in the main function implemented in ``__cli__.py`` of your method to avoid redundant error handling.
An example is given below:

.. code-block:: python

   def main() -> None:
       # JSON path in the uploads folder. This variable is set for the
       # container when it is started up.
       json_file_path = os.environ.get("JSON_PATH")

       simulation_method_object = MySimulationMethod(json_file_path)
       try:
           simulation_method_object.run_simulation()
       except Exception as e:
           # Write error to result JSON so backend can read it
           with open(json_file_path) as f:
               json_config_file = json.load(f)
           json_config_file['error'] = {
               'type': type(e).__name__,
               'message': str(e),
           }
           with open(json_file_path, 'w') as f:
               json.dump(json_config_file, f, indent=4)

           # Ensure the container exits with exit code 1 to indicate failure
           # The status code is used by the backend to determine if the simulation
           # was successful or not.
           sys.exit(1)

       # Save the results to a separate file
       simulation_method_object.save_results()


In the example, any exception raised during the execution of ``run_simulation()`` is caught and written to the JSON file, so that the backend can read it and forward it to the frontend for display to the user.

Common Patterns
---------------

Reading Input Data
~~~~~~~~~~~~~~~~~~

.. code-block:: python

   with open(json_file_path, "r") as json_file:
       result_container = json.load(json_file)

Extracting Source/Receiver Positions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~

For impulse responses, the sampling rate is defined by the frontend and can be
assessed by ``input_data["simulationSettings"]["sampling_rate"]``. The impulse
response is provided as follows:

.. code-block:: python

   result_container["results"][0]["responses"][0]["receiverResults"] = results.tolist()

   with open(json_file_path, "w") as json_output:
       json_output.write(json.dumps(result_container, indent=4))


for energy time curves - The results are appended for each frequency band.
Here is an example for the ``energy_decay_curve`` for the 125 Hz frequency band
and its ``times_vector``:

.. code-block:: python

   result_container["results"][0]["responses"][i_rec]["receiverResults"].append(
      {
         "data": energy_decay_curve.tolist(),
         "t": times_vector.tolist(),
         "frequency": 125,
         "type": "edc",
      }
   )
