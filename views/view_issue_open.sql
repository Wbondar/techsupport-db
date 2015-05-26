CREATE VIEW view_issue_open
AS
SELECT *
FROM issue JOIN issue_closing ON issue.id = issue_closing.issue_id 
WHERE issue.id != issue_closing.issue_id
;
