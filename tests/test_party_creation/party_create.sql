
SELECT id INTO @var_party_category_id
FROM party_category 
WHERE UPPER(name) = UPPER('testcategory')
LIMIT 1
;
CALL party_create ('testparty', 'testparty', @var_party_category_id, @var_party_id)
;
SELECT name = 'testparty' AS creation_success
FROM party 
WHERE id = @var_party_id
;
FLUSH PRIVILEGES
;

