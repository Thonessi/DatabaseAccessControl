CREATE OR REPLACE PROCEDURE AccountManagement (p_type varchar2,p_windows_login varchar2,admin_option varchar2, p_login varchar2, p_password varchar2,schema_privilege varchar2,p_action varchar2)
AS
l_count NUMBER;
BEGIN
--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'ADD'
IF p_action = 'ADD'
THEN
    --THIS STEP IS REQUIRED TO VERIFY IF THE USER EXISTS OR NOT
    select count(*) INTO l_count from dba_users where username=UPPER(p_login);
    IF (l_count=0)
    THEN
        IF p_type = 'Local'
        THEN
            --IF USER DOES NOT EXIST THEN THESE COMMANDS ARE REQUIRED TO CREATE IT
            dbms_output.put_line('CREATE USER '||p_login||' IDENTIFIED BY '||p_password||';');
            EXECUTE IMMEDIATE ('alter session set "_ORACLE_SCRIPT"=true');
            EXECUTE IMMEDIATE ('CREATE USER '||p_login||' IDENTIFIED BY '||p_password);
            EXECUTE IMMEDIATE ('GRANT CONNECT TO '||p_login);
        END IF;
        IF p_type = 'Windows'
        THEN
            --IF USER DOES NOT EXIST THEN THESE COMMANDS ARE REQUIRED TO CREATE IT
            dbms_output.put_line('CREATE USER '||p_login||' IDENTIFIED EXTERNALLY AS '||p_windows_login||';');
            EXECUTE IMMEDIATE ('alter session set "_ORACLE_SCRIPT"=true');
            EXECUTE IMMEDIATE ('CREATE USER '||p_login||' IDENTIFIED EXTERNALLY AS '''||p_windows_login||'''');
            EXECUTE IMMEDIATE ('GRANT CONNECT TO '||p_login);
        END IF;
    END IF;
    --THIS LOGIC IS APPLIED IF THE ACCESS REQUIRED ADMIN OPTION LEVEL
    IF (admin_option = 'true')
    THEN
        EXECUTE IMMEDIATE ('GRANT '||schema_privilege||' TO '||p_login||' WITH ADMIN OPTION');
    END IF;
    IF (admin_option = 'false')
    THEN
        EXECUTE IMMEDIATE ('GRANT '||schema_privilege||' TO '||p_login);
    END IF;

END IF;
--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'DELETE'
IF p_action = 'DELETE'
THEN
    --THIS ACTION DELETES THE SELECTED ACCESS TO THE USER
    --BUT IT DOES NOT REMOVES THE ACCOUNT FROM THE SCHEMA
    EXECUTE IMMEDIATE ('REVOKE '||schema_privilege||' FROM '||p_login);
END IF;

--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'DROP'
IF p_action = 'DROP'
THEN
    --THIS ACTION DROP COMPLETELY THE SELECTED USER
    EXECUTE IMMEDIATE ('DROP USER '||p_login||' CASCADE');
END IF;

END AccountManagement;
/
--SET serveroutput ON; 
--EXECUTE AccountManagement('Windows','helpdesk@lab.local','false','atest_helpdesk','Welcome123','ALTER ANY CUBE BUILD PROCESS','ADD');

