DELIMITER ENDROUTINE
CREATE PROCEDURE issue_assign
(
      IN arg_assignee_id $PARTY_ID_TYPE
    , IN arg_issue_id    $ISSUE_ID_TYPE
    , IN arg_assigned_id $PARTY_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    INSERT INTO issue_assignation (issue_id, assigned_at, assignee_id, assigned_id) VALUES
    (arg_issue_id, NOW( ), arg_assignee_id, arg_assigned_id)
    ;
END
ENDROUTINE
DELIMITER ;
