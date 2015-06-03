DELIMITER ENDROUTINE
CREATE PROCEDURE party_create
(
      IN arg_party_name        $PARTY_NAME_TYPE
    , IN arg_party_password    $PARTY_PASSWORD_TYPE
    , IN arg_party_category_id $PARTY_CATEGORY_ID_TYPE
    , OUT arg_party_id         $PARTY_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;
    SELECT next_value INTO arg_party_id 
    FROM seq_party_id
    ;
    SET @var_password_hash = PASSWORD(arg_party_password)
    ;
    CALL party_create_database_user(arg_party_name, @var_password_hash)
    ;
    INSERT INTO party (id, name, password_hash, category_id) VALUES
    (arg_party_id, arg_party_name, @var_password_hash, arg_party_category_id)
    ;
    FLUSH PRIVILEGES
    ;
    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;
