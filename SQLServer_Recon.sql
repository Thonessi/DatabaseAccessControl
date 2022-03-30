ALTER PROCEDURE GET_USERS_WITH_ACCESS_TO_SQLSERVER_SCHEMA
AS
BEGIN
--En este apartado se realiza la declaración de las variables
--que se extraerán para capturar la información de los usuarios
DECLARE @DB_USers TABLE(DATABASE_NAME sysname, 
						USERNAME sysname null,
						LOGIN_NAME sysname null,
						TYPE sysname null, 
						DB_LOGIN_TYPE sysname null, 
						SERVER_LOGIN_TYPE sysname null, 
						DEFAULT_SCHEMA sysname null, 
						ROLE_ASSOCIATED varchar(max),
						CREATED_DATE datetime,
						MODIFY_DATE datetime,
						HOSTNAME sysname) 

--Se utiliza el procedimiento almacenado sp_MSforeachdb para 
--recorrer cada una de las bases de datos en el sistema y se
--almacenan en la variable que se creó anteriormente
INSERT @DB_USers EXEC sp_MSforeachdb   
				'use [?] 
				SELECT ''?'' AS DATABASE_NAME
				,DBP.name AS USERNAME
				,SP.name AS LOGIN_NAME
				,DBP.type AS TYPE
				,DBP.type_desc AS DB_LOGIN_TYPE
				,SP.type_desc AS SERVER_LOGIN_TYPE
				,DBP.default_schema_name as DEFAULT_SCHEMA
				,USER_NAME(DRM.role_principal_id) AS ROLE_ASSOCIATED 
				,DBP.create_date as CREATED_DATE
				,DBP.modify_date as MODIFY_DATE
				,(SELECT TOP 1 name 
					FROM [master].[sys].[servers]) HOSTNAME
				FROM sys.database_principals DBP 
				LEFT OUTER JOIN sys.server_principals SP 
					ON SP.sid=DBP.sid
				LEFT OUTER JOIN sys.database_role_members DRM 
					ON DBP.principal_id=DRM.member_principal_id '
											
--Comando para tener la lectura de los valores que se colectaron en la ejecución anterior.
SELECT  USERS.*,last_log.last_logged_in
FROM @DB_USers USERS
--Esta correlacion fue realizada para obtener la ultima conexion del usuario
LEFT JOIN (SELECT login_name, max(login_time) as last_logged_in 
			FROM sys.dm_exec_sessions
			GROUP BY login_name) last_log ON last_log.login_name = USERS.LOGIN_NAME
WHERE USERS.DB_LOGIN_TYPE NOT IN ('DATABASE_ROLE','CERTIFICATE_MAPPED_USER','')
AND USERS.USERNAME NOT LIKE '##%'

END
GO

EXEC GET_USERS_WITH_ACCESS_TO_SQLSERVER_SCHEMA
