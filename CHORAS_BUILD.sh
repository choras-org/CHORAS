#!/bin/bash
set -e

# Build images
docker compose --profile sim_method build

# Save the image as a tar file (replace with your actual image name:tag)
docker save -o backend/app/services/executors/dg_image.tar dg_image:latest
echo "Docker image exported to dg_image.tar"

docker save -o backend/app/services/executors/de_image.tar de_image:latest
echo "Docker image exported to de_image.tar"

docker save -o backend/app/services/executors/deeponet_image.tar deeponet_image:latest
echo "Docker image exported to deeponet_image.tar"

# docker save -o backend/app/services/executors/pa_image.tar pa_image:latest
# echo "Docker image exported to pa_image.tar"

docker compose up