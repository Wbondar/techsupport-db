CREATE VIEW view_issue_closed
AS
SELECT *
FROM issue JOIN issue_closing ON issue.id = issue_closing.issue_id
WHERE issue.id = issue_closing.issue_id
;
