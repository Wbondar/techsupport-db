DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_permission AFTER INSERT ON permission
FOR EACH ROW
BEGIN
    SELECT next_value INTO @var_next_id
    FROM seq_permission_id
    ;
    IF NEW.id >= @var_next_id THEN
        UPDATE $DATABASE.seq_permission_id
        SET next_value = NEW.id + 1
        ;
    END IF
    ;
    UPDATE $DATABASE.seq_permission_id
    SET current_value = NEW.id
    ;
END
ENDTRIGGER
DELIMITER ;
