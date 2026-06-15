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