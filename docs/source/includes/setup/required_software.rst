Required Software
=================

To run CHORAS, you need to have the following software installed on your machine:

- git
- Docker Desktop (with WSL 2 backend for Windows users)


Git Installation
----------------

Install the latest version of Git from:
`https://git-scm.com/downloads <https://git-scm.com/downloads>`_

Follow the installer's default settings.


Docker Setup
------------

.. warning::
   If you're on Windows and unsure whether you need ``amd64`` or ``arm64``,
   go to **Settings -> System -> About**. It will say *"x64-based processor"*
   for AMD, or *"ARM-based processor"* for an ARM chip.

1. Install Docker using the default settings.
2. Open **Docker Desktop** (the application must be running for CHORAS to work).
3. When prompted to sign in/up, click **Continue without signing up** or **Skip**.
4. If Docker Desktop tells you that WSL needs updating, click **Restart**.
   If this doesn't work, open your terminal and run:

   .. code-block:: bash

      wsl --update
