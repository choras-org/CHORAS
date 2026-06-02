Getting Started using CHORAS
============================

Downloading CHORAS
------------------

In your terminal run the following commands to clone the CHORAS repository and initialize the submodules:

.. code-block:: bash

   git clone https://github.com/choras-org/CHORAS.git
   cd CHORAS

This repository includes three submodules that need to be initialized:

- ``frontend-v2``
- ``backend``
- ``simulation-backend``

This can be achieved by executing the following command within the CHORAS repository:

.. code-block:: bash

   git submodule update --init --recursive

.. _building-choras:

Building CHORAS
---------------


Building all components of CHORAS will require **at least 15 GB** of free disk space.
Make sure you have sufficient space before proceeding.

From the root directory of the CHORAS repository (see the previous section):

.. note:: 
   
   Make sure **Docker Desktop** is running.


1. In the terminal, run:

.. tab-set::

   .. tab-item:: Linux/MacOS

      .. code-block:: bash

         sh CHORAS_BUILD.sh

   .. tab-item:: Windows

      .. code-block:: bash

         .\CHORAS_BUILD.bat

This script builds and starts all required containers.

2. Once the build completes, open your browser and go to:
   `http://localhost:5173/ <http://localhost:5173/>`_

If you face any issues during the build process, please refer to the :ref:`faq_install` section for troubleshooting tips.

You should now see the CHORAS user interface.

.. note:: 

   Please refer to the :ref:`starting-choras` section for instructions on how to start CHORAS in the future without rebuilding it.