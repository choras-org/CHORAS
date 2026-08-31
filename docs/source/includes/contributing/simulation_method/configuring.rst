Integrating a new Method
========================

Add Example Settings
--------------------

Add a JSON file describing your method's adjustable parameters in ``example_settings/``.
This will be used by the frontend to generate the UI for the method.

This file is required to follow the following example structure.
Explanations of each field are provided below:

.. code-block:: json

    {
        "type": "SimulationSettings",
        "options": [
            {
                "name": "MyNewMethod parameter 1",
                "description": "This is the most important setting, but does nothing.",
                "id": "mnm_setting_1",
                "type": "float",
                "display": "text",
                "min": 0.0,
                "max": 100.0,
                "default": 50.0,
                "step": 0.1,
                "endAdornment": ""
            },
            {
                "name": "MyNewMethod parameter 2",
                "description": "This is another setting for MyNewMethod.",
                "id": "mnm_setting_2",
                "type": "int",
                "display": "text",
                "min": 1,
                "max": 10,
                "default": 5,
                "step": 1,
                "endAdornment": ""
            }
        ]
    }

- At the top level there would be an object with the two fields:

  - ``type``: Specified as ``"SimulationSettings"``
  - ``options``: Array of objects for settings options

- Each object in that array describes one configurable parameter and uses the following fields:

  - ``name``: Human-readable label shown in the UI, It should be short and concise, but descriptive enough for users to understand what the parameter does.``
  - ``description``: Human-readable description shown in the UI via a tooltip. This can be used for longer explanations of the parameter, its purpose, and how it affects the simulation."``
  - ``id``: Internal identifier used in backend/frontend logic. It must be unique per method.
  - ``type``: Data type of the parameter value. Supported include (but are not limited to) ``"float"``, ``"int"``, ``"bool"``, and ``"string"``.
  - ``display``: How this parameter is rendered in the UI, e.g. ``"text"`` for a text/number input field (could be other widgets if supported, such as sliders, dropdowns, etc.).
  - ``min``: Minimum allowed value for numeric types. Used for validation and UI constraints. Note that this is not a hard limit, and the backend should also validate the value.
  - ``max``: Maximum allowed value for numeric types. Also used for validation and UI constraints. Note that this is not a hard limit, and the backend should also validate the value.
  - ``default``: Default value if the user does not provide one. Can be ``null`` if you want to force the user or backend to set it explicitly.
  - ``step``: Increment used in the UI for numeric inputs (e.g. how much the value changes when the user uses arrow keys or a slider).
  - ``endAdornment`` *(optional)*: Optional string shown next to the field in the UI, often for units (e.g. ``"dB"``, ``"m"``, ``"s"``). Empty string if not needed.

Update Method Configuration
---------------------------

To allow CHORAS to recognize the newly added method,  add a new entry to the ``methods-config.json`` in the ``simulation-backend`` directory.
This file lists all available simulation methods.

The following structure is required for a new entry. Descriptions of each field are provided below the example:

.. code-block:: json

    {
        "simulationType": "mynew_method",
        "containerImage": "mynew_image:latest",
        "envVars": {
            "MYNEW_ENV_VAR": "value"
        },
        "label": "My New Method",
        "entryFile": "mynew_method_entry.py",
        "setting": "mynew_method_settings.json",
        "repositoryURL": "https://github.com/myusername/mynew_method",
        "documentationURL": "https://mynewmethod.readthedocs.io"
    }


- ``simulationType``: The short name of the simulation acting as an identifier
- ``containerImage``: Name for the container image to be made
- ``envVars``: Dictionary of specific environment variables (if required) for Docker containers
- ``label``: Name of the method
- ``entryFile``: Python entry point to start execution
- ``setting``: Setting file name so that it can be loaded in frontend and backend
- ``repositoryURL``: Link to the original repository of the simulation method
- ``documentationURL``: Link to the documentation of the simulation method

Update CHORAS
-------------

Docker Image Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~

Open the ``docker-compose.yml`` in the CHORAS root directory and add your method under ``services``:

.. code-block:: yaml

   services:
     # ... existing services ...
     mynew-method:                         # ← Your method name (kept as service name)
       platform: linux/amd64              # ← Keep unchanged
       build:
         context: ./simulation-backend    # ← Keep unchanged
         dockerfile: new_method/Dockerfile  # ← Path to your Dockerfile
       image: mynew_image:latest          # ← EXACTLY match methods-config.json
       profiles:
         - sim_method                     # ← Keep unchanged

Modify the Build Script
~~~~~~~~~~~~~~~~~~~~~~~

In the root directory, go to the ``CHORAS_BUILD.sh`` file and add the following commands based on your method before the ``docker compose up`` command:

.. code-block:: bash

   # Export new method image for backend executor
   echo "📦 Exporting MyNewMethod image..."
   docker save -o backend/app/services/executors/mynew_image.tar mynew_image:latest
   echo "✅ Docker image exported: mynew_image.tar"

.. note::
   **Replace**: ``mynew_image.tar`` & ``mynew_image:latest`` with your actual image name.

After this, delete the DB volume and all containers, and run the ``CHORAS_BUILD.sh`` bash command again.

Debugging Execution
-------------------

If a simulation fails (you see a **"Simulation Failed"** alert at the top of the screen),
you can inspect the underlying container logs.

1. Open ``backend/app/services/executors/local_executor.py``.

2. Locate the line that removes the container after execution (for example, a call that
   stops or removes the container when it finishes):

   .. code-block:: python

      try:
          client = docker.from_env()
          container = client.containers.run(
              image=image,
              environment=env,  # JSON_PATH is the container path, valid in child too
              volumes={
                  host_uploads_dir: {
                      "bind": container_uploads_dir,  # same path in child container
                      "mode": "rw",
                  }
              },
              detach=True,
              working_dir=self.work_dir,
              name=container_name,
              # remove = True, # ← Comment This one
          )
          return container

      except Exception as e:
          logger.error(f"Failed to start Docker container: {e}")
          raise

3. Temporarily comment out that line so the container is not removed automatically.

4. Rebuild the image and container. With the container kept alive after the simulation ends, you can open your container
   runtime (e.g., Docker) and inspect the container logs to see detailed error messages
   and tracebacks for the simulation method execution.
