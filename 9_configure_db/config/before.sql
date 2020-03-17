create tablespace siebeldata datafile 'siebeldata01.dbf' size 1G autoextend on next 10M maxsize 30G;
create tablespace siebelindex datafile 'siebelindex01.dbf' size 1G autoextend on next 10M maxsize 10G;
--alter database datafile '/ORCL/u02/app/oracle/oradata/ORCLCDB/system01.dbf/system01.dbf' resize 2G;
--alter database datafile '/ORCL/u02/app/oracle/oradata/ORCLCDB/orclpdb1/sysaux01.dbf' resize 2G;
--alter database datafile '/ORCL/u02/app/oracle/oradata/ORCLCDB/undotbs01.dbf' resize 2G;
