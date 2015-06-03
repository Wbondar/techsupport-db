DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_party_permissions AFTER INSERT ON party_permissions
FOR EACH ROW
BEGIN
    CALL party_grant_to_database_user(NEW.party_id, NEW.permission_id)
    ;
END
ENDTRIGGER
DELIMITER ;
