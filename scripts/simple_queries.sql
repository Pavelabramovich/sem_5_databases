--Select all authors.
SELECT a.Id , a.Name FROM Authors a;


--Select all books wiht it's author name.
SELECT 
    b.Id, 
    b.Title, 
    a.Name AS authorName

    FROM Books b 
    LEFT JOIN Authors a ON b.AuthorId = a.Id;


--Select books by a specific author.
SELECT
    b.Id,
    b.Title

    FROM Books b 
    LEFT JOIN Authors a ON b.AuthorId = a.Id
    
    WHERE LOWER(a.Name) = LOWER("Author name");


--Select all categories.
SELECT c.Id, c.Name FROM Categories c;


--Select books by a specific category.
SELECT
    b.Id,
    b.Title,
    a.Name AS authorName
    
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
    

--Select all users
SELECT u.Id, u.Name, u.Login FROM Users u;
    

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
    a.Name AS authorName
    
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
    a.Name AS authorName
    
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
    
    FROM Providers p
    JOIN Users u ON p.UserPtr = u.Id;


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
    a.Name AS authorName
    
    FROM ProvidersBooks pb
    JOIN Users u ON pb.ProviderId = u.Id AND LOWER(u.Name) = LOWER("Provider name")
    JOIN Books b ON pb.BookId = b.Id            
    LEFT JOIN Authors a ON b.AuthorId = a.Id;
    

--Select all coupons.
SELECT c.Id, c.Discount FROM Coupons c;


--Select coupons of specific user.
SELECT 
    c.Id,
    c.Discoun
    
    FROM Coupons c
    JOIN Users u ON u.CouponId = c.Id AND LOWER(u.Name) = LOWER("User name");
    

--Select coupons that has discound in cpecific range.
SELECT c.Id, c.Discount FROM Coupons c WHERE c.Discount BETWEEN "Start" AND "Finish";


--Select all roles.
SELECT r.Id, r.Name FROM Roles r;


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
