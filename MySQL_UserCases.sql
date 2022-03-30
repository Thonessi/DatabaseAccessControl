-- MYSQL ACCOUNT - ADD NEW SCHEMA PRIVILEGE FROM USER'S PROFILE
	-- HOSTNAME -> HOSTNAME/SERVER NAME
	-- LOGIN -> PERSONALIZED_NAME
	-- SCHEMA -> SCHEMA_NAME
	-- PASSWORD -> NOT REQUIRED, PASSWORD WAS PREVIOUSLY CONFIGURED
	-- SCHEMA_PRIVILEGE -> IT CAN BE ONE OF THE FOLLOWING
		-- SELECT, INSERT, UPDATE, DELETE, EXECUTE, SHOW VIEW
	-- ACTION -> NOT REQUIRED

CALL AccountManagement ('localhost','user','new_schema','123','DROP','ADD');

-------- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

-- MYSQL ACCOUNT - DELETE ONE SCHEMA PRIVILEGE FROM USER'S PROFILE
	-- HOSTNAME -> HOSTNAME/SERVER NAME
	-- LOGIN -> PERSONALIZED_NAME
	-- SCHEMA -> SCHEMA_NAME
	-- PASSWORD -> NOT REQUIRED, PASSWORD WAS PREVIOUSLY CONFIGURED
	-- SCHEMA_PRIVILEGE -> IT CAN BE ONE OF THE FOLLOWING
		-- SELECT, INSERT, UPDATE, DELETE, EXECUTE, SHOW VIEW
	-- ACTION -> DELETE

CALL AccountManagement ('localhost','user','new_schema','','INSERT','DELETE');

-------- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------

-- MYSQL ACCOUNT - DROP THE ENTIRE USER'S OBJECT FROM THE HOST/SERVER
	-- HOSTNAME -> HOSTNAME/SERVER NAME
	-- LOGIN -> PERSONALIZED_NAME
	-- SCHEMA -> SCHEMA_NAME
	-- PASSWORD -> NOT REQUIRED, PASSWORD WAS PREVIOUSLY CONFIGURED
	-- SCHEMA_PRIVILEGE -> NOT REQUIRED, THE USER WILL BE COMPLETELY DELETED
	-- ACTION -> DROP

CALL AccountManagement ('localhost','user','new_schema','','INSERT','DROP');

-------- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&--------
