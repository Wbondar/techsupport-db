DELIMITER ENDROUTINE
CREATE PROCEDURE party_category_inherit_permissions
(
      IN  arg_party_category_id $PARTY_CATEGORY_ID_TYPE
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    SELECT parent_id INTO @parent_id 
    FROM party_category 
    WHERE party_category.id = arg_party_category_id
    ;
    WHILE @parent_id IS NOT NULL DO
        INSERT INTO party_category_permissions (party_category_id, permission_id) 
        SELECT arg_party_category_id, p.permission_id
        FROM party_category_permissions AS p 
        WHERE p.party_category_id = @parent_id
        ;
        SELECT parent_id INTO @parent_id 
        FROM party_category 
        WHERE party_category.id = @parent_id 
        ;
    END WHILE
    ;
END
ENDROUTINE
DELIMITER ;
