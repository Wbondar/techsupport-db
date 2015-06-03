CREATE TABLE permission_routine
(
      permission_id         $PERMISSION_ID_TYPE         NOT NULL
    , permission_routine_id $PERMISSION_ROUTINE_ID_TYPE NOT NULL
    , routine_name          TEXT                        NOT NULL
    , routine_type          TEXT                        NOT NULL 
    , proc_priv             TEXT                        NOT NULL
    , CONSTRAINT fk_permission_routine_permission_id_permission_id
        FOREIGN KEY (permission_id) REFERENCES permission (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT pk_permission_routine
        PRIMARY KEY (permission_id, permission_routine_id)
) ENGINE=InnoDB
;
