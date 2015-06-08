CREATE VIEW view_issue_complete
AS
SELECT 
      issue.id AS id
    , COALESCE(comment.content, 'Description of the issue is missing.') AS content
    , issue.issued_by
    , issue.issued_at
    , issue_assignation.assignee_id
    , issue_assignation.assigned_id
    , issue_assignation.assigned_at 
    , issue_closing.closed_by
    , issue_closing.closed_at
FROM issue 
    LEFT OUTER JOIN issue_assignation ON issue.id = issue_assignation.issue_id 
    LEFT OUTER JOIN issue_closing ON issue.id = issue_closing.issue_id
    JOIN comment ON issue.id = comment.issue_id
WHERE comment.id = 1 AND comment.reply_to IS NULL
    AND issue_assignation.assigned_at = 
    (
        SELECT MAX(suba.assigned_at)
        FROM issue_assignation AS suba 
        WHERE issue_assignation.issue_id = suba.issue_id
    ) OR issue_assignation.assigned_at IS NULL

;