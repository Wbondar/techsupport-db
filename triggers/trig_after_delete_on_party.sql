DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_delete_on_party AFTER DELETE ON party
FOR EACH ROW
BEGIN
    /*CALL party_destroy_database_user(OLD.id)
    ;*/
END
ENDTRIGGER
DELIMITER ;
