CREATE TABLE seq_comment_id
(
      current_value $COMMENT_ID_TYPE NOT NULL DEFAULT 0
    , next_value    $COMMENT_ID_TYPE NOT NULL DEFAULT 1
    , issue_id      $ISSUE_ID_TYPE   NOT NULL 
    , CONSTRAINT fk_seq_comment_id_issue_id
        FOREIGN KEY (issue_id) REFERENCES issue (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT pk_seq_comment_id
        PRIMARY KEY (issue_id)
) ENGINE=InnoDB
;
