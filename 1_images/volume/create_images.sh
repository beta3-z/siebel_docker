#! /bin/bash
mkdir Siebel_Install_Image;
cd ./siebel_images;
java -jar ./snic.jar -silent -responseFile ../snic_unix.rsp;