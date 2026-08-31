#!/bin/bash
set -e

# Build images
docker compose --profile sim_method build

# Save the image as a tar file (replace with your actual image name:tag)
docker save -o backend/app/services/executors/dg_image.tar dg_image:latest
echo "Docker image exported to dg_image.tar"

docker save -o backend/app/services/executors/de_image.tar de_image:latest
echo "Docker image exported to de_image.tar"

docker save -o backend/app/services/executors/pyroomacoustics_image.tar pyroomacoustics_image:latest
echo "Docker image exported to pyroomacoustics_image.tar"

docker save -o backend/app/services/executors/sparrowpy_image.tar sparrowpy_image:latest
echo "Docker image exported to sparrowpy_image.tar"

docker compose up
