--Project5  Product Sales Analysis

--Create Table Products

CREATE TABLE Products5 ( ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10, 2));

INSERT INTO Products5 (ProductID, ProductName, Price) VALUES
(1, 'Apple', 2.50),
(2, 'Banana', 1.50),
(3, 'Orange', 3.00),
(4, 'Mango', 2.00);

SELECT * FROM Products5;

CREATE TABLE Orders5 ( OrderID INT PRIMARY KEY, ProductID INT, Quantity INT, Sales DECIMAL(10, 2), FOREIGN KEY (ProductID) REFERENCES Products5(ProductID));

INSERT INTO Orders5 (OrderID, ProductID, Quantity, Sales) VALUES
(1, 1, 10, 25.00),
(2, 1, 5, 12.50),
(3, 2, 8, 12.00),
(4, 3, 12, 36.00),
(5, 4, 6, 12.00);

SELECT * FROM Orders5;

SELECT p.ProductName, SUM(o.Sales) AS TotalRevenue
FROM Products5 p
JOIN Orders5 o ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC ;