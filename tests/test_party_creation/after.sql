
DROP USER 'techtestparty'@'localhost'
;
DELETE FROM party
WHERE UPPER(name) = UPPER('testparty')
;
DELETE FROM party_category 
WHERE UPPER(name) = UPPER('testcategory')
;

