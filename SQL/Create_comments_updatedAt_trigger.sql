CREATE TRIGGER Comment_Updated ON Comments
FOR UPDATE
AS BEGIN
UPDATE Comments SET UpdatedAt = GETUTCDATE()
FROM inserted CommentsInserted
WHERE CommentsInserted.Id = Comments.Id
END

