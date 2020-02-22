#Oracle Dabase Image
	! Registration on hub.docker.com required

	https://hub.docker.com/_/oracle-database-enterprise-edition

	docker pull store/oracle/database-enterprise:12.2.0.1
	docker pull store/oracle/database-enterprise:12.2.0.1-slim

#1_images
- Move Siebel image filet to "./1_images/volume/siebel_images" directory
- Copy "sample_snic_unix.rsp" file from "./1_images/volume/siebel_images" to "./1_images/volume directory" with name "snix_unix.rsp" and make your changes
    (more info about .rsp file: https://docs.oracle.com/cd/E74890_01/books/SiebInstUNIX/SiebInstCOM_Image9.html#wp1573099)


#Database Credentials
	jdbc:oracle:thin:@localhost:1521:ORCLCDB
	sys as sysdba / Oradoc_db1



#Notes
&& groupadd -g  487 siebel \
&& useradd -m -g siebel -G siebel -u 9999  siebel \
&& chmod -R 755 /siebel/cgw
chown -R siebel /mnt/Siebel_Enterprise_Server
chgrp -R siebel /mnt/Siebel_Enterprise_Server
chown -R siebel siebel
chgrp -R siebel siebel


su siebel -c "/mnt/Siebel_Enterprise_Server/Disk1/install/runInstaller.sh -silent -responseFile /config/cgw.rsp -invPtrLoc /config/oraInst.loc -waitforcompletion -showProgress -oneclick"