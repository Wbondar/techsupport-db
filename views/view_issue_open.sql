CREATE VIEW view_issue_open
AS
SELECT *
FROM view_issue
WHERE view_issue.id NOT IN (SELECT issue_id FROM issue_closing)
    AND view_issue.id NOT IN (SELECT issue_id FROM issue_assignation)
;
