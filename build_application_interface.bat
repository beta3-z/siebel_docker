@echo off
REM SET IMAGES_PATH=%cd:\=/%/Siebel_Install_Image
REM SET CONFIG_PATH=%cd:\=/%/2_gateway/volume
SET IMAGE_NAME=siebel_17_sai

docker image rm %IMAGE_NAME%
docker build -f ./3_application_interface/Dockerfile -t %IMAGE_NAME% .

REM docker run --rm -v %IMAGES_PATH%:/Siebel_Install_Image -v CONFIG_PATH:/config -w / senpai /config/install_gateway.sh
REM docker run --rm -v %IMAGES_PATH%:/Siebel_Install_Image -w /Siebel_Install_Image -it senpai bash