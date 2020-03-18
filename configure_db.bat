@echo off
set login=sys
set password=Oradoc_db1
set host=localhost:1521
set service=ORCLCDB

echo ------------CREATING TABLESPACES------------
docker exec -i siebel_db bash -c "source ~/.bashrc; sqlplus -s %login%/%password% as sysdba" < 9_configure_db/config/before.sql
echo ------------GRANTUSR.SQL------------
docker exec -i siebel_db bash -c "source ~/.bashrc; sqlplus -s %login%/%password% as sysdba" < 9_configure_db/config/grantusr.sql