DELIMITER ENDROUTINE
CREATE PROCEDURE party_update_database_user_password
(
      IN arg_party_name          $PARTY_NAME_TYPE
    , IN arg_party_password_hash $PARTY_PASSWORD_HASH_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SET @sql = CONCAT('PASSWORD FOR ', get_name_of_database_user(arg_party_name), ' = ', '\'', arg_party_password_hash, '\'')
    ;
    PREPARE set_password_for_database_user_dynamically
    FROM @sql
    ;
    DEALLOCATE PREPARE set_password_for_database_user_dynamically
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
