mkdir Siebel_Install_Image
yum install -y java-1.8.0-openjdk;
cd ./siebel_images;
java -jar ./snic.jar -silent -responseFile ../snic_unix.rsp;