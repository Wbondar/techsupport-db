CREATE TABLE seq_permission_id
(
      current_value $PERMISSION_ID_TYPE NOT NULL DEFAULT 0
    , next_value    $PERMISSION_ID_TYPE NOT NULL DEFAULT 1
    , CONSTRAINT pk_seq_permission_id
        PRIMARY KEY (next_value, current_value)
) ENGINE=InnoDB
;
