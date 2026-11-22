Frequently Asked Questions
==========================

Geometry not found
------------------

If you encounter an error message indicating that **Project not found** or the **geometry file cannot be found** when trying to load a project, it may be due to a database issue.
To resolve this issue, you can try the following steps:

1. Stop CHORAS if it is currently running.
2. Open a terminal and navigate to the root directory of the CHORAS repository.
3. Run the following command to reset the database:

.. code-block:: bash

    docker compose down -v

.. warning:: 

   This command will remove all associated volumes, which will result in the loss of all data stored in the database. 

5. After the command completes, start CHORAS again using the build script or the ``docker compose up`` command (see :ref:`building-choras` or :ref:`starting-choras`).

Frontend does not load on macOS (Apple Silicon)
-----------------------------------------------

If the CHORAS web page at ``http://localhost:5173`` stays blank or fails to load on a Mac with Apple Silicon, and the frontend logs show ``fatal error: lfstack.push`` or ``The service is no longer running``, Docker Desktop is emulating the ``amd64`` images without Rosetta.

To fix this, enable **Use Rosetta for x86_64/amd64 emulation on Apple Silicon** in Docker Desktop under **Settings -> General**, click **Apply & restart**, and start CHORAS again (see :ref:`starting-choras`).
No rebuild is needed.
