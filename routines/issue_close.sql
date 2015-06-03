DELIMITER ENDROUTINE
CREATE PROCEDURE issue_close
(
      IN arg_party_id $PARTY_ID_TYPE
    , IN arg_issue_id $ISSUE_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION 
    ;
    INSERT INTO issue_closing (issue_id, closed_at, closed_by) VALUES
    (arg_issue_id, NOW( ), arg_party_id)
    ;
    COMMIT 
    ;
END
ENDROUTINE
DELIMITER ;
