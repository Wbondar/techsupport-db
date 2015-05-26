CREATE TABLE issue_assignation
(
      issue_id    $ISSUE_ID_TYPE                      NOT NULL
    , assigned_at $ISSUE_ASSIGNATION_ASSIGNED_AT_TYPE NOT NULL
    , assigned_id $PARTY_ID_TYPE                      NOT NULL
    , assignee_id $PARTY_ID_TYPE                      NOT NULL
    , CONSTRAINT fk_issue_assignation_assignee_id
        FOREIGN KEY (assignee_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT fk_issue_assignation_assigned_id
        FOREIGN KEY (assigned_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_issue_assignation
        PRIMARY KEY (issue_id, assigned_at)
) ENGINE=InnoDB
;
