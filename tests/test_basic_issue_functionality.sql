SET @var_assignee_id = 1
;
SET @var_assigned_id = 2
;
CALL issue_open(@var_assignee_id, 'Content of a testing issue.', @var_issue_id)
;
SELECT id = @var_issue_id AS open_successful
FROM view_issue_open
WHERE id = @var_issue_id
;
CALL issue_assign(@var_assignee_id, @var_issue_id, @var_assigned_id)
;
SELECT assigned_id = @var_assigned_id AS assign_successful
FROM view_issue_assigned
WHERE id = @var_issue_id
;
CALL issue_close(@var_assignee_id, @var_issue_id)
;
SELECT closed_by = @var_assignee_id AS close_successful
FROM view_issue_closed
WHERE id = @var_issue_id
;
