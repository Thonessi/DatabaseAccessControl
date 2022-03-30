--ACTIVE DIRECTORY USER/OBJECT - GRANT ACCESS TO A DATABASE
	--TYPE -> WINDOWS (WINDOWS OBJECT)
	--LOGIN -> DOMAIN\USERNAME OR DOMAIN\ADGROUP
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD IS MANAGED THROUGH THE DOMAIN CONTROLLER
	--ROLE -> IT CAN BE ONE OF THE DEFAULT DATABASE_ROLES 
		--(db_accessadmin, db_backupoperator, db_datareader, db_datawriter, db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin, public)
	--ACTION -> CREATE
EXEC AccountManagement @Type = 'Windows', @login = 'LAB\LABuser11',@database = 'lablocal',@password = '',@role = 'db_datawriter',@action = 'CREATE'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - GRANT ACCESS TO A DATABASE
	--TYPE -> LOCAL (SQL USER WITH LOGIN)
	--LOGIN -> PERSONALIZED_NAME
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> PASSWORD SHOULD BE SET UP
	--ROLE -> IT CAN BE ONE OF THE DEFAULT DATABASE_ROLES 
		--(db_accessadmin, db_backupoperator, db_datareader, db_datawriter, db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin, public)
	--ACTION -> CREATE
EXEC AccountManagement @Type = 'Local', @login = 'LocalAccountName',@database = 'lablocal',@password = '123',@role = 'db_datawriter',@action = 'CREATE'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--ACTIVE DIRECTORY USER/OBJECT - MODIFY ACCESS TO A DATABASE
	--TYPE -> WINDOWS (WINDOWS OBJECT)
	--LOGIN -> DOMAIN\USERNAME OR DOMAIN\ADGROUP
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD IS MANAGED THROUGH THE DOMAIN CONTROLLER
	--ROLE -> IT CAN BE ONE OF THE DEFAULT DATABASE_ROLES 
		--(db_accessadmin, db_backupoperator, db_datareader, db_datawriter, db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin, public)
	--ACTION -> MODIFY

EXEC AccountManagement @Type = 'Windows', @login = 'LAB\LABuser11',@database = 'lablocal',@password = '',@role = 'db_datareader',@action = 'MODIFY'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - MODIFY ACCESS TO A DATABASE
	--TYPE -> LOCAL (SQL USER WITH LOGIN)
	--LOGIN -> IT MUST BE AN EXISTING LOCAL ACCOUNT
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD WAS PREVIOUSLY CONFIGURED
	--ROLE -> IT CAN BE ONE OF THE DEFAULT DATABASE_ROLES 
		--(db_accessadmin, db_backupoperator, db_datareader, db_datawriter, db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin, public)
	--ACTION -> MODIFY

EXEC AccountManagement @Type = 'Local', @login = 'LocalAccountName',@database = 'lablocal',@password = '',@role = 'db_datareader',@action = 'MODIFY'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--ACTIVE DIRECTORY USER/OBJECT - DELETE A ROLE ACCESS FROM A DATABASE
	--TYPE -> WINDOWS (WINDOWS OBJECT)
	--LOGIN -> DOMAIN\USERNAME OR DOMAIN\ADGROUP
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD IS MANAGED THROUGH THE DOMAIN CONTROLLER
	--ROLE -> IT CAN BE ONE OF THE DEFAULT DATABASE_ROLES 
		--(db_accessadmin, db_backupoperator, db_datareader, db_datawriter, db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin, public)
	--ACTION -> MODIFY

EXEC AccountManagement @Type = 'Windows', @login = 'LAB\LABuser11',@database = 'lablocal',@password = '',@role = 'db_datareader',@action = 'DELETE'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - DELETE A ROLE ACCESS FROM A DATABASE
	--TYPE -> LOCAL (SQL USER WITH LOGIN)
	--LOGIN -> IT MUST BE AN EXISTING LOCAL ACCOUNT
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD WAS PREVIOUSLY CONFIGURED
	--ROLE -> IT CAN BE ONE OF THE DEFAULT DATABASE_ROLES 
		--(db_accessadmin, db_backupoperator, db_datareader, db_datawriter, db_ddladmin, db_denydatareader, db_denydatawriter, db_owner, db_securityadmin, public)
	--ACTION -> MODIFY

EXEC AccountManagement @Type = 'Local', @login = 'LocalAccountName',@database = 'lablocal',@password = '',@role = 'db_datareader',@action = 'DELETE'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--ACTIVE DIRECTORY USER/OBJECT - DELETE A ROLE ACCESS FROM A DATABASE
	--TYPE -> WINDOWS (WINDOWS OBJECT)
	--LOGIN -> DOMAIN\USERNAME OR DOMAIN\ADGROUP
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD IS MANAGED THROUGH THE DOMAIN CONTROLLER
	--ROLE -> NOT REQUIRED, IT WILL DROP THE ENTIRE ACCOUNT
	--ACTION -> MODIFY

EXEC AccountManagement @Type = 'Windows', @login = 'LAB\LABuser11',@database = 'lablocal',@password = '',@role = '',@action = 'DROP'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - DELETE A ROLE ACCESS FROM A DATABASE
	--TYPE -> LOCAL (SQL USER WITH LOGIN)
	--LOGIN -> EXISTING LOCAL ACCOUNT
	--DATABASE -> DATABASE_NAME
	--PASSWORD -> NOT REQUIRED, PASSWORD WAS PREVIOUSLY CONFIGURED
	--ROLE -> NOT REQUIRED, IT WILL DROP THE ENTIRE ACCOUNT
	--ACTION -> MODIFY

EXEC AccountManagement @Type = 'Local', @login = 'LocalAccountName',@database = 'lablocal',@password = '',@role = '',@action = 'DROP'

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------