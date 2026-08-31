Testing Guidelines
------------------

New contributions to the CHORAS backend and simulation method interfaces should include tests for their code. These are intended to

- Ensure that the code works as intended and bugs are detected early.
- Avoid that future changes to the code do not unintentionally break existing functionality.
- Provide additional definitions of the intended behavior and use-cases of the code.
- Ensure that code produces consistent results when with different or updated versions of dependencies.

The tests should always be run locally before opening a pull request. In addition, all tests are automatically executed by continuous integration services when a pull request is opened (see the `respective guidelines <../general/pr_workflow.html>`_ for more information).

In the following, you'll find a guideline. Note: these instructions are not generally applicable outside of pyfar.

- The main tool used for testing is :doc:`pytest<pytest:index>`.
- All tests are located in the *tests/* folder and can by executed with the ``pytest`` command.
- Make sure that all important parts of CHORAS are covered by the tests. This can be checked using *coverage* (see below).

Best Practices
~~~~~~~~~~~~~~

Please consider the following aspects when writing tests:

- CHORAS mostly uses  **unit tests** to test small parts of the code in isolation. This agrees very well with the code design guidelines of writing compact and modular code (see the `style guidelines <style_design.html>`_).
- Tests should be easy to read and understand. This includes

  - Meaningful test names, comments, and a clear structure of the test code.
  - Writing separate tests for different functionalities instead of combining all checks in a single test.
  - Avoid conditional statements and loops within tests if possible.

- Keep tests independent of each other. Each test should be able to run in isolation without relying on the outcome of other tests.
- Use **fixtures** to set up common test data or state. This avoids code duplication and improves readability. See the `Fixtures`_ section below for more information.
- Note that the modular and compact `code design guidelines <style_design.html>`_ and unit-testing usually go hand in hand: If the code is not concise and compact, writing a compact unit test is (more) difficult. It might be worth to reconsider the code design in this case.
- Keep tests fast to run. This encourages frequent execution of the tests during development and avoids long waiting times for continuous integration services.
- Aim for high **code coverage**. Note that a 100% coverage is not always achievable or necessary. Use a `coverage` tool to check the coverage of your tests.
- CHORAS recommends test-driven development based on `three steps <https://martinfowler.com/bliki/TestDrivenDevelopment.html>`_.


Required Tests
~~~~~~~~~~~~~~

The testing for functions and classes should at least contain tests for

- all errors and warnings (see also function and class guidelines above).
- all input and output parameters.
- specific input and output parameter combinations (if required).
- single and multi-dimensional input data such Signal objects and array likes.
- audio objects with complex time data and NaN values (if applicable).


Tips
~~~~

Running tests locally with pytest
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Python projects use `pytest <https://docs.pytest.org/en/stable/>`_ as testing framework.
To run all tests within a project, simply execute the following command in the terminal from the root folder of the project:

.. code-block:: shell

   $ pytest

Pytest provides several, sophisticated functionalities which could reduce the effort of implementing tests.

- Similar tests executing the same code with different variables can be :doc:`parametrized<pytest:example/parametrize>`.

- Exclude tests (for example tests within a Docker container) with

.. code-block:: shell

   $ pytest -k 'not docker'

- Create an html report on the test :doc:`coverage<coverage:index>` with

.. code-block:: shell

   $ pytest --cov=. --cov-report=html

- Feel free to add more recommendations on useful pytest functionalities here. Consider, that a trade-off between easy implemention and good readability of the tests needs to be found.

Fixtures
^^^^^^^^
"Software test fixtures initialize test functions. They provide a fixed baseline so that tests execute reliably and produce consistent, repeatable, results. Initialization may setup services, state, or other operating environments. These are accessed by test functions through parameters; for each fixture used by a test function there is typically a parameter (named after the fixture) in the test function’s definition." (from :doc:`pytest fixtures<pytest:explanation/fixtures>`)

- Shared fixtures can be implemented in *conftest.py*, which makes them automatically available to all tests. This prevents from implementing redundant, unreliable code in several test files.
- Define the variables used in the tests only once, either in the test itself or in the definition of the fixture. This assures consistency and prevents from failing tests due to the definition of variables with the same purpose at different positions or in different files.

**Dummies**

If the objects used in the tests have arbitrary properties, tests are usually better to read, when these objects are initialized within the tests. If the initialization requires several operations or the object has non-arbitrary properties, this is a hint to use a fixture.

**Stubs**

Stubs mimic actual objects, but have minimum functionality and **fixed, well defined properties**. They are **only used in cases, when a dependence on the actual class is prohibited**. This is the case, when functionalities of the class itself or methods it depends on are tested.

**Mocks**

Mocks are similar to stubs but used for **behavioral verification**. For example, a mock can replace a function or an object to check if it is called with correct parameters. A main motivation for using mocks is to avoid complex or time-consuming external dependencies, for example database queries.
