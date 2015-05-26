DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_issue_increment_sequence_id AFTER INSERT ON issue
FOR EACH ROW
BEGIN
    INSERT INTO seq_comment_id (current_value, next_value, issue_id) VALUES
    (0, 1, NEW.id)
    ;
    UPDATE $DATABASE.seq_issue_id
    SET current_value = NEW.id
      , next_value    = COALESCE(next_value, 0) + 1
    ;
END
ENDTRIGGER
DELIMITER ;
