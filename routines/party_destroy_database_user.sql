DELIMITER ENDROUTINE
CREATE PROCEDURE party_destroy_database_user
(
      IN arg_party_id $PARTY_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SET @name_of_database_user = get_name_of_existing_database_user(arg_party_id)
    ;
    SET @sql = CONCAT('DROP USER ', @name_of_database_user)
    ;
    PREPARE destroy_user_dynamically 
    FROM @sql
    ;
    EXECUTE destroy_user_dynamically
    ;
    DEALLOCATE PREPARE destroy_user_dynamically
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
