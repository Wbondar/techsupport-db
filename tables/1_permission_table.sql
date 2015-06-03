CREATE TABLE permission_table
(
      permission_id       $PERMISSION_ID_TYPE       NOT NULL
    , permission_table_id $PERMISSION_TABLE_ID_TYPE NOT NULL
    , table_name          TEXT                      NOT NULL
    , table_priv          TEXT                      NOT NULL 
    , CONSTRAINT fk_permission_table_permission_id_permission_id
        FOREIGN KEY (permission_id) REFERENCES permission (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT pk_permission_table
        PRIMARY KEY (permission_id, permission_table_id)
) ENGINE=InnoDB
;
