[![Documentation Status](https://readthedocs.org/projects/pyfar/badge/?version=latest)](https://pyfar.readthedocs.io/en/latest/?badge=latest)

# CHORAS

This is the public repository for the The Community Hub for Open-source Room Acoustics Software. For documentation on the project, please refer to the [CHORAS documentation pages](https://choras.readthedocs.io/en/latest/).

<img width="1512" height="786" alt="Screenshot 2025-11-04 at 11 23 16" src="https://github.com/user-attachments/assets/b3eb28d6-8a19-49a8-a8a9-08f156b09ef9" />

## Settings
This section provides a description of the simulation specific settings in CHORAS. The settings marked with a 🟨 or 🟥 greatly influence simulation time (🟥 has a greater influence).

- Diffusion Equation method
  - _Simulation length_: Determines whether to use _Impulse response length_ or _Energy decay threshold_ to determine the simulation length
  - 🟨 _Impulse response length_: Sets the length of the generated impulse response (only used when _Simulation length_ is set to IR Length!)
  - _Speed of sound_: The speed of sound
  - 🟨 _Energy decay threshold_: The (negative) dB value that the simulation will run until (only used when  _Simulation length_ is set to EDT). 
  - 🟥 _Characteristic length_: The length between two mesh nodes that the mesher tries to aim for. (This greatly influences simulation time. Start with **3**, especially for a larger geometry (such as the Room2215 geometries))
 
  - 🟥 Additional note on surfaces: a low average absorption drastically increase the simulation time (start with _Upholstered concert chairs_ for all surfaces for prototyping)

- Discontinuous Galerkin method
  - _Speed of sound_: The speed of sound
  - 🟥 _Impulse Response Length_: Sets the length of the generated impulse response (greatly influences simulation time. Start with 0.1 s for prototyping.)
  - 🟥 _Frequency upper limit_: The highest frequency that DG will generate. (greatly influences simulation time. Start with 100 Hz for prototyping.)
  - _Air density_: The density of the air
  - _Poly order_: The polynomial order of the DG method (better to leave this untouched)
  - _Points per wavelength_: The number of points per wavelength to use in the DG method (better to leave this untouched)
  - _CFL_: The Courant–Friedrichs–Lewy condition (better to leave this untouched)
 
## Submodules

You'll find two submodules in this repository:

- frontend-v2
- backend

You **won't** need these if you simply want to run the Docker setup described in [setup_instructions.md](./setup_instructions.md). 

If you are interested in the underlying code anyway, run

```bash
git submodule update --init --recursive
```

## Example geometries

Examples of geometries compatible with CHORAS in the [example_geometries](./example_geometries/) folder.

## For room acoustics simulation back-end developers

If you are a developer of a room acoustics simulation back-end, please refer to the [backend readthedocs](https://choras-backend.readthedocs.io/en/latest/).

Note that if you have issues with cloning this repository (and its submodules), you can download the zipped repository via the releases page of this repository: <https://github.com/choras-org/CHORAS/releases>.
