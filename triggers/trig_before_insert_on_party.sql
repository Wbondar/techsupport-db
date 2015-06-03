DELIMITER ENDTRIGGER
CREATE TRIGGER trig_before_insert_on_party BEFORE INSERT ON party
FOR EACH ROW
BEGIN
    /*CALL party_create_database_user (NEW.name, NEW.password_hash)
    ;*/
END
ENDTRIGGER
DELIMITER ;
