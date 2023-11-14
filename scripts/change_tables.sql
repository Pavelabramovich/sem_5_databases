INSERT INTO users (name, login, password, role_id)
SELECT a.name, a.name, "pass1pass", 1
FROM authors a
WHERE EXISTS(SELECT * FROM books b WHERE a.id = b.author_id);