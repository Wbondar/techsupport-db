DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_party AFTER INSERT ON party
FOR EACH ROW
BEGIN
    SELECT next_value INTO @var_next_id
    FROM seq_party_id
    ;
    IF NEW.id >= @var_next_id THEN
        UPDATE $DATABASE.seq_party_id
        SET next_value = NEW.id + 1
        ;
    END IF
    ;
    UPDATE $DATABASE.seq_party_id
    SET current_value = NEW.id
    ;
    INSERT INTO party_permissions (party_id, permission_id)
    SELECT NEW.id, party_category_permissions.permission_id 
    FROM party_category_permissions
    WHERE party_category_permissions.party_category_id = NEW.category_id  
    ;
END
ENDTRIGGER
DELIMITER ;
