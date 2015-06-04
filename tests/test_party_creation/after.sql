
DROP USER 'techtestparty'@'localhost'
;
DROP TABLE testtable
;
DELETE FROM party
WHERE UPPER(name) = UPPER('testparty')
;
DELETE FROM party_category 
WHERE UPPER(name) = UPPER('testcategory')
;
DELETE FROM permission
WHERE UPPER(title) = UPPER('testpermission')
;

