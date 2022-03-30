DELIMITER //
CREATE PROCEDURE AccountManagement ( hostname varchar(10), p_login varchar(30), p_schema varchar(20), p_password varchar(30),schema_privilege varchar(30),p_action varchar(30))
BEGIN
	-- THIS COMMAND IS EXCLUSIVE WHEN THE ACTION IS 'CREATE'
	-- ESTE COMANDO ES EXCLUSIVO CUANDO LA ACCIÓN ES 'CREAR'
    IF p_action = 'ADD'
    THEN 
		-- THESE COMMANDS ARE TO CREATE AN USER'S OBJECT IN THE HOST/SERVER
		-- ESTOS COMANDOS SON PARA CREAR UN OBJETO DE USUARIO EN EL HOST/SERVIDOR
        SET @create_user = CONCAT('CREATE USER IF NOT EXISTS ',p_login,'@',hostname,' IDENTIFIED BY ','\'',p_password,'\'');
        PREPARE stmt_create FROM @create_user; 
		EXECUTE stmt_create; 
		DEALLOCATE PREPARE stmt_create; 

		-- THESE COMMANDS ARE TO GRANT A PRIVILEGE ACCESS TO THE USER IN THE SCHEMA
		-- ESTOS COMANDOS SON PARA OTORGAR UN PRIVILEGIO DE ACCESO AL USUARIO EN EL ESQUEMA
        SET @grant_access = CONCAT('GRANT ',schema_privilege,' ON ',p_schema,'.* TO ',p_login,'@',hostname);
        PREPARE stmt_grant FROM @grant_access; 
		EXECUTE stmt_grant; 
		DEALLOCATE PREPARE stmt_grant; 
    END IF;
    
    -- THIS COMMAND IS EXCLUSIVE WHEN THE ACTION IS 'DROP'
	-- ESTE COMANDO ES EXCLUSIVO CUANDO LA ACCIÓN ES 'ELIMINAR'
    IF p_action = 'DROP'
    THEN 
		-- THESE COMMANDS ARE TO DROP COMPLETELY THE USER'S OBJECT IN THE HOST/SERVER
		-- ESTOS COMANDOS SON PARA ELIMINAR COMPLETAMENTE EL OBJETO DEL USUARIO EN EL HOST/SERVIDOR
        SET @drop_user = CONCAT('DROP USER ',p_login,'@',hostname);
        PREPARE stmt_drop FROM @drop_user; 
		EXECUTE stmt_drop; 
		DEALLOCATE PREPARE stmt_drop;
    END IF;
    
    -- THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'DELETE'
	-- ESTE COMANDO ES EXCLUSIVO CUANDO LA ACCIÓN ES 'REMOVER'
    IF p_action = 'DELETE'
    THEN 
		-- THESE COMMANDS ARE TO DELETE A SINGLE PRIVILEGE FOR THE USER IN THE SCHEMA
		-- ESTOS COMANDOS SON PARA REMOVER UN SOLO PRIVILEGIO PARA EL USUARIO EN EL ESQUEMA
        SET @delete_access = CONCAT('REVOKE ',schema_privilege,' ON ',p_schema,'.* FROM ',p_login,'@',hostname);
        PREPARE stmt_delete FROM @delete_access; 
		EXECUTE stmt_delete; 
		DEALLOCATE PREPARE stmt_delete;
    END IF;    
END //
DELIMITER ;

--CALL AccountManagement ('localhost','user','new_schema','123','UPDATE','ADD');
