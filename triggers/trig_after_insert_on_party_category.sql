DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_party_category AFTER INSERT ON party_category
FOR EACH ROW
BEGIN
    CALL party_category_inherit_permissions (NEW.id);
END
ENDTRIGGER
DELIMITER ;
