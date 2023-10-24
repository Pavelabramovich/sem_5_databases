INSERT INTO Users (Name, Login, Password, RoleId)
SELECT a.Name, a.Name, "pass1pass", 1
FROM Authors a
WHERE EXISTS(SELECT * FROM Books b WHERE a.Id = b.AuthorId);