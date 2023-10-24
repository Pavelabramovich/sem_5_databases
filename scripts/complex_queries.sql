--Select all books wiht it's author name.
SELECT 
    b.Id, 
    b.Title, 
    a.Name AS author_name

    FROM Books b 
    LEFT JOIN Authors a ON b.AuthorId = a.Id;


--Select books by a specific author.
SELECT
    b.Id,
    b.Title

    FROM Books b 
    LEFT JOIN Authors a ON b.AuthorId = a.Id
    
    WHERE LOWER(a.Name) = LOWER("Author name");


--Select books by a specific category.
SELECT
    b.Id,
    b.Title,
    a.Name AS author_name
    
    FROM BooksCategories bc 
    JOIN Categories c ON bc.CategoryId = c.Id AND LOWER(c.Name) = LOWER("Category name")
    JOIN Books b ON bc.BookId = b.Id     
    LEFT JOIN Authors a ON b.AuthorId = a.Id;
    

--Select categories by a specific book.
SELECT 
    c.Id,
    c.Name
       
    FROM BooksCategories bc
    JOIN Books b ON bc.BookId = b.Id AND b.Id = "Book id"
    JOIN Categories c ON bc.CategoryId = c.Id;   


--Select users that have specific book in a cart.
SELECT 
    u.Id,
    u.Name,
    u.Login     
     
    FROM CartsBooks cb
    JOIN Books b ON cb.BookId = b.Id AND b.Id = "Book id"
    JOIN Carts c ON cb.CartId = c.Id
    JOIN Users u ON c.UserId = u.Id;
    

--Select all books from specific user cart.
SELECT 
    b.Id,
    b.Title,
    a.Name AS author_name
    
    FROM CartsBooks cb
    JOIN Carts c ON cb.CartId = c.Id
    JOIN Users u ON c.UserId = u.Id AND LOWER(u.Name) = LOWER("User name")
    JOIN Books b ON cb.BookId = b.Id
    LEFT JOIN Authors a ON b.AuthorId = a.Id;


--Select users that have specific book in orders.
SELECT 
    u.Id,
    u.Name,
    u.Login     
     
    FROM OrdersBooks ob
    JOIN Books b ON ob.BookId = b.Id AND b.Id = "Book id"
    JOIN Orders o ON ob.OrderId = o.Id
    JOIN Users u ON o.UserId = u.Id;
    

--Select books that was ordered by specific user.
SELECT 
    b.Id,
    b.Title,
    a.Name AS author_name
    
    FROM OrdersBooks ob
    JOIN Orders o ON ob.OrderId = o.Id
    JOIN Users u ON o.UserId = u.Id AND LOWER(u.Name) = LOWER("User name")
    JOIN Books b ON ob.BookId = b.Id 
    LEFT JOIN Authors a ON b.AuthorId = a.Id;


--Select all providers
SELECT
    u.Id, 
    u.Name, 
    u.Login  
    
    FROM Users u 
    WHERE Id IN (SELECT p.UserPtr FROM Providers p);
    


--Select providers by specific book.
SELECT 
    u.Id,
    u.Name,
    u.Login  
    
    FROM ProvidersBooks pb
    JOIN Books b ON pb.BookId = b.Id AND b.Id = "Book id" 
    JOIN Users u ON pb.ProviderId = u.Id; 
    

--Select books that providered by special provider.
SELECT 
    b.Id,
    b.Title,
    a.Name AS author_name
    
    FROM ProvidersBooks pb
    JOIN Users u ON pb.ProviderId = u.Id AND LOWER(u.Name) = LOWER("Provider name")
    JOIN Books b ON pb.BookId = b.Id            
    LEFT JOIN Authors a ON b.AuthorId = a.Id;
    
--Select coupons of specific user.
SELECT 
    c.Id,
    c.Discount
    
    FROM Coupons c
    JOIN Users u ON u.CouponId = c.Id AND LOWER(u.Name) = LOWER("User name");

--Select users by role.
SELECT 
    u.Id,
    u.Name,
    u.Login    
    
    FROM Users u
    JOIN Roles r ON u.RoleId = r.Id AND LOWER(r.Name) = LOWER("Role name");
    

--Select user role.
SELECT
    r.Id,
    r.Name
    
    FROM Roles r
    JOIN Users u ON u.RoleId = r.Id AND LOWER(u.Name) = LOWER("User name");
    

--Select all reviews by specific book.
SELECT 
    r.Id,
    r.Text
    
    FROM Reviews r
    JOIN Books b ON r.BookId = b.Id AND b.Id = "Book id";
    

--Select all reviews by specific user.
SELECT 
    r.Id,
    r.Text
    
    FROM Reviews r
    JOIN Users u ON r.UserId = u.Id AND LOWER(u.Name) = LOWER("User name");

    
--Select average price for every category.
SELECT
    c.Id,
    c.Name,
    AVG(b.Price) as average_price
    
    FROM BooksCategories bc
    JOIN Books b ON bc.BookId = b.Id
    JOIN Categories c ON bc.CategoryId = c.Id
    
    GROUP BY bc.CategoryId;
    

--Select count of orders of every book.
SELECT
    b.Id, 
    b.Title, 
    a.Name AS author_name,
    SUM(ob.Count) AS orders_count

    FROM Books b 
    LEFT JOIN Authors a ON b.AuthorId = a.Id
    LEFT JOIN OrdersBooks ob ON ob.BookId = b.Id
    
    GROUP BY b.Id;


--Select books that are in the cart of at least two users.
SELECT
    b.Id, 
    b.Title, 
    a.Name AS author_name,
    SUM(cb.Count) AS in_cart_count

    FROM Books b 
    LEFT JOIN Authors a ON b.AuthorId = a.Id
    LEFT JOIN CartsBooks cb ON cb.BookId = b.Id
    
    GROUP BY b.Id 
    HAVING SUM(cb.Count) >= 2;


--Select all persons names.
SELECT u.Name FROM Users u
UNION 
SELECT a.Name FROM Authors a;


--Select books and it's popularity level.
SELECT b.Id, 
       b.Title, 
       a.Name AS author_name,
       CASE 
           WHEN bto.total_ordered > 5 THEN "Super popular"
           WHEN bto.total_ordered BETWEEN 2 AND 5 THEN "Meadle popular"
           ELSE "Not popular"
       END AS popularity                          
       

       FROM Books b
            LEFT JOIN Authors a ON b.AuthorId = a.Id
            JOIN (SELECT ob.BookId AS book_id, 
                         SUM(ob.Count) AS total_ordered 
                    FROM OrdersBooks ob 
                GROUP BY ob.BookId) AS bto
              ON bto.book_id = b.Id;
            