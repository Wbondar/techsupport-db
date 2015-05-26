CREATE VIEW view_issue_open_unassigned
AS
SELECT *
FROM issue
WHERE issue.id NOT IN (SELECT issue_id FROM issue_closing)
    AND issue.id NOT IN (SELECT issue_id FROM issue_assignation)
;
