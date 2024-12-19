-- Project 3 customers who never order

CREATE TABLE Customerss (
    id INT PRIMARY KEY,
    NAME VARCHAR(50)
);


INSERT INTO Customerss (id, NAME)
VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

DROP TABLE orders
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);


INSERT INTO Orders (id, customerId)
VALUES
(2, 1),
(1, 3);


SELECT 
    NAME AS Customers
FROM 
    Customers
WHERE 
    id NOT IN (
        SELECT customerId 
        FROM Orders
    )
ORDER BY 
    NAME;

