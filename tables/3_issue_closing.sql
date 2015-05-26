CREATE TABLE issue_closing
(
      issue_id  $ISSUE_ID_TYPE                NOT NULL
    , closed_at $ISSUE_CLOSING_CLOSED_AT_TYPE NOT NULL
    , closed_by $PARTY_ID_TYPE                NOT NULL
    , CONSTRAINT fk_issue_closing_issue_id
        FOREIGN KEY (issue_id) REFERENCES issue (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    , CONSTRAINT fk_issue_closing_closed_by
        FOREIGN KEY (closed_by) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_issue_closing
        PRIMARY KEY (issue_id, closed_by)
) ENGINE=InnoDB
;
