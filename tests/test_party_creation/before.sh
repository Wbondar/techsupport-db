#!/bin/sh

source test.conf

rm test.log

echo "
SELECT COALESCE(next_value, 1) INTO @var_party_category_id
FROM seq_party_category_id
LIMIT 1
;
INSERT INTO party_category (id, name, parent_id) VALUES
(@var_party_category_id, '$TEST_PARTY_CATEGORY_NAME', NULL)
;
SELECT COALESCE(current_value, 1) INTO @var_party_category_id
FROM seq_party_category_id
LIMIT 1
;
SELECT COALESCE(next_value, 1) INTO @var_permission_id
FROM seq_permission_id
LIMIT 1
;
CREATE TABLE $TEST_TABLE_NAME (value TEXT NOT NULL);
INSERT INTO $TEST_TABLE_NAME (value) VALUES ('Success.');
INSERT INTO permission (id, title) VALUES
(@var_permission_id, '$TEST_PERMISSION_TITLE')
;
INSERT INTO permission_table (permission_id, permission_table_id, table_name, table_priv) VALUES
(@var_permission_id, 1, '$TEST_TABLE_NAME', 'select')
;
INSERT INTO party_category_permissions (party_category_id, permission_id) VALUES
(@var_party_category_id, @var_permission_id)
;
" > before.sql

echo "
SELECT id INTO @var_party_category_id
FROM party_category 
WHERE UPPER(name) = UPPER('$TEST_PARTY_CATEGORY_NAME')
LIMIT 1
;
CALL party_create ('$TEST_PARTY_NAME', '$TEST_PARTY_PASSWORD', @var_party_category_id, @var_party_id)
;
SELECT name = '$TEST_PARTY_NAME' AS creation_success
FROM party 
WHERE id = @var_party_id
;
FLUSH PRIVILEGES
;
" > party_create.sql

echo "
SELECT value IS NOT NULL AS connection_success FROM $TEST_TABLE_NAME LIMIT 1;
" > user_connect.sql

echo "
DROP USER '$DATABASE_USER_PREFIX$TEST_PARTY_NAME'@'$HOST'
;
DROP TABLE $TEST_TABLE_NAME
;
DELETE FROM party
WHERE UPPER(name) = UPPER('$TEST_PARTY_NAME')
;
DELETE FROM party_category 
WHERE UPPER(name) = UPPER('$TEST_PARTY_CATEGORY_NAME')
;
DELETE FROM permission
WHERE UPPER(title) = UPPER('$TEST_PERMISSION_TITLE')
;
" > after.sql

cat before.sql
mysql --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD < before.sql >> test.log $DATABASE 