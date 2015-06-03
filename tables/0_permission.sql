CREATE TABLE permission
(
      id           $PERMISSION_ID_TYPE    NOT NULL
    , title        $PERMISSION_TITLE_TYPE NOT NULL
    , CONSTRAINT uk_permission_title
        UNIQUE KEY (title)
    , CONSTRAINT pk_permission
        PRIMARY KEY (id)
) ENGINE=InnoDB
;
