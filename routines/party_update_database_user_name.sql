DELIMITER ENDROUTINE
CREATE PROCEDURE party_update_database_user_name
(
      IN arg_party_name_old $PARTY_NAME_TYPE
    , IN arg_party_name_new $PARTY_NAME_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SET @sql = CONCAT('RENAME USER ', get_name_of_database_user(arg_party_name_old), ' TO ', get_name_of_database_user(arg_party_name_new))
    ;
    PREPARE set_name_for_database_user_dynamically
    FROM @sql
    ;
    DEALLOCATE PREPARE set_name_for_database_user_dynamically
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
