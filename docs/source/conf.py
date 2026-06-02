# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "CHORAS"
copyright = "2026, The CHORAS developers"
author = "The CHORAS developers"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.duration",
    "sphinx.ext.doctest",
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
    "myst_parser",
    "sphinx_design",
    "sphinx_copybutton",
]
source_suffix = [".rst", ".md"]

templates_path = ["_templates"]
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "pydata_sphinx_theme"
html_static_path = ["_static"]
html_title = "CHORAS"

html_theme_options = {
    "navbar_start": ["navbar-logo"],
    "navbar_end": ["navbar-icon-links", "theme-switcher"],
    "navbar_align": "left",
    "icon_links": [
        {
          "name": "GitHub",
          "url": "https://github.com/choras-org/simulation-backend",
          "icon": "fa-brands fa-square-github",
          "type": "fontawesome",
        },
    ],
    # Configure secondary (right) side bar
    "show_toc_level": 3,  # Show all subsections of notebooks
    "secondary_sidebar_items": ["page-toc"],  # Omit 'show source' link that that shows notebook in json format
    "navigation_with_keys": True,
    # Configure navigation depth for section navigation
    "navigation_depth": 2,
}

html_css_files = ["custom.css"]

html_context = {
   "default_mode": "light"
}
