CREATE TRIGGER Posts_Updated ON Posts
FOR UPDATE
AS BEGIN
UPDATE Posts SET UpdatedAt = GETUTCDATE()
FROM inserted PostsInserted
WHERE PostsInserted.Id = Posts.Id
END