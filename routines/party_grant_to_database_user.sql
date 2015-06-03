DELIMITER ENDROUTINE
CREATE PROCEDURE party_grant_to_database_user
(
      IN arg_party_id      $PARTY_ID_TYPE
    , IN arg_permission_id $PERMISSION_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT name INTO @var_party_name
    FROM party 
    WHERE party.id = arg_party_id
    ;
    SET @var_username = get_name_of_database_user(@var_party_name)
    ;
    INSERT INTO mysql.tables_priv (host, db, user, table_name, grantor, table_priv)
    SELECT '$HOST', '$DATABASE', @var_username, p.table_name, '$ADMIN_USERNAME@$HOST', p.table_priv
    FROM permission_table AS p
    WHERE p.permission_id = arg_permission_id
    ;
    INSERT INTO mysql.procs_priv (host, db, user, routine_name, routine_type, grantor, proc_priv)
    SELECT '$HOST', '$DATABASE', @var_username, p.routine_name, p.routine_type, '$ADMIN_USERNAME@$HOST', p.proc_priv
    FROM permission_routine AS p
    WHERE p.permission_id = arg_permission_id
    ;
END
ENDROUTINE
DELIMITER ;
