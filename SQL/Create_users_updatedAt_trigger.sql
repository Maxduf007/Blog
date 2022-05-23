CREATE TRIGGER User_Updated ON Users
FOR UPDATE
AS BEGIN
UPDATE Users SET UpdatedAt = GETUTCDATE()
FROM inserted UsersInserted
WHERE UsersInserted.Id = Users.Id
END