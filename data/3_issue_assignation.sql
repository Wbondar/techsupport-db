INSERT INTO issue_assignation (issue_id, assigned_at, assigned_id, assignee_id)
VALUES
  (2, NOW( ) - INTERVAL 2 DAY, 1, 1)
, (2, NOW( ) - INTERVAL 1 DAY, 2, 1)
, (3, NOW( ) - INTERVAL 3 DAY, 1, 1)
, (4, NOW( ) - INTERVAL 4 DAY, 2, 2)
;
