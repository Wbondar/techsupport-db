CREATE TABLE party
(
      id          $PARTY_ID_TYPE          NOT NULL
    , name        $PARTY_NAME_TYPE        NOT NULL
    , category_id $PARTY_CATEGORY_ID_TYPE NOT NULL
    , CONSTRAINT fk_party_category_id
        FOREIGN KEY (category_id) REFERENCES party_category (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_party
        PRIMARY KEY (id)
) ENGINE=InnoDB
;
