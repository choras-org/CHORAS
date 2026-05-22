# Setup instructions

**(please note that your computer might restart during this process)**

1. Download [Docker Desktop](https://www.docker.com/products/docker-desktop/)

  _(If you’re on Windows and you’re unsure whether you need amd64 or arm64, go to Settings → System → About. It will say "x64-based processor" for AMD, or "ARM-based processor" for an ARM chip.)_

- Install using the default settings.
- Open Docker Desktop (the application must be running for CHORAS to work).
- When prompted to sign in/up, you can click **Continue without signing up** or **Skip**.
- If Docker Desktop tells you that WSL needs updating, please click Restart.
  - If this doesn’t work for some reason, open your favourite command window and run

```
wsl --update
```

- Once you see something like the image below, Docker is running and you can continue with the step 2.

<img width="1384" height="834" alt="docker" src="https://github.com/user-attachments/assets/90cdb036-374f-4cd4-ad04-e0fd372403b8" />

2. If you haven't done so already, clone the [CHORAS repository](https://github.com/choras-org/CHORAS) to a location of your choice.
3. Open your favourite command window

- Navigate to the repository you just downloaded:

```shell
cd <your/path/to/CHORAS>
```

- Initialize and checkout all submodules:

```shell
git submodule update --init --recursive
```

- Run:

```shell
sh CHORAS_BUILD.sh
```

Or if you're on Windows, you can alternatively try running the batch script:

```shell
CHORAS_BUILD_windows.bat
```

4. Once the process is done, navigate to [http://localhost:5173](http://localhost:5173)

- Once you see this, CHORAS is running!

<img width="446" height="236" alt="choras" src="https://github.com/user-attachments/assets/f21f65f0-c667-4534-81cf-ac37d0fa36f1" />

If the page shows an error saying showing something like "Project not found", please try removing all associated containers and volumes. You can do so by running the following command in your terminal:

```shell
docker compose down -v
```

Then, run `docker compose up` again and refresh the page.

5. Try to set up a simulation and view the results!

    *Tip: start with the [./example_geometries/MeasurementRoom.obj](./example_geometries/MeasurementRoom.obj) and choose **Upholstered concert chairs** as a material for all surfaces.*
