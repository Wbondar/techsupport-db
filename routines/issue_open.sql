DELIMITER ENDROUTINE
CREATE PROCEDURE issue_open
(
      IN arg_party_id      $PARTY_ID_TYPE
    , IN arg_issue_content $COMMENT_CONTENT_TYPE
    , OUT arg_issue_id     $ISSUE_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT next_value INTO arg_issue_id 
    FROM seq_issue_id
    ;
    INSERT INTO issue (id, issued_at, issued_by)
    VALUES (arg_issue_id, NOW( ), arg_party_id)
    ;
    INSERT INTO comment (issue_id, id, author_id, content, posted_at) VALUES
    (arg_issue_id, 1, arg_party_id, arg_issue_content, NOW( ))
    ;
END
ENDROUTINE
DELIMITER ;
