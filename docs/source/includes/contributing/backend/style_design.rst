Style and Design Guidelines
===========================

Style Guidelines
----------------

At the moment, CHORAS does not have a strict style guide for contributions to the backend packages.
The code style is loosely based on the `PEP 8 <https://peps.python.org/pep-0008/>`_ style guide for Python code.
Once a style guidelines is established, it will be enforced through the `ruff <https://docs.astral.sh/ruff/>`_ linter.

In addition to agreeing with PEP 8, new contributions should also follow the following style guidelines:

- Docstrings are always required and should follow the `numpydoc style <https://numpydoc.readthedocs.io/en/latest/format.html>`_.
- Commented out code is not allowed.
- Shadowing built-ins is not allowed.
- Unused function arguments are not allowed unless they are part of a required function signature (e.g., for overridden methods).

It is recommended to choose the style that improves readability the most in the given context.

.. note::

    Please note that changing existing code to a different valid style is usually *not desired* in a contribution as it clutters the git history without adding value and makes revising code harder.
    Please only change the style of existing code if it is necessary to improve readability or if a re-write of the respective code section is required.



Design Considerations
---------------------

Contributions to CHORAS should aims for code that is easy to read, maintain and extend.
This usually means, that features should be implemented in a compact and modular way.
Complex functionality should be broken down into smaller, reusable components.
Note that this approach will simplify writing unit tests and documentation as well.
Additionally, it will make reviewing contributions easier and therefore speed up the contribution process.

Functions and classes should

* have a single clear purpose and a functionality limited to that purpose. Conditional parameters are fine in some cases but are an indicator that a function or class does not have a clear purpose. Conditional parameters are

  - parameters that are obsolete if another parameter is provided,
  - parameters that are necessary only if another parameter is provided,
  - parameters that must have a specific value depending on other parameters.

* be split into multiple functions or classes if the functionality is not well limited.
* contain documentation for all input and output parameters.
* contain examples in the documentation if they are non-trivial to use.
* contain comments in the code that explain decisions and parts that are not trivial to read from the code.
* use unique and descriptive names for all variables.

It is also a good idea to follow `the Zen of Python <https://peps.python.org/pep-0020/>`_.
