-- Project 2  Bank Account Summary
DROP TABLE BankTransactions
CREATE TABLE BankTransactions (
    AccountNumber INT,
    AccountHolderName VARCHAR(50),
    TransactionDate DATE,
    TransactionType VARCHAR(10),
    TransactionAmount DECIMAL(10, 2)
);


INSERT INTO BankTransactions (AccountNumber, AccountHolderName, TransactionDate, TransactionType, TransactionAmount)
VALUES
(1001, 'Ravi Sharma', '2023-07-01', 'Deposit', 5000.00),
(1001, 'Ravi Sharma', '2023-07-05', 'Withdrawal', 1000.00),
(1001, 'Ravi Sharma', '2023-07-10', 'Deposit', 2000.00),
(1002, 'Priya Gupta', '2023-07-02', 'Deposit', 3000.00),
(1002, 'Priya Gupta', '2023-07-08', 'Withdrawal', 500.00),
(1003, 'Vikram Patel', '2023-07-04', 'Deposit', 10000.00),
(1003, 'Vikram Patel', '2023-07-09', 'Withdrawal', 2000.00);

SELECT 
    AccountNumber,
    AccountHolderName,
    SUM(CASE 
            WHEN TransactionType = 'Deposit' THEN TransactionAmount
            WHEN TransactionType = 'Withdrawal' THEN -TransactionAmount
            ELSE 0
        END) AS TotalBalance
FROM 
    BankTransactions
GROUP BY 
    AccountNumber, AccountHolderName
ORDER BY 
    AccountNumber;
