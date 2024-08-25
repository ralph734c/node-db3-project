-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT 
    prod.ProductName,
    cat.CategoryName
FROM Product as prod
LEFT JOIN Category as cat
    ON prod.CategoryId = cat.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. 
-- Shows 429 records.
SELECT 
    ord.Id as Order_Id,
    ship.CompanyName as Shipper_Name
FROM [Order] as ord
LEFT JOIN Shipper as ship
    ON ord.ShipVia = ship.id
WHERE ord.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. 
-- Sort by ProductName. Shows 3 records.
SELECT 
    prod.ProductName,
    ordD.quantity
FROM OrderDetail as ordD
LEFT JOIN Product as prod
    ON ordD.ProductId = prod.Id
WHERE ordD.Id LIKE '%10251%'
ORDER BY prod.ProductName ASC;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. 
-- All columns should be labeled clearly. Displays 16,789 records.
SELECT
    ord.Id as Order_ID,
    cust.CompanyName as Customer_Company,
    emp.LastName as Employee_Last
FROM [Order] as ord
JOIN Customer as cust
    ON ord.CustomerId = cust.Id
JOIN Employee as emp
    ON ord.EmployeeId = emp.Id
