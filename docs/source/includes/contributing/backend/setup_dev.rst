Setting up your development environment
=======================================

Ready to contribute? Here's how to set up your development environment for CHORAS.
We always recommend creating a `fork <https://docs.github.com/en/get-started/quickstart/fork-a-repo/>`_ of the repository you would like to contribute to.
This allows you to freely develop and test your changes without affecting the main repository until you're ready to submit a pull request.

1. Fork the repository you want to contribute to (e.g., `choras-org/backend <https://github.com/choras-org/backend>`_). Please make sure that you enable giving maintainers access to your fork, so we can help you if you run into issues.
2. Clone your forked main repository to your local machine:

   .. code-block:: bash

      git clone https://github.com/<your-username>/CHORAS
      cd CHORAS

   If you only want to contribute to the frontend/backend, you can instead clone the original repository.

3. Navigate into the CHORAS directory and initialize the three (``frontend-v2``, ``backend``, and ``simulation-backend``) submodules:

   .. code-block:: bash

      cd CHORAS
      git submodule update --init --recursive

4. Update the remote URL of the submodules to point to your forked repositories. For example, for the backend submodule:

   .. code-block:: bash

      cd backend
      git remote set-url origin https://github.com/<your-username>/backend

   If you prefer to use SSH instead of HTTPS, the command would be:

   .. code-block:: bash

      git remote set-url origin git@github.com:<your-username>/backend.git

5. Optionally, you can also set up the upstream remote to keep your fork in sync with the original repository:

   .. code-block:: bash

      git remote add upstream https://github.com/choras-org/backend

6. Finally, create a new branch for your changes:

   .. code-block:: bash

      git checkout -b my-feature-branch

7. Install dependencies

   .. code-block:: bash

      uv sync --group dev

8. Now you're ready to start developing. Follow the instructions on the next page to start implementing an interface for your simulation method.

Running the Backend Locally
---------------------------

From the ``backend`` directory:

1. **Create or update the** ``.env`` **file:**

   .. code-block:: bash

      # APP configuration
      APP_NAME=CHORAS Backend
      APP_ENV=develop

      # Flask configuration
      FLASK_APP=app:app
      FLASK_DEBUG=true
      APP_SETTINGS_MODULE=config.DevelopConfig
      APP_TEST_SETTINGS_MODULE=config.TestingConfig

      FLASK_RUN_HOST=0.0.0.0
      FLASK_RUN_PORT=5000

      # Database (optional — omit to use the default SQLite3 database)
      DATABASE_URL=postgresql+psycopg2://db_user:db_password@localhost/db_dev
      DATABASE_TEST_URL=postgresql+psycopg2://db_user:db_password@localhost/db_test

2. **Create or update the database schema and seed initial data:**

   .. code-block:: bash

      flask stamp-legacy-db
      flask db upgrade
      flask create-db

   Run these again after pulling changes that add new migrations. See :ref:`database-migrations` below.

3. **Run the development server:**

   .. code-block:: bash

      flask run

4. **Start the Celery worker** (only needed if using async jobs):

   .. code-block:: bash

      celery -A app.celery worker --loglevel=info -P eventlet

Flask CLI Reference
-------------------

- Seed initial data (materials, settings, example projects; also creates missing tables):

  .. code-block:: sh

     flask create-db

- Delete all tables:

  .. code-block:: sh

     flask drop-db

- Reset the database (drop + recreate + seed):

  .. code-block:: sh

     flask reset-db

.. _database-migrations:

Database Migrations
-------------------

The backend uses `Flask-Migrate <https://flask-migrate.readthedocs.io>`_ (Alembic) for schema migrations.
The migration files live in ``backend/migrations/versions/``. They start from the database schema of the
v0.2.0 release and are applied automatically when the backend container starts.

- Apply all pending migrations:

  .. code-block:: sh

     flask stamp-legacy-db
     flask db upgrade

  ``flask stamp-legacy-db`` only does something for databases created before migrations existed
  (CHORAS v0.2.0 and v0.2.1): it marks them as being at the v0.2.0 starting point, so that
  ``flask db upgrade`` can update them.

- After changing a model, generate a migration and review the generated file before committing it
  together with the model change:

  .. code-block:: sh

     flask db migrate -m "Description"

- Check that the models and migrations match (CI runs this as well):

  .. code-block:: sh

     flask db check

The migration repository already exists, so ``flask db init`` must not be run again.
