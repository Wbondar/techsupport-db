DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_issue_increment_sequence_id AFTER INSERT ON issue
FOR EACH ROW
BEGIN
    INSERT INTO seq_comment_id (current_value, next_value, issue_id) VALUES
    (0, 1, NEW.id)
    ;
    SELECT next_value INTO @var_next_id
    FROM seq_issue_id
    ;
    IF NEW.id >= @var_next_id THEN
        UPDATE $DATABASE.seq_issue_id
        SET next_value = NEW.id + 1
        ;
    END IF
    ;
    UPDATE $DATABASE.seq_issue_id
    SET current_value = NEW.id
    ;
END
ENDTRIGGER
DELIMITER ;
