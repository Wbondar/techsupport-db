DELIMITER ENDROUTINE
CREATE PROCEDURE party_create_database_user
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
    SET @var_username = get_name_of_database_user(arg_party_name)
    ;
    SET @var_party_password_hash = arg_party_password_hash
    ;
    /*SELECT variable_value INTO @var_local_hostname
    FROM information_schema.global_variables
    WHERE variable_name = 'hostname'
    ;*/
    SET @create_user_dynamically_sql = CONCAT('CREATE USER ', '\'', @var_username, '\'@\'', '$HOST', '\'', ' IDENTIFIED BY PASSWORD ', '\'', @var_party_password_hash, '\'')
    ;
    PREPARE create_user_dynamically 
    FROM @create_user_dynamically_sql
    ;
    EXECUTE create_user_dynamically
    ;
    DEALLOCATE PREPARE create_user_dynamically
    ;
    SET @grant_privilege_on_executing_procedures_dynamically_sql = CONCAT('GRANT SELECT ON mysql.proc TO ', '\'', @var_username, '\'@\'', '$HOST', '\'')
    ;
    PREPARE grant_privilege_on_executing_procedures_dynamically 
    FROM @grant_privilege_on_executing_procedures_dynamically_sql
    ;
    EXECUTE grant_privilege_on_executing_procedures_dynamically
    ;
    DEALLOCATE PREPARE grant_privilege_on_executing_procedures_dynamically
    ;
    FLUSH PRIVILEGES
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
