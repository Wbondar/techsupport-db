CREATE TABLE seq_issue_id
(
      current_value $ISSUE_ID_TYPE NOT NULL DEFAULT 1
    , next_value    $ISSUE_ID_TYPE NOT NULL DEFAULT 1
) ENGINE=InnoDB
;