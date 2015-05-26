CREATE VIEW view_issue_assigned
AS
SELECT s.*, a.assignee_id, a.assigned_id, a.assigned_at
FROM issue AS s JOIN issue_assignation AS a ON s.id = a.issue_id
WHERE a.assigned_at = 
    (
    	SELECT MAX(suba.assigned_at)
    	FROM issue_assignation AS suba 
    	WHERE a.issue_id = suba.issue_id
    )
    AND s.id NOT IN
    (
        SELECT issue_id
        FROM issue_closing
    )
;
