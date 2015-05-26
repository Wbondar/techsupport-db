CREATE VIEW view_issue_assigned
AS
SELECT *
FROM issue JOIN issue_assignation ON issue.id = issue_assignation.issue_id
WHERE issue.id = issue_assignation.issue_id
;
