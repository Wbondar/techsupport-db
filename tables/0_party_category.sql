CREATE TABLE party_category
(
      id        $PARTY_CATEGORY_ID_TYPE   NOT NULL
    , name      $PARTY_CATEGORY_NAME_TYPE NOT NULL
    , parent_id $PARTY_CATEGORY_ID_TYPE
    , CONSTRAINT fk_party_category_parent_id
        FOREIGN KEY (parent_id) REFERENCES party_category (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_party_category
        PRIMARY KEY (id)
) ENGINE=InnoDB
;
