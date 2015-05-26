CREATE VIEW view_issue_closed
AS
SELECT 
      view_issue.*
    , issue_closing.closed_by
    , issue_closing.closed_at
FROM view_issue JOIN issue_closing ON view_issue.id = issue_closing.issue_id
WHERE view_issue.id = issue_closing.issue_id
;
