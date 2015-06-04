#!/bin/sh

source test.conf

echo "
SELECT next_value INTO @var_party_category_id
FROM seq_party_category_id
;
INSERT INTO party_category (id, name, parent_id) VALUES
(@var_party_category_id, '$TEST_PARTY_CATEGORY_NAME', NULL)
;
SELECT current_value INTO @var_party_category_id
FROM seq_party_category_id
;
CALL party_create ('$TEST_PARTY_NAME', '$TEST_PARTY_PASSWORD', @var_party_category_id, @var_party_id)
;
SELECT name = '$TEST_PARTY_NAME' AS success
FROM party 
WHERE id = @var_party_id
;
" > test.sql

echo "
DROP USER '$DATABASE_USER_PREFIX$TEST_PARTY_NAME'@'$HOST'
;
DELETE FROM party
WHERE UPPER(name) = UPPER('$TEST_PARTY_NAME')
;
DELETE FROM party_category 
WHERE UPPER(name) = UPPER('$TEST_PARTY_CATEGORY_NAME')
;
" > after.sql