START TRANSACTION
;
INSERT INTO permission (id, title) VALUES 
(1, 'all')
;
INSERT INTO permission_table (permission_id, permission_table_id, table_name, table_priv) VALUES
  (1, 1, 'view_issue_open', 'select')
, (1, 2, 'view_issue_assigned', 'select')
, (1, 3, 'view_issue_closed', 'select')
, (1, 4, 'view_party', 'select')
, (1, 5, 'view_comment', 'select')
;
INSERT INTO permission_routine (permission_id, permission_routine_id, routine_name, routine_type, proc_priv) VALUES
  (1, 1, 'issue_open', 'PROCEDURE', 'Execute')
, (1, 2, 'issue_assign', 'PROCEDURE', 'Execute')
, (1, 3, 'issue_close', 'PROCEDURE', 'Execute')
, (1, 4, 'party_create', 'PROCEDURE', 'Execute')
, (1, 5, 'comment', 'PROCEDURE', 'Execute')
;
INSERT INTO party_category (id, name) VALUES
  (1, 'tester')
;
INSERT INTO party_category_permissions (party_category_id, permission_id) VALUES 
  (1, 1)
;
CALL party_create ('root', 'root', 1, @var_party_id)
;
SELECT * 
FROM party 
    JOIN party_permissions ON party.id = party_permissions.party_id 
    JOIN permission ON party_permissions.permission_id = permission.id
WHERE party.id = @var_party_id
;
COMMIT
;