rem    NAME
rem      grantusr.sql
rem
rem    DESCRIPTION
rem     This sql script creates the Oracle database roles and users for
rem     the Siebel Enterprise.
rem     There are two types of Oracle users:
rem        1. Table Owner or Oracle User which owns all the
rem           database objects for the Siebel Enterprise.
rem        2. User Account. These are the accounts that SSE users
rem           login to. This account has select, insert, update privileges
rem           on the tables owned by the user of Siebel Enterprise database
rem           objects. The user accounts access the database objects owned by
rem           user of Siebel Enterprise database objects via the sse_role.
rem        3. Table Owner and User account passwords
rem           should not be same as User name.
rem        4. Script will not perform rollback in case of failure.
rem           Depending on where failure occured, You might have to execute
rem           one of the drop statements below to re-run the script.
rem           drop user <User who owns Siebel database objects>
rem           drop role sse_role ;
rem           drop role tblo_role ;
rem           drop user sadmin ;
rem           drop user ldapuser ;
rem           drop user guestcst ;
rem           drop user guesterm ;
rem    USAGE
rem    sqlplus SYSTEM @grantusr.sql
rem    Script is run as SYSTEM user who has DBA privileges
rem    Script will prompt for the following
rem         1) siebel user name
rem         2) siebel user password
rem         3) default tablespace
rem         4) temporary tablespace
rem         5) sadmin user password
rem         6) ldapuser password
rem         7) guestcst password
rem         8) guesterm password
rem
rem    MODIFIED   (MM/DD/YY)
rem               01/18/16

set echo off verify off showmode off feedback off;

whenever sqlerror exit sql.sqlcode

-- prompt
-- prompt Enter the username who will own SIEBEL database objects
-- prompt ----------------------------------------------------------

-- prompt
-- prompt &&un_tableowner

-- begin
--    if '&&un_tableowner' is null then
--         raise_application_error(-20101, 'Install failed - username is null');
--    end if;
-- end ;
-- /

define un_tableowner='SIEBEL'

-- prompt
-- prompt Enter the password for username who will own SIEBEL database objects
-- prompt ----------------------------------------------------------------------

-- prompt NOTE:Password cannot be same as username

-- prompt
-- prompt &&pw_tableowner

-- begin
--    if '&&pw_tableowner' is null then
--         raise_application_error(-20101, 'Install failed - password is null');
--    else
--        if upper('&&pw_tableowner') = upper('&&un_tableowner') then
--         raise_application_error(-20101, 'password is same as username');
--        end if ;
--    end if;
-- end ;
-- /

define pw_tableowner='SIEBEL'

-- prompt
-- prompt Choose the default tablespace for &&un_tableowner user
-- prompt ------------------------------------------------------

-- prompt
-- prompt Below is the list of online tablespaces in this database which can
-- prompt store user data.  We recommend you create new tablespace. Install will
-- prompt fail if SYSTEM or SYSAUX are used for default tablespace.
-- prompt

-- select tablespace_name, contents
--   from sys.dba_tablespaces
--  where tablespace_name not in ('SYSTEM','SYSAUX')
--    and contents = 'PERMANENT'
--    and status = 'ONLINE'
--  order by tablespace_name;

-- prompt
-- prompt &&default_tablespace

-- begin
--    if '&&default_tablespace' is null then
--         raise_application_error(-20101, 'Install failed - Default tablespace is null');
--    else
--       if upper('&&default_tablespace') in ('SYSTEM','SYSAUX')  then
--         raise_application_error(-20101, 'Install failed - Default tablespace cannot be SYSTEM or SYSAUX ');
--       end if ;
--    end if;
-- end ;
-- /

define default_tablespace='siebeldata'

-- prompt
-- prompt Choose the temporary tablespace for &&un_tableowner user
-- prompt -----------------------------------------------------------

-- prompt
-- prompt Below is the list of temporary  tablespaces in this database which can
-- prompt store user data.  We recommend you to use TEMP. Install will fail if
-- prompt SYSTEM or SYSAUX are used for temporary tablespace.
-- prompt

-- select t.tablespace_name, t.contents
--   from sys.dba_tablespaces t
--      , sys.database_properties dp
--  where t.contents           = 'TEMPORARY'
--    and t.status             = 'ONLINE'
--    and dp.property_name(+)  = 'DEFAULT_TEMP_TABLESPACE'
--    and dp.property_value(+) = t.tablespace_name
--  order by tablespace_name;

-- prompt
-- prompt &&temporary_tablespace

-- begin
--    if '&&temporary_tablespace' is null then
--         raise_application_error(-20101, 'Install failed - Temporary tablespace is null');
--    else
--       if upper('&&temporary_tablespace') in ('SYSTEM','SYSAUX')  then
--         raise_application_error(-20101, 'Install failed - Temporary tablespace cannot be SYSTEM or SYSAUX ');
--       end if ;
--    end if;
-- end ;
-- /
define temporary_tablespace='TEMP'

-- prompt
-- prompt Enter the password for SADMIN user
-- prompt ------------------------------------

-- prompt NOTE:Password cannot be same as username

