INSERT INTO issue (id, content, issued_at, issued_by)
VALUES
  (1, 'Content of the issue with identificator of value 1. It has to be initially open.', NOW( ) - INTERVAL 1 WEEK, 2)
, (2, 'Content of the issue with identificator of value 2. It has to be initially assggned to party with id of value 1 and then reassigned to party with id of value 2.', NOW( ) - INTERVAL 2 WEEK, 2)
, (3, 'Content of the issue with identificator of value 3. It has to be initially assigned to party with id of value 1.', NOW( ) - INTERVAL 3 WEEK, 2)
, (4, 'Content of the issue with identificator of value 4. It has to be initially closed by party with id of value 1.', NOW( ) - INTERVAL 4 WEEK, 2)
;
