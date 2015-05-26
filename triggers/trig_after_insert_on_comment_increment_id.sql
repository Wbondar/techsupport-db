DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_comment_increment_id AFTER INSERT ON comment
FOR EACH ROW
BEGIN
    UPDATE seq_comment_id
    SET current_value = NEW.id
      , next_value    = COALESCE(next_value, 0) + 1
    WHERE seq_comment_id.issue_id = NEW.issue_id
    ;
END
ENDTRIGGER
DELIMITER ;
