
Configure Remote Simulation Execution
=====================================

.. note::
   This step is only required if you want to offload heavy simulations to HPC clusters (e.g., SURF Cloud).
   To use this feature, a cloud/HPC account with access to a cluster with Singularity installed is required.  
   If you do not have access to such a cluster, you can skip this section and run CHORAS locally on your machine.


SSH Key Setup
-------------

Generate and configure an SSH key on your machine following the GitHub guide:
`Generating a new SSH key and adding it to the ssh-agent <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>`_

In the root directory of the CHORAS repository, open ``docker-compose.yml``.
Add the path to your local SSH key directory in volumes of backend:

.. code-block:: yaml

   platform: linux/amd64
   build:
     context: . # root of CHORAS
     dockerfile: backend/Dockerfile
   ports:
     - "5001:5001"
   env_file:
     - .env.api
   depends_on:
     - db_service
     - redis
   volumes:
     - /var/run/docker.sock:/var/run/docker.sock
     - ./uploads:/app/uploads
     - ./simulation-backend:/app/simulation-backend
     - <absolute-path-to-ssh-directory>/.ssh:/root/.ssh:ro # Add this line

Cloud Configuration Variables
------------------------------

After SSH is configured and you receive your cloud access details (IP address, username, etc.):

1. Go to the backend submodule:

   .. code-block:: bash

      cd backend

2. Open ``config.py`` and update the ``CloudConfig`` class at the end of the file:

   .. code-block:: python

      class CloudConfig:
          """
          Cloud Configuration
          """
          CLOUD_EXECUTOR_HOST = "<cloud-ip>"           # ← Update with your cloud IP
          CLOUD_EXECUTOR_USER = "<cloud-user>"         # ← Update with your username
          CLOUD_EXECUTOR_KEY_PATH = f"{Path.home()}/.ssh/id_ed25519"
          CLOUD_EXECUTOR_DIRECTORY = f"/data/storage/{CLOUD_EXECUTOR_USER}"

3. In the ``CloudConfig`` class, update:

   - The **IP address** of the cloud
   - The **username**

   with the values provided by your cloud/HPC provider (e.g., SURF).

.. note::
   For Cloud/HPC, ``Singularity`` should be installed on it.
