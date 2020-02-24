@echo off
cd ../1_images/volume/Siebel_Install_Image
SET IMAGES_PATH=%cd:\=/%
cd ../../../2_gateway/volume
SET INSTALL_PATH=%cd:\=/%
cd ..
echo "Images path: '%IMAGES_PATH%'"
echo "Install directory path: '%INSTALL_PATH%'"
REM docker run --rm -v %IMAGES_PATH%:/Siebel_Install_Image -v %INSTALL_PATH%:/siebel -w /Siebel_Install_Image senpai /siebel/install_gateway.sh
docker run --rm -v %IMAGES_PATH%:/Siebel_Install_Image -v %INSTALL_PATH%:/siebel -w /Siebel_Install_Image -it senpai bash