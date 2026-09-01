@echo off
setlocal

REM Exit early if any command fails by checking errorlevel after each step.

echo Building Docker images...
docker compose --profile sim_method build
if errorlevel 1 goto :error

echo Exporting dg_image:latest to backend\app\services\executors\dg_image.tar...
docker save -o backend\app\services\executors\dg_image.tar dg_image:latest
if errorlevel 1 goto :error
echo Docker image exported to dg_image.tar

echo Exporting de_image:latest to backend\app\services\executors\de_image.tar...
docker save -o backend\app\services\executors\de_image.tar de_image:latest
if errorlevel 1 goto :error
echo Docker image exported to de_image.tar

echo Exporting pyroomacoustics_image:latest to backend\app\services\executors\pyroomacoustics_image.tar...
docker save -o backend\app\services\executors\pyroomacoustics_image.tar pyroomacoustics_image:latest
if errorlevel 1 goto :error
echo Docker image exported to pyroomacoustics_image.tar

echo Exporting sparrowpy_image:latest to backend\app\services\executors\sparrowpy_image.tar...
docker save -o backend\app\services\executors\sparrowpy_image.tar sparrowpy_image:latest
if errorlevel 1 goto :error
echo Docker image exported to sparrowpy_image.tar

echo Exporting misuka_image:latest to backend\app\services\executors\misuka_image.tar...
docker save -o backend\app\services\executors\misuka_image.tar misuka_image:latest
if errorlevel 1 goto :error
echo Docker image exported: misuka_image.tar

echo Starting Docker Compose...
docker compose up
if errorlevel 1 goto :error

echo Done.
exit /b 0

:error
echo.
echo Build failed with error code %errorlevel%.
exit /b %errorlevel%
