#! /bin/bash
#yum install -y --skip-broken java-1.8.0-openjdk;
#
## X11
#yum install -y \
#	install -y epel-release
#	groupinstall -y "Xfce"
#
## IP16
#yum install -y --skip-broken \
#	libnsl.i686 \
#	libXtst.i686;
#
## IP19 ?
#yum install -y --skip-broken \
#	libgcc.i686 \
#	libxcb.i686 \
#	libX11.i686 \
#	libXext.i686 \
#	libXau.i686 \
#	libcurl.i686;
#
#
#rm -rf /var/cache/yum/x86_64;
#rm -rf /var/cache/yum/i686;
#yum clean all;
#
#groupadd -g  487 siebel;
#useradd -m -g siebel -G siebel -u 9999  siebel;
mkdir /siebel;


chown -R siebel /siebel;
chgrp -R siebel /siebel;

chown -R siebel /Siebel_Install_Image;
chgrp -R siebel /Siebel_Install_Image;
#Xvfb :99 -screen 0 1280x1024x24 &
#export DISPLAY=:99
export JDK_PATH=$(alternatives --list | grep ^jre_1.8.0_openjdk | awk '{print $3}')
#export JDK_PATH=/jdk/$(ls /jdk)
export INSTALL_PATH=/Siebel_Install_Image/17.0.0.0/Linux/Server/Siebel_Enterprise_Server/Disk1/install
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/lib64"
ln -s /lib64/libnsl.so.2 /lib64/libnsl.so.1

su siebel -c "
	${INSTALL_PATH}/runInstaller.sh \
		-showProgress \
		-silent \
		-oneclick \
		-responseFile /config/sai.rsp \
		-invPtrLoc /config/oraInst.loc \
		-waitforcompletion 
";

chmod -R 755 /siebel;

rm -rf /Siebel_Install_Image /config

