CREATE OR REPLACE PROCEDURE GET_USERS_WITH_ACCESS_TO_ORACLE_SCHEMA AS
q SYS_REFCURSOR;
 BEGIN
    OPEN q FOR
            SELECT * 
            FROM (
                SELECT DRP.GRANTEE AS USERNAME,
                    DRP.GRANTED_ROLE AS ROLE,
                    DRP.ADMIN_OPTION,
                    DU.ACCOUNT_STATUS, 
                    DU.EXPIRY_DATE, 
                    DU.DEFAULT_TABLESPACE, 
                    DU.CREATED, 
                    DU.AUTHENTICATION_TYPE, 
                    DU.LAST_LOGIN, 
                    DU.PASSWORD_CHANGE_DATE,
                    (SELECT SYS_CONTEXT('USERENV','IP_ADDRESS') 
                        FROM dual) AS IP_ADDRESS
                FROM DBA_ROLE_PRIVS DRP
                LEFT JOIN DBA_USERS DU ON DRP.GRANTEE = DU.USERNAME
                --ORDER BY DRP.GRANTEE
                UNION
                SELECT DRP.GRANTEE AS USERNAME,
                    DRP.PRIVILEGE AS ROLE,
                    DRP.ADMIN_OPTION,
                    DU.ACCOUNT_STATUS, 
                    DU.EXPIRY_DATE, 
                    DU.DEFAULT_TABLESPACE, 
                    DU.CREATED, 
                    DU.AUTHENTICATION_TYPE, 
                    DU.LAST_LOGIN, 
                    DU.PASSWORD_CHANGE_DATE,
                    (SELECT SYS_CONTEXT('USERENV','IP_ADDRESS') 
                        FROM dual) AS IP_ADDRESS
                FROM DBA_SYS_PRIVS DRP
                LEFT JOIN DBA_USERS DU ON DRP.GRANTEE = DU.USERNAME
                --ORDER BY DRP.GRANTEE
                )
                ORDER BY USERNAME;
     DBMS_SQL.return_result (q); -- This will display the result
END;

EXECUTE GET_USERS_WITH_ACCESS_TO_ORACLE_SCHEMA();