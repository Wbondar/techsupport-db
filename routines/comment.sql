DELIMITER ENDROUTINE
CREATE PROCEDURE comment
(
	  IN arg_issue_id    $ISSUE_ID_TYPE
	, IN arg_autor_id    $PARTY_ID_TYPE
	, IN arg_content     $COMMENT_CONTENT_TYPE
	, IN arg_reply_to    $COMMENT_ID_TYPE
	, OUT arg_comment_id $COMMENT_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT next_value INTO arg_comment_id
    FROM seq_comment_id
    WHERE seq_comment_id.issue_id = arg_issue_id
    ;
    INSERT INTO comment (issue_id, id, author_id, content, reply_to, posted_at) VALUES
    (arg_issue_id, arg_comment_id, arg_autor_id, arg_content, COALESCE(arg_reply_to, 1), NOW( ))
    ;
END
ENDROUTINE
DELIMITER ;
