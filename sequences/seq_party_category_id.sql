CREATE TABLE seq_party_category_id
(
      next_value    $PARTY_CATEGORY_ID_TYPE NOT NULL DEFAULT 1
    , current_value $PARTY_CATEGORY_ID_TYPE NOT NULL DEFAULT 0
    , CONSTRAINT pk_seq_party_cateogry_id 
        PRIMARY KEY (next_value, current_value)
) ENGINE=InnoDB
;
INSERT INTO seq_party_category_id () VALUES
()
;
