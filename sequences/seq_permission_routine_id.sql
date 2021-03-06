CREATE TABLE seq_permission_routine_id
(
      current_value $PERMISSION_ROUTINE_ID_TYPE NOT NULL DEFAULT 0
    , next_value    $PERMISSION_ROUTINE_ID_TYPE NOT NULL DEFAULT 1
    , permission_id $PERMISSION_ID_TYPE         NOT NULL
    , CONSTRAINT fk_seq_permission_routine_id_permission_id
        FOREIGN KEY (permission_id) REFERENCES permission (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT pk_seq_permission_routine_id
        PRIMARY KEY (permission_id)
) ENGINE=InnoDB
;
