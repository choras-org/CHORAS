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

REM docker save -o backend\app\services\executors\pa_image.tar pa_image:latest
REM echo Docker image exported to pa_image.tar

echo Starting Docker Compose...
docker compose up
if errorlevel 1 goto :error

echo Done.
exit /b 0

:error
echo.
echo Build failed with error code %errorlevel%.
exit /b %errorlevel%
