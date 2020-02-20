@echo off
SET VOLUME_WINDOWS_PATH="%cd%\volume"
REM Change all \ entries with /
SET VOLUME_PATH=%VOLUME_WINDOWS_PATH:\=/%
echo %VOLUME_PATH%
docker run --rm -it -v %VOLUME_PATH%:"/volume" -w "/volume" centos bash ./create_images.sh