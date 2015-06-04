DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_party_category AFTER INSERT ON party_category
FOR EACH ROW
BEGIN
    SELECT next_value INTO @var_next_id
    FROM seq_party_category_id
    ;
    IF NEW.id >= @var_next_id THEN
        UPDATE $DATABASE.seq_party_category_id
        SET next_value = NEW.id + 1
        ;
    END IF
    ;
    UPDATE $DATABASE.seq_party_category_id
    SET current_value = NEW.id
    ;
    CALL party_category_inherit_permissions (NEW.id);
END
ENDTRIGGER
DELIMITER ;
