CREATE TABLE party_category_permissions
(
      party_category_id $PARTY_ID_TYPE      NOT NULL 
    , permission_id     $PERMISSION_ID_TYPE NOT NULL
    , CONSTRAINT fk_party_category_permissions_party_category_id
        FOREIGN KEY (party_category_id) REFERENCES party_category (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT fk_party_category_permissions_permission_id
        FOREIGN KEY (permission_id) REFERENCES permission (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_party_category_permissions
        PRIMARY KEY (party_category_id, permission_id)
) ENGINE=InnoDB
;
