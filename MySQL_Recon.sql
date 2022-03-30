DELIMITER //
CREATE PROCEDURE GET_USERS_WITH_ACCESS_TO_MYSQL_SCHEMA()
BEGIN
	SELECT DB.*,US.password_last_changed,US.account_locked,US.password_expired
	FROM mysql.db DB
	LEFT JOIN mysql.user US ON DB.User = US.User
    LEFT JOIN sys.user_summary SUM ON DB.User = SUM.user;
END //
DELIMITER ;

CALL GET_USERS_WITH_ACCESS_TO_MYSQL_SCHEMA()
