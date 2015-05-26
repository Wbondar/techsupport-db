CREATE VIEW view_issue_open_assigned
AS
SELECT *
FROM view_issue_assigned
WHERE id NOT IN
    (
    	SELECT issue_id
    	FROM issue_closing
    )
;
