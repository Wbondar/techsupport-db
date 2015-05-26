DELIMITER ENDROUTINE
CREATE PROCEDURE issue_open
(
      IN arg_party_id      $PARTY_ID_TYPE
    , IN arg_issue_content $ISSUE_CONTENT_TYPE
    , OUT arg_issue_id     $ISSUE_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT next_value INTO @var_issue_id FROM seq_issue_id
    ;
    INSERT INTO issue (id, content, issued_at, issued_by)
    SELECT @var_issue_id, arg_issue_content, NOW( ), arg_party_id
    ;
    SELECT @var_issue_id INTO arg_issue_id
    ;
END
ENDROUTINE
DELIMITER ;
