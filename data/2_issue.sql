INSERT INTO issue (id, issued_at, issued_by)
VALUES
  (1, NOW( ) - INTERVAL 1 WEEK, 2)
, (2, NOW( ) - INTERVAL 2 WEEK, 2)
, (3, NOW( ) - INTERVAL 3 WEEK, 2)
, (4, NOW( ) - INTERVAL 4 WEEK, 2)
;
