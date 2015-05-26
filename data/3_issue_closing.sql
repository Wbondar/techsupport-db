INSERT INTO issue_closing (issue_id, closed_at, closed_by)
VALUES
  (4, NOW( ) - INTERVAL 1 DAY, 1)
;
