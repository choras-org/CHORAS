Setting up your development environment
=======================================

Forking the repository
----------------------

Ready to contribute? Here's how to set up your development environment for CHORAS.
We always recommend creating a `fork <https://docs.github.com/en/get-started/quickstart/fork-a-repo/>`_ of the repository you would like to contribute to.
This allows you to freely develop and test your changes without affecting the main repository until you're ready to submit a pull request.

1. Fork the repository you want to contribute to (e.g., `choras-org/frontend-v2 <https://github.com/choras-org/frontend-v2>`_). Please make sure that you enable giving maintainers access to your fork, so we can help you if you run into issues.
2. Clone your forked main repository to your local machine:

   .. code-block:: bash

      git clone https://github.com/<your-username>/CHORAS
      cd CHORAS

   If you only want to contribute to the frontend/backend, you can instead clone the original repository.

3. Navigate into the CHORAS directory and initialize the three (``frontend-v2``, ``backend``, and ``simulation-backend``) submodules:

   .. code-block:: bash

      cd CHORAS
      git submodule update --init --recursive

4. Update the remote URL of the submodules to point to your forked repositories. For example, for the frontend submodule:

   .. code-block:: bash

      cd frontend-v2
      git remote set-url origin https://github.com/<your-username>/frontend-v2

   If you prefer to use SSH instead of HTTPS, the command would be:

   .. code-block:: bash

      git remote set-url origin git@github.com:<your-username>/frontend-v2.git

5. Optionally, you can also set up the upstream remote to keep your fork in sync with the original repository:

   .. code-block:: bash

      git remote add upstream https://github.com/choras-org/frontend-v2

6. Finally, create a new branch for your changes:

   .. code-block:: bash

      git checkout -b my-feature-branch


Quickstart developing
---------------------

To setup the development environment for the fronent follow these steps:

1. Install `node.js <https://nodejs.org/en/>`_ on your machine.
2. Once installed run the following commands navigated to the folder you want the CHORAS frontend to live:

   .. code-block:: shell

      git clone -b dev https://github.com/choras-org/frontend-v2.git
      cd frontend-v2
      npm install
      npm run dev

3. Go to `http://localhost:5173/ <http://localhost:5173/>`_ in your favourite browser and the user interface should be visible.
4. If the projects are not loaded correctly or if you have trouble creating a new project, this means that you still need to get the backend up and running. Follow the instructions `here <https://choras.readthedocs.io/en/latest/includes/setup.html>`_.
