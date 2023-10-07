INSERT INTO Coupons (Discount) VALUES 
(10.5), 
(11.8), 
(20.1);


INSERT INTO Roles (Name) VALUES
("Customer"),
("Admin");


INSERT INTO Authors (Name) VALUES
("Alex Maliarniy"),
("Kriss Whell"),
("Pavel Umnov"),
("Stella Jhonson");


INSERT INTO Users (Login, Password, Name, RoleId, CouponId) VALUES
("Log1", "Pass1", "Jhon", 1, NULL),
("Log2", "Pass2", "Peter", 1, 2),
("Log3", "Pass3", "Bob", 1, 1),
("Log4", "Pass4", "Tom", 1, 2),
("Log5", "Pass5", "SuperAdmin", 2, NULL);


INSERT INTO Providers (UserPtr) VALUES
(3),
(4);


INSERT INTO Categories (Name) VALUES
("Detective"),
("Sci-fi"),
("Western"),
("Fairy tale");


INSERT INTO Books (Title, AuthorId) VALUES
("When pigs fly", 2),
("Crumpled Fairy", 1),
("Forgotten", 3),
("Fall night", 2),
("First of Mahikans", 3);


INSERT INTO Reviews (Text, BookId, UserId) VALUES
("I like it. The best of the  best.", 2, 1),
("0 from 10.", 3, 2),
("Nothing", 3, 3);


INSERT INTO Orders (UserId) VALUES
(1),
(2),
(3);


INSERT INTO Carts (UserId) VALUES
(1),
(2),
(3),
(5);


INSERT INTO CartsBooks (CartId, BookId) VALUES
(1, 1), (1, 3), (1, 4),
(2, 1), (2, 5),
(3, 2), (3, 4);


INSERT INTO BooksCategories (BookId, CategoryId) VALUES
(1, 4), (1, 1),
(2, 4),
(3, 2), (3, 3),
(4, 1),
(5, 3);


INSERT INTO OrdersBooks (OrderId, BookId) VALUES
(1, 1), (1, 3),
(2, 4), (2, 5),
(3, 2), (3, 3), (3, 4);


INSERT INTO ProvidersBooks (ProviderId, BookId) VALUES
(3, 1), (3, 4), (3, 5),
(4, 2), (4, 3), (4, 4), (4, 5);



