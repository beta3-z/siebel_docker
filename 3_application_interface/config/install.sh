#! /bin/bash
mkdir /siebel;

chown -R siebel /siebel;
chgrp -R siebel /siebel;

chown -R siebel /Siebel_Install_Image;
chgrp -R siebel /Siebel_Install_Image;

export INSTALL_PATH=/Siebel_Install_Image/17.0.0.0/Linux/Server/Siebel_Enterprise_Server/Disk1/install

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

