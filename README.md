[![Documentation Status](https://readthedocs.org/projects/pyfar/badge/?version=latest)](https://pyfar.readthedocs.io/en/latest/?badge=latest)
[![CHORAS Tests](https://github.com/choras-org/CHORAS/actions/workflows/engd2026.yml/badge.svg)](https://github.com/choras-org/CHORAS/actions/workflows/engd2026.yml)

This is the public repository for The Community Hub for Open-source Room Acoustics Software. 
CHORAS is a free, web-based platform for running and comparing room acoustics simulations. Designed for acoustic consultants, researchers, and engineers, it brings together multiple simulation methods in one intuitive interface, so you can focus on results rather than tooling.

# Getting started

For a full documentation of CHORAS, please refer to the [CHORAS documentation pages](https://choras.readthedocs.io/en/latest/).
You can find sections on how to [install CHORAS](https://choras.readthedocs.io/en/latest/includes/setup.html), as well as a [user guide](https://choras.readthedocs.io/en/latest/includes/user_guide.html)

## Quickstart

The only requirement to run CHORAS is a working Docker installation. Please make sure to install Docker before continuing. You can download Docker from the [Docker website](https://www.docker.com/products/docker-desktop/).

You can download the latest version of CHORAS from the GitHub [releases page](https://github.com/choras-org/CHORAS/releases). 
After downloading, you can run the application by executing the build script in your terminal:

For Linux and macOS:

```shell
sh CHORAS_BUILD.sh
```

For Windows:

```shell
.\CHORAS_BUILD.bat
```

On Windows systems, you can alternatively double-click the `CHORAS_BUILD.bat` file to run the build script.


## Example geometries

Examples of geometries compatible with CHORAS in the [example_geometries](./example_geometries/) folder of this repository.

# Interested in contributing?

If you are a scientist, engineer, front-end or back-end developer interested or working in acoustics, we would love to have you contribute to CHORAS and become part of the community! Please refer to the [contributing guide](https://choras.readthedocs.io/en/latest/includes/contributing.html) for more information.
