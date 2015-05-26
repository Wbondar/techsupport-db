CREATE VIEW view_issue_closed
AS
SELECT issue.*, issue_closing.closed_by, issue_closing.closed_at
FROM issue JOIN issue_closing ON issue.id = issue_closing.issue_id
WHERE issue.id = issue_closing.issue_id
;
