CREATE TABLE party_permissions
(
      party_id      $PARTY_ID_TYPE      NOT NULL 
    , permission_id $PERMISSION_ID_TYPE NOT NULL
    , CONSTRAINT fk_party_permissions_party_id
        FOREIGN KEY (party_id) REFERENCES party (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT fk_party_permissions_permission_id
        FOREIGN KEY (permission_id) REFERENCES permission (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_party_permissions
        PRIMARY KEY (party_id, permission_id)
) ENGINE=InnoDB
;
