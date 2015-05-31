CREATE VIEW view_comment 
AS
SELECT * 
FROM comment
WHERE reply_to IS NOT NULL
ORDER BY reply_to, posted_at DESC
;
