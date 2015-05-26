DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_issue_increment_sequence_id AFTER INSERT ON issue
FOR EACH ROW
BEGIN
    UPDATE $DATABASE.seq_issue_id
    SET current_value = NEW.id
      , next_value    = next_value + 1
    ;
END
ENDTRIGGER
DELIMITER ;
