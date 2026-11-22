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

5. **macOS with Apple Silicon (M1/M2/M3/...) only:** CHORAS uses ``amd64``
   Docker images, which Docker Desktop has to emulate on Apple Silicon.
   Enable Rosetta for this emulation, as the default emulation can make the
   frontend crash:

   1. Open **Docker Desktop** and go to **Settings -> General**.
   2. Enable **Use Virtualization framework**.
   3. Enable **Use Rosetta for x86_64/amd64 emulation on Apple Silicon**.
   4. Click **Apply & restart**.

   .. note::
      To check whether your Mac uses Apple Silicon, click the Apple menu and
      choose **About This Mac**. It will list a chip such as *"Apple M1"*
      for Apple Silicon, or a processor such as *"Intel Core i7"* for Intel.
