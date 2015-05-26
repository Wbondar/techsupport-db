SET @var_author_id = 2;
SET @var_issue_id = 4;
CALL comment(@var_issue_id, @var_author_id, 'Content of the first comment.', NULL, @last_comment_id)
;
CALL comment(@var_issue_id, @var_author_id, 'Content of the reply to the first comment.', @last_comment_id, @last_comment_id)
;
SELECT *
FROM view_comment
;
