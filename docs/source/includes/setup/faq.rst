.. _faq_install:

Frequently Asked Questions
==========================

Building CHORAS takes a long time
---------------------------------

CHORAS downloads multiple Docker images during the build process.
This can take a while depending on your internet connection. 
After all Docker images have been downloaded, the build process may still take some time, especially on slower machines.
If you have very limited disk space, it may also be helpful to free up some space before building CHORAS, as the build process.
Similarly, if your machine has limited RAM, it may be helpful to close other applications while building CHORAS to speed up the process.

Building CHORAS fails
---------------------

If Docker runs out of resources during the build process and keeps failing to build after freeing up resources, you may need to clear cached Docker images.
This can be done by running the following command in your terminal:

.. code-block:: bash

   docker system prune -a

To additionally clear up all volumes, which will result in the loss of all data stored in the database, you can run:

.. code-block:: bash

   docker system prune -a --volumes

Frontend does not load on macOS (Apple Silicon)
-----------------------------------------------

If the CHORAS web page at ``http://localhost:5173`` stays blank or fails to load on a Mac with Apple Silicon, and the frontend logs show ``fatal error: lfstack.push`` or ``The service is no longer running``, Docker Desktop is emulating the ``amd64`` images without Rosetta.

To fix this, enable **Use Rosetta for x86_64/amd64 emulation on Apple Silicon** in Docker Desktop under **Settings -> General**, click **Apply & restart**, and start CHORAS again (see :ref:`starting-choras`).
No rebuild is needed.
