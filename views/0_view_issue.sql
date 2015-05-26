CREATE VIEW view_issue 
AS
SELECT 
      issue.id AS id
    , issue.issued_at AS issued_at
    , issue.issued_by AS issued_by
    , COALESCE(comment.content, 'Description of the issue is missing.') AS content
FROM issue JOIN comment ON issue.id = comment.issue_id
WHERE comment.id = 1 AND comment.reply_to IS NULL
;