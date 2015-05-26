REVOKE ALL PRIVILEGES ON *.* 
FROM '$CLIENT_USERNAME'@'$HOST'
;
GRANT EXECUTE ON PROCEDURE $DATABASE.issue_assign
TO '$CLIENT_USERNAME'@'$HOST'
;
GRANT EXECUTE ON PROCEDURE $DATABASE.issue_close
TO '$CLIENT_USERNAME'@'$HOST'
;
GRANT EXECUTE ON PROCEDURE $DATABASE.issue_open
TO '$CLIENT_USERNAME'@'$HOST'
;
GRANT SELECT ON $DATABASE.view_issue_assigned
TO '$CLIENT_USERNAME'@'$HOST'
;
GRANT SELECT ON $DATABASE.view_issue_closed
TO '$CLIENT_USERNAME'@'$HOST'
;
GRANT SELECT ON $DATABASE.view_issue_open
TO '$CLIENT_USERNAME'@'$HOST'
;
