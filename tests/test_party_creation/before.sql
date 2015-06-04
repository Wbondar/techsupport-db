
SELECT COALESCE(next_value, 1) INTO @var_party_category_id
FROM seq_party_category_id
LIMIT 1
;
INSERT INTO party_category (id, name, parent_id) VALUES
(@var_party_category_id, 'testcategory', NULL)
;
SELECT COALESCE(current_value, 1) INTO @var_party_category_id
FROM seq_party_category_id
LIMIT 1
;
SELECT COALESCE(next_value, 1) INTO @var_permission_id
FROM seq_permission_id
LIMIT 1
;
CREATE TABLE testtable (value TEXT NOT NULL);
INSERT INTO testtable (value) VALUES ('Success.');
INSERT INTO permission (id, title) VALUES
(@var_permission_id, 'testpermission')
;
INSERT INTO permission_table (permission_id, permission_table_id, table_name, table_priv) VALUES
(@var_permission_id, 1, 'testtable', 'select')
;
INSERT INTO party_category_permissions (party_category_id, permission_id) VALUES
(@var_party_category_id, @var_permission_id)
;

