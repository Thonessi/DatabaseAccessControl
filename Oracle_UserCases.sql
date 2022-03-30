--ACTIVE DIRECTORY USER/OBJECT - GRANT ACCESS TO A SCHEMA
	--p_type -> WINDOWS (WINDOWS OBJECT)
    --p_windows_login -> SAM_ACCOUNT@DOMAIN
    --admin_option -> TRUE/FALSE
	--p_login -> ORACLE INTERNAL LOGIN
	--p_password -> NOT REQUIRED
	--schema_privilege -> GRANTED ROLE / SYSTEM PRIVILEGE
	--p_action -> ADD

--GRANTED ROLE WITHOUT ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Windows',/*p_windows_login =*/'LABuser1@lab.local',/*admin_option =*/'false',/*p_login =*/'LABuser1',/*p_password =*/'',/*schema_privilege =*/'SODA_APP',/*p_action =*/'ADD');
--SYSTEM PRIVILEGE WITH ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Windows',/*p_windows_login =*/'LABuser2@lab.local',/*admin_option =*/'true',/*p_login =*/'LABuser2',/*p_password =*/'',/*schema_privilege =*/'ADVISOR',/*p_action =*/'ADD');
--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - GRANT ACCESS TO A SCHEMA
	--p_type -> LOCAL
    --p_windows_login -> NOT REQUIRED
    --admin_option -> TRUE/FALSE
	--p_login -> ORACLE INTERNAL LOGIN
	--p_password -> ALFA NUMERIC VALUES ONLY
	--schema_privilege -> GRANTED ROLE / SYSTEM PRIVILEGE
	--p_action -> ADD

--GRANTED ROLE WITHOUT ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Local',/*p_windows_login =*/'',/*admin_option =*/'false',/*p_login =*/'Local_Account_1',/*p_password =*/'Welcome123',/*schema_privilege =*/'BDSQL_USER',/*p_action =*/'ADD');
--SYSTEM PRIVILEGE WITH ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Local',/*p_windows_login =*/'',/*admin_option =*/'true',/*p_login =*/'Local_Account_2',/*p_password =*/'Welcome123',/*schema_privilege =*/'ALTER SESSION',/*p_action =*/'ADD');

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--ACTIVE DIRECTORY USER/OBJECT - DELETE AN ACCESS FROM A SCHEMA
	--p_type -> WINDOWS (WINDOWS OBJECT)
    --p_windows_login -> SAM_ACCOUNT@DOMAIN
    --admin_option -> NOT REQUIRED
	--p_login -> ORACLE INTERNAL LOGIN
	--p_password -> NOT REQUIRED
	--schema_privilege -> GRANTED ROLE / SYSTEM PRIVILEGE
	--p_action -> DELETE

--GRANTED ROLE
EXECUTE AccountManagement (/*p_type=*/'Windows',/*p_windows_login =*/'LABuser1@lab.local',/*admin_option =*/'',/*p_login =*/'LABuser1',/*p_password =*/'',/*schema_privilege =*/'SODA_APP',/*p_action =*/'DELETE');
--SYSTEM PRIVILEGE
EXECUTE AccountManagement (/*p_type=*/'Windows',/*p_windows_login =*/'LABuser2@lab.local',/*admin_option =*/'',/*p_login =*/'LABuser2',/*p_password =*/'',/*schema_privilege =*/'ADVISOR',/*p_action =*/'DELETE');

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - DELETE AN ACCESS FROM A SCHEMA
	--p_type -> LOCAL
    --p_windows_login -> NOT REQUIRED
    --admin_option -> NOT REQUIRED
	--p_login -> ORACLE INTERNAL LOGIN
	--p_password -> NOT REQUIRED
	--schema_privilege -> GRANTED ROLE / SYSTEM PRIVILEGE
	--p_action -> DELETE

--GRANTED ROLE WITHOUT ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Local',/*p_windows_login =*/'',/*admin_option =*/'',/*p_login =*/'Local_Account_1',/*p_password =*/'',/*schema_privilege =*/'BDSQL_USER',/*p_action =*/'DELETE');
--SYSTEM PRIVILEGE WITH ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Local',/*p_windows_login =*/'',/*admin_option =*/'',/*p_login =*/'Local_Account_2',/*p_password =*/'',/*schema_privilege =*/'ALTER SESSION',/*p_action =*/'DELETE');

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--ACTIVE DIRECTORY USER/OBJECT - DELETE A USER FROM A SCHEMA
	--p_type -> WINDOWS (WINDOWS OBJECT)
    --p_windows_login -> SAM_ACCOUNT@DOMAIN
    --admin_option -> NOT REQUIRED
	--p_login -> ORACLE INTERNAL LOGIN
	--p_password -> NOT REQUIRED
	--schema_privilege -> NOT REQUIRED
	--p_action -> DROP

--GRANTED ROLE
EXECUTE AccountManagement (/*p_type=*/'Windows',/*p_windows_login =*/'LABuser1@lab.local',/*admin_option =*/'',/*p_login =*/'LABuser1',/*p_password =*/'',/*schema_privilege =*/'',/*p_action =*/'DROP');
--SYSTEM PRIVILEGE
EXECUTE AccountManagement (/*p_type=*/'Windows',/*p_windows_login =*/'LABuser2@lab.local',/*admin_option =*/'',/*p_login =*/'LABuser2',/*p_password =*/'',/*schema_privilege =*/'',/*p_action =*/'DROP');

--------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

--LOCAL SQL ACCOUNT - DELETE A USER FROM A SCHEMA
	--p_type -> LOCAL
    --p_windows_login -> NOT REQUIRED
    --admin_option -> NOT REQUIRED
	--p_login -> ORACLE INTERNAL LOGIN
	--p_password -> NOT REQUIRED
	--schema_privilege -> NOT REQUIRED
	--p_action -> DROP

--GRANTED ROLE WITHOUT ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Local',/*p_windows_login =*/'',/*admin_option =*/'',/*p_login =*/'Local_Account_1',/*p_password =*/'',/*schema_privilege =*/'',/*p_action =*/'DROP');
--SYSTEM PRIVILEGE WITH ADMIN OPTION
EXECUTE AccountManagement (/*p_type=*/'Local',/*p_windows_login =*/'',/*admin_option =*/'',/*p_login =*/'Local_Account_2',/*p_password =*/'',/*schema_privilege =*/'',/*p_action =*/'DROP');
