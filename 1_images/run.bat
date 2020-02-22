@echo off
SET VOLUME_PATH=%cd:\=/%/volume
echo %VOLUME_PATH%
docker run --rm -v %VOLUME_PATH%:"/volume" -w "/volume" senpai bash ./create_images.sh