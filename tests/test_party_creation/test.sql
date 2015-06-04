
SELECT next_value INTO @var_party_category_id
FROM seq_party_category_id
;
INSERT INTO party_category (id, name, parent_id) VALUES
(@var_party_category_id, 'testcategory', NULL)
;
SELECT current_value INTO @var_party_category_id
FROM seq_party_category_id
;
CALL party_create ('testparty', 'testparty', @var_party_category_id, @var_party_id)
;
SELECT name = 'testparty' AS success
FROM party 
WHERE id = @var_party_id
;

