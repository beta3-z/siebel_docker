1. Place siebel image files into "./volume/siebel_images" directory
2. Copy  "sample_snic_unix.rsp" file from "./volume/siebel_images" to "./".
3. Rename copied file to "snic_unix.rsp"
4. Change "imageDirectory" parameter inside the "snic_unix.rsp" file to "volume/Siebel_Install_Image".
5. Add "ORACLE_LDAP_Client" and "Siebel_Web_Server_Extension" to "productList".
6. From command line run "./run.bat" script
7. Image creation will take some time. Wait while it finises.
8. Add parameters to oneclick.properties file:
    dbname=SIEBEL