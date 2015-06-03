CREATE TABLE comment
(
      issue_id  $ISSUE_ID_TYPE        NOT NULL
    , id        $COMMENT_ID_TYPE      NOT NULL
    , author_id $PARTY_ID_TYPE        NOT NULL
    , posted_at $COMMENT_POSTED_AT    NOT NULL
    , content   $COMMENT_CONTENT_TYPE NOT NULL
    , reply_to  $COMMENT_ID_TYPE          NULL
    , CONSTRAINT fk_comment_issue_id
        FOREIGN KEY (issue_id) REFERENCES issue (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT fk_comment_author_id
        FOREIGN KEY (author_id) REFERENCES party (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
    , CONSTRAINT pk_comment
        PRIMARY KEY (issue_id, id)
) ENGINE=InnoDB
;
