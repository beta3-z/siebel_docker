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
#chmod -R 755 /siebel;
#chown -R siebel /siebel;
#chgrp -R siebel /siebel;
#chmod -R 755 /Siebel_Install_Image;
#chown -R siebel /Siebel_Install_Image;
#chgrp -R siebel /Siebel_Install_Image;
#Xvfb :99 -screen 0 1280x1024x24 &
#export DISPLAY=:99
#export JDK_PATH=$(alternatives --list | grep ^jre_1.8.0_openjdk | awk '{print $3}')
export JDK_PATH=/jdk/$(ls /jdk)
export INSTALL_PATH=${PWD}/16.0.0.0/Linux/Server/Siebel_Enterprise_Server/Disk1/install

su siebel -c "
${INSTALL_PATH}/runInstaller.sh \
	-jreloc ${JDK_PATH} \
	-showProgress \
	-silent \
	-oneclick \
	-responseFile /siebel/gateway.rsp \
	-invPtrLoc /siebel/oraInst.loc \
	-prereqlogloc /siebel/preq.log \
	-wait_for_completion
";
#su siebel -c "./16.0.0.0/Linux/Server/Siebel_Enterprise_Server/Disk1/install/runInstaller.sh -silent -responseFile /siebel/gateway.rsp -invPtrLoc /siebel/oraInst.loc WAIT_FOR_COMPLETION -showProgress -oneclick JVM_OPTIONS=-Djava.awt.headless=true"
#su siebel -c "xvfb-run -n 99 --server-args='-screen 0 1280x720x24 -ac +extension RANDR' ./16.0.0.0/Linux/Server/Siebel_Enterprise_Server/Disk1/install/runInstaller.sh -silent -responseFile /siebel/gateway.rsp -invPtrLoc /siebel/oraInst.loc -waitforcompletion -showProgress -oneclick"


