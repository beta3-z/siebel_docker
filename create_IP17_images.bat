@echo off
SET SOURCE_PATH=%cd:\=/%/1_create_IP17_images/volume
SET TARGET_PATH=%cd:\=/%/Siebel_Install_Image
mkdir Siebel_Install_Image

docker run --rm -v %SOURCE_PATH%:"/siebel_images" -v %TARGET_PATH%:"/Siebel_Install_Image" -w "/siebel_images" senpai bash ./create_images.sh