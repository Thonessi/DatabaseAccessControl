CREATE PROCEDURE AccountManagement @Type varchar(10), @login varchar(30), @database varchar(20), @password varchar(30),@role varchar(30),@action varchar(30)
AS
BEGIN
	--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'CREATE'
	IF @action = 'CREATE'
		BEGIN
		--CHOOSE IF USER TO BE CREATED IS AN ACTIVE DIRECTORY OR LOCAL USER

			--AD USER LOGIC BEGINS
			IF @Type='Windows'
			BEGIN
				DECLARE @cmd_windows varchar(200)
				--LOGIN CREATION COMMAND (FIRST STEP)
				set @cmd_windows = 'CREATE LOGIN ['+@login +'] FROM WINDOWS WITH DEFAULT_DATABASE=[master]' 
				--TRY LOOP
				BEGIN TRY
					--CREATE LOGIN COMMAND EXECUTION
					IF NOT EXISTS(SELECT * FROM SYS.server_principals 
						WHERE name = @login)
						BEGIN
							EXEC (@cmd_windows)
						END
				END TRY
				--CATCH ERROR
				BEGIN CATCH
					   SELECT  
						ERROR_MESSAGE() AS ErrorMessage;  
				END CATCH
			END
			--AD USER LOGIC FINISHES
			ELSE
				--SQL SERVER AUTHENTICATION/LOCAL USER/SERVICE ACCOUNT LOGIC BEGINS
				IF @Type='Local'
				BEGIN
					DECLARE @cmd_local varchar(200)
					--LOGIN CREATION COMMAND (FIRST STEP)
					set @cmd_local = '
						CREATE LOGIN ['+@login+']
						WITH PASSWORD = '''+@password+''',
						DEFAULT_DATABASE = [master],
						CHECK_POLICY = OFF,
						CHECK_EXPIRATION = OFF ; '
						--TRY LOOP
						BEGIN TRY
							EXEC (@cmd_local)
						END TRY
						--CATCH ERROR
						BEGIN CATCH
						   PRINT ERROR_MESSAGE()
						END CATCH
				END
				--SQL SERVER AUTHENTICATION/LOCAL USER/SERVICE ACCOUNT LOGIC FINISHES

				DECLARE @create_user varchar(500)
					SET @create_user = ('USE '+@database+'; CREATE USER ['+@login+'] FOR LOGIN ['+@login+'] ; USE '+@database+' ; ALTER USER ['+@login+'] WITH DEFAULT_SCHEMA='+@role+' ; ALTER ROLE ['+@role+'] ADD MEMBER ['+@login+']')
					EXEC (@create_user)
		END

	--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'MODIFY'
	--MODIFY IS REQUIRED WHEN THE ACCOUNT ALREADY EXIST AND IT IS REQUIRED TO ADD A NEW ROLE IN THE ACCOUNT'S PROFILE
	IF @action = 'MODIFY'
	BEGIN
		DECLARE @modify_user varchar(500)
		SET @modify_user = ('USE '+@database+'; ALTER ROLE ['+@role+'] ADD MEMBER ['+@login+']')
		EXEC (@modify_user)
	END
	--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'DELETE'
	--DELETE IS THE ACTION TO EXCLUSIVELY DELETE A ROLE FROM THE USER'S PROFILE, IT WON'T DELETE THE ACCOUNT FROM THE DATABASE OR THE LOGIN
	IF @action = 'DELETE'
	BEGIN
		DECLARE @delete_role varchar(500)
		SET @delete_role = ('USE '+@database+'; ALTER ROLE ['+@role+'] DROP MEMBER ['+@login+']')
		EXEC (@delete_role)
	END
	--THIS COMMAND IS EXCLUSIVELY WHEN THE ACTION IS 'DELETE'
	--DROP WILL DELETE COMPLETELY THE USER AND LOGIN FROM THE DATABASE
	IF @action = 'DROP'
	BEGIN
		DECLARE @drop_user varchar(500)
		--REMOVE ROLES AND USER ACCOUNT FROM THE DATABASE
		SET @drop_user = ('USE '+@database+'; DROP USER ['+@login+']')
		EXEC (@drop_user)
		--REMOVE LOGIN ACCOUNT FROM THE SERVER ITSELF
		SET @drop_user = ('USE [master]; DROP LOGIN ['+@login+']')
		EXEC (@drop_user)
	END
END

--EXEC AccountManagement @Type = 'Windows', @login = 'LAB\LABuser11',@database = 'lablocal',@password = '123',@role = 'db_datareader',@action = 'MODIFY'
