--Select all authors.
SELECT a.Id , a.Name FROM Authors a;


--Select all categories.
SELECT c.Id, c.Name FROM Categories c;
    

--Select all users
SELECT u.Id, u.Name, u.Login FROM Users u;
    

--Select all coupons.
SELECT c.Id, c.Discount FROM Coupons c ORDER BY c.Discount DESC;
    

--Select coupons that has discound in cpecific range.
SELECT c.Id, c.Discount FROM Coupons c WHERE c.Discount BETWEEN "Start" AND "Finish";


--Select all roles.
SELECT r.Id, r.Name FROM Roles r;
