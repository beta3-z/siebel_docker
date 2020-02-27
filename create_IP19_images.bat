@echo off
SET SOURCE_PATH=%cd:\=/%/5_create_IP19_images/volume
SET TARGET_PATH=%cd:\=/%/Siebel_IP19_Install_Image
mkdir Siebel_IP19_Install_Image

docker run --rm -v %SOURCE_PATH%:"/siebel_images" -v %TARGET_PATH%:"/Siebel_Install_Image" -w "/siebel_images" senpai bash ./create_images.sh