-- prompt
-- prompt SADMIN User Account. These are the accounts that SSE users
-- prompt login to. This account has select, insert, update privileges
-- prompt on the tables in the &&un_tableowner. The user accounts
-- prompt access the database objects in the &&un_tableowner table owner via
-- prompt the sse_role.

-- prompt
-- prompt &&pw_sadmin

-- begin
--    if '&&pw_sadmin' is null then
--         raise_application_error(-20101, 'Install failed - password is null');
--    else
--        if upper('&&pw_sadmin') = upper('sadmin') then
--         raise_application_error(-20101, 'password for sadmin is same as username');
--        end if ;
--    end if;
-- end ;
-- /

define pw_sadmin='SADMIN'

-- prompt
-- prompt Enter the password for LDAPUSER user
-- prompt ------------------------------------

-- prompt NOTE:Password cannot be same as username

-- prompt
-- prompt LDAPUSER User Account. These are the accounts that SSE users
-- prompt login to. This account has select, insert, update privileges
-- prompt on the tables in the &&un_tableowner. The user accounts
-- prompt access the database objects in the &&un_tableowner table owner via
-- prompt the sse_role.

-- prompt
-- prompt &&pw_ldapuser

-- begin
--    if '&&pw_ldapuser' is null then
--         raise_application_error(-20101, 'Install failed - password is null');
--    else
--        if upper('&&pw_ldapuser') = upper('ldapuser') then
--         raise_application_error(-20101, 'password for ldapuser is same as username');
--        end if ;
--    end if;
-- end ;
-- /

define pw_ldapuser='LDAPUSER'

-- prompt
-- prompt Enter the password for GUESTCST user
-- prompt ------------------------------------

-- prompt NOTE:Password cannot be same as username

-- prompt
-- prompt GUESTCST User Account. This is the anonymous user

-- prompt
-- prompt &&pw_gcstuser

-- begin
--    if '&&pw_gcstuser' is null then
--         raise_application_error(-20101, 'Install failed - password is null');
--    else
--        if upper('&&pw_gcstuser') = upper('guestcst') then
--         raise_application_error(-20101, 'password for guestcst is same as username');
--        end if ;
--    end if;
-- end ;
-- /

define pw_gcstuser='GUESTCST'

-- prompt
-- prompt Enter the password for GUESTERM user
-- prompt ------------------------------------

-- prompt NOTE:Password cannot be same as username

-- prompt
-- prompt GUESTERM User Account. This is the anonymous user

-- prompt
-- prompt &&pw_gstermuser

-- begin
--    if '&&pw_gstermuser' is null then
--         raise_application_error(-20101, 'Install failed - password is null');
--    else
--        if upper('&&pw_gstermuser') = upper('guesterm') then
--         raise_application_error(-20101, 'password for guesterm is same as username');
--        end if ;
--    end if;
-- end ;
-- /

define pw_gstermuser='GUESTERM'

-- prompt
-- prompt NOTE: Running grantusr.sql

-- prompt Please check log file grantusr.lis for any errors.
-- prompt
-- prompt Hit enter to continue
-- pause ;



--CUSTOM--
alter session set "_ORACLE_SCRIPT"=true;
commit;
--END CUSTOM--




set feedback on ;
set echo on;

Rem Begin spooling after password has been entered
spool grantusr.lis

rem Start creating user to store siebel database objects
create user &&un_tableowner
  identified by &&pw_tableowner
  default tablespace &&default_tablespace
  temporary tablespace &&temporary_tablespace;
alter user &&un_tableowner quota unlimited on &&default_tablespace;

rem Create Role sse_role
create role sse_role;
grant create session to sse_role;

rem Create Role tblo_role
create role tblo_role;
grant ALTER SESSION, CREATE CLUSTER, CREATE INDEXTYPE,
  CREATE OPERATOR, CREATE PROCEDURE, CREATE SEQUENCE, CREATE SESSION,
  CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, CREATE TYPE, CREATE VIEW,
  CREATE DIMENSION, CREATE MATERIALIZED VIEW, ON COMMIT REFRESH
to tblo_role;

rem Provide grants needed
grant sse_role to &&un_tableowner;
grant tblo_role to &&un_tableowner;

rem =============================================
rem Create db accounts for Siebel users
rem

create user SADMIN identified by &&pw_sadmin
  default tablespace &&default_tablespace
  temporary tablespace &&temporary_tablespace;
grant sse_role to SADMIN;

create user LDAPUSER identified by &&pw_ldapuser
  default tablespace &&default_tablespace
  temporary tablespace &&temporary_tablespace;
grant sse_role to LDAPUSER;

create user GUESTCST identified by &&pw_gcstuser
  default tablespace &&default_tablespace
  temporary tablespace &&temporary_tablespace;
grant sse_role to GUESTCST;

create user GUESTERM identified by &&pw_gstermuser
  default tablespace &&default_tablespace
  temporary tablespace &&temporary_tablespace;
grant sse_role to GUESTERM;

set echo off feedback off head off;
select 'User &&un_tableowner created successfully' from dual;

spool off ;


exit ;