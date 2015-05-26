CREATE TABLE issue
(
      id        $ISSUE_ID_TYPE        NOT NULL
    , issued_at $ISSUE_ISSUED_AT_TYPE NOT NULL
    , issued_by $PARTY_ID_TYPE        NOT NULL
    , CONSTRAINT fk_issue_issud_by
        FOREIGN KEY (issued_by) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_issue
        PRIMARY KEY (id, issued_by)
) ENGINE=InnoDB
;
