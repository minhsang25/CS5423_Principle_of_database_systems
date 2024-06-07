-- Q1 
CREATE DATABASE SALESMANAGEMENT 
USE SALESMANAGEMENT

CREATE TABLE CUSTOMERS (
    CustomerID varchar(5) NOT NULL PRIMARY KEY,
    CompanyName varchar(40) NOT NULL,
    Phone varchar(24),
    Fax varchar(24),
    Address varchar(60),
    ContactName varchar(30),
    TotalOrder Money
)

CREATE TABLE EMPLOYEES (
    EmployeeID Int NOT NULL PRIMARY KEY,
    LastName varchar(20) NOT NULL,
    FirstName varchar(14) NOT NULL,
    BirthDate Datetime,
    Photo Image,
    IDNO varchar(10),
    Notes text,
    HireDate Datetime,
)

CREATE TABLE PRODUCTS (
    ProductID Int NOT NULL PRIMARY KEY,
    ProductName varchar(40) NOT NULL,
    UnitPrice Money,
)

CREATE TABLE ORDERS (
    OrderID Int NOT NULL PRIMARY KEY,
    OrderDate Datetime,
    TotalAmount Money,
    CustomerID varchar(5) NOT NULL,
    EmployeeID Int NOT NULL,
)

CREATE TABLE ORDERDETAILS (
    OrderID Int NOT NULL,
    ProductID Int NOT NULL,
    Quantity Smallint NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
)

ALTER TABLE ORDERS ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
ALTER TABLE ORDERS ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEES(EmployeeID)
ALTER TABLE ORDERDETAILS ADD CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
ALTER TABLE ORDERDETAILS ADD CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES PRODUCTS(ProductID)

-- Q2 
-- a. 
CREATE TRIGGER TR_Products_SalesQuantity ON ORDERDETAILS
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Quantity <= 0)
    BEGIN
        RAISERROR('The product''s sales quantity must be greater than 0.', 16, 1)
        ROLLBACK TRANSACTION
    END
END

-- b
CREATE TRIGGER TR_Customers_TotalOrder ON ORDERS
FOR INSERT
AS
BEGIN
    UPDATE CUSTOMERS
    SET TotalOrder = TotalOrder + (SELECT TotalAmount FROM inserted)
    WHERE CUSTOMERS.CustomerID = (SELECT CustomerID FROM inserted)
END

-- Q3 
-- a. 
SELECT * FROM CUSTOMERS 
WHERE ContactName = 'Accounting Manager' 
ORDER BY CustomerID

-- b. 
SELECT FirstName + ' ' + LastName AS FullName
FROM EMPLOYEES
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM ORDERS
    WHERE OrderDate = '2024-05-31'
) 
GROUP BY EmployeeID, FirstName, LastName

-- c. 
SELECT OrderID, TotalAmount
FROM ORDERS
WHERE TotalAmount > 1000000
AND OrderID IN (
    SELECT OrderID
    FROM ORDERDETAILS
    GROUP BY OrderID
    HAVING COUNT(*) > 2
)
ORDER BY TotalAmount DESC

-- d. 
SELECT * FROM CUSTOMERS
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM ORDERS
)

-- e.
SELECT OrderID
FROM ORDERDETAILS
JOIN PRODUCTS ON ORDERDETAILS.ProductID = PRODUCTS.ProductID
WHERE PRODUCTS.UnitPrice = 10000
GROUP BY OrderID
HAVING COUNT(DISTINCT PRODUCTS.ProductID) = (
    SELECT COUNT(*)
    FROM PRODUCTS
    WHERE UnitPrice = 10000
)

-- f. 
SELECT TOP 1 WITH TIES e.EmployeeID, e.LastName, e.FirstName
FROM EMPLOYEES e
JOIN ORDERS o ON e.EmployeeID = o.EmployeeID
WHERE YEAR(o.OrderDate) = 2023
GROUP BY e.EmployeeID, e.LastName, e.FirstName
ORDER BY SUM(o.TotalAmount) DESC;

