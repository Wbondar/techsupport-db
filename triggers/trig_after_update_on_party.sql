DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_update_on_party AFTER UPDATE ON party
FOR EACH ROW
BEGIN
    /*CALL party_update_database_user_name(OLD.name, NEW.name)
    ;
    CALL party_update_database_user_password(NEW.name, NEW.password_hash)
    ;*/
END
ENDTRIGGER
DELIMITER ;
