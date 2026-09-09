-- ============================================================
-- PR. 2 — DATA TRANSFORMER
-- ============================================================
-- File: queries.sql
-- DBMS: MySQL 8.0+
-- Contains 17 required SQL queries with expected outputs.
-- ============================================================

USE data_transformer;


-- ============================================================
-- QUERY 1
-- INNER JOIN
-- Retrieve all orders and customer details where orders exist.
-- ============================================================

SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID;

/*
EXPECTED OUTPUT:

OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName  | Email
--------|------------|-------------|------------|-----------|-----------|---------------------------
101     | 2023-07-01 | 150.50      | 1          | John      | Doe       | john.doe@email.com
102     | 2023-07-03 | 200.75      | 2          | Jane      | Smith     | jane.smith@email.com
103     | 2023-07-10 | 50.00       | 1          | John      | Doe       | john.doe@email.com
104     | 2023-07-12 | 1200.00     | 3          | Alice     | Brown     | alice.brown@email.com
105     | 2023-07-15 | 800.00      | 4          | Robert    | Wilson    | robert.wilson@email.com
106     | 2023-07-18 | 300.25      | 5          | Emily     | Davis     | emily.davis@email.com
107     | 2023-07-20 | 650.00      | 7          | Michael   | Anderson  | michael.anderson@email.com
108     | 2023-07-22 | 1500.00     | 8          | Sarah     | Thomas    | sarah.thomas@email.com
109     | 2023-07-25 | 450.50      | 9          | Daniel    | Jackson   | daniel.jackson@email.com
*/


-- ============================================================
-- QUERY 2
-- LEFT JOIN
-- Retrieve all customers and their corresponding orders.
-- ============================================================

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderID;

/*
EXPECTED OUTPUT:

CustomerID | FirstName | LastName  | OrderID | OrderDate  | TotalAmount
-----------|-----------|-----------|---------|------------|------------
1          | John      | Doe       | 101     | 2023-07-01 | 150.50
1          | John      | Doe       | 103     | 2023-07-10 | 50.00
2          | Jane      | Smith     | 102     | 2023-07-03 | 200.75
3          | Alice     | Brown     | 104     | 2023-07-12 | 1200.00
4          | Robert    | Wilson    | 105     | 2023-07-15 | 800.00
5          | Emily     | Davis     | 106     | 2023-07-18 | 300.25
6          | Chris     | Taylor    | NULL    | NULL       | NULL
7          | Michael   | Anderson  | 107     | 2023-07-20 | 650.00
8          | Sarah     | Thomas    | 108     | 2023-07-22 | 1500.00
9          | Daniel    | Jackson   | 109     | 2023-07-25 | 450.50
10         | Olivia    | White     | NULL    | NULL       | NULL
*/


-- ============================================================
-- QUERY 3
-- RIGHT JOIN
-- Retrieve all orders and their corresponding customers.
-- ============================================================

SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers AS c
RIGHT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;

/*
EXPECTED OUTPUT:

OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName
--------|------------|-------------|------------|-----------|----------
101     | 2023-07-01 | 150.50      | 1          | John      | Doe
102     | 2023-07-03 | 200.75      | 2          | Jane      | Smith
103     | 2023-07-10 | 50.00       | 1          | John      | Doe
104     | 2023-07-12 | 1200.00     | 3          | Alice     | Brown
105     | 2023-07-15 | 800.00      | 4          | Robert    | Wilson
106     | 2023-07-18 | 300.25      | 5          | Emily     | Davis
107     | 2023-07-20 | 650.00      | 7          | Michael   | Anderson
108     | 2023-07-22 | 1500.00     | 8          | Sarah     | Thomas
109     | 2023-07-25 | 450.50      | 9          | Daniel    | Jackson
110     | 2023-07-28 | 99.99       | NULL       | NULL      | NULL
*/


-- ============================================================
-- QUERY 4
-- FULL OUTER JOIN
-- MySQL does not support FULL OUTER JOIN directly.
-- LEFT JOIN + RIGHT JOIN + UNION is used.
-- ============================================================

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
RIGHT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID

ORDER BY CustomerID, OrderID;

/*
EXPECTED OUTPUT:

CustomerID | FirstName | LastName  | OrderID | OrderDate  | TotalAmount
-----------|-----------|-----------|---------|------------|------------
NULL       | NULL      | NULL      | 110     | 2023-07-28 | 99.99
1          | John      | Doe       | 101     | 2023-07-01 | 150.50
1          | John      | Doe       | 103     | 2023-07-10 | 50.00
2          | Jane      | Smith     | 102     | 2023-07-03 | 200.75
3          | Alice     | Brown     | 104     | 2023-07-12 | 1200.00
4          | Robert    | Wilson    | 105     | 2023-07-15 | 800.00
5          | Emily     | Davis     | 106     | 2023-07-18 | 300.25
6          | Chris     | Taylor    | NULL    | NULL       | NULL
7          | Michael   | Anderson  | 107     | 2023-07-20 | 650.00
8          | Sarah     | Thomas    | 108     | 2023-07-22 | 1500.00
9          | Daniel    | Jackson   | 109     | 2023-07-25 | 450.50
10         | Olivia    | White     | NULL    | NULL       | NULL
*/


-- ============================================================
-- QUERY 5
-- SUBQUERY
-- Customers who have placed orders above the average amount.
-- Average order amount = 540.199
-- ============================================================

SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
)
ORDER BY c.CustomerID;

/*
EXPECTED OUTPUT:

CustomerID | FirstName | LastName
-----------|-----------|----------
3          | Alice     | Brown
4          | Robert    | Wilson
7          | Michael   | Anderson
8          | Sarah     | Thomas
*/


-- ============================================================
-- QUERY 6
-- SUBQUERY
-- Employees with salaries above the average salary.
-- Average salary = 61300.00
-- ============================================================

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
)
ORDER BY EmployeeID;

/*
EXPECTED OUTPUT:

EmployeeID | FirstName | LastName | Salary
-----------|-----------|----------|----------
3          | David     | Kim      | 72000.00
5          | James     | Nguyen   | 90000.00
7          | Daniel    | Clark    | 68000.00
8          | Emma      | Lewis    | 62000.00
9          | William   | Walker   | 85000.00
*/


-- ============================================================
-- QUERY 7
-- DATE FUNCTIONS
-- Extract year and month from OrderDate.
-- ============================================================

SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders
ORDER BY OrderID;

/*
EXPECTED OUTPUT:

OrderID | OrderDate  | OrderYear | OrderMonth
--------|------------|-----------|-----------
101     | 2023-07-01 | 2023      | 7
102     | 2023-07-03 | 2023      | 7
103     | 2023-07-10 | 2023      | 7
104     | 2023-07-12 | 2023      | 7
105     | 2023-07-15 | 2023      | 7
106     | 2023-07-18 | 2023      | 7
107     | 2023-07-20 | 2023      | 7
108     | 2023-07-22 | 2023      | 7
109     | 2023-07-25 | 2023      | 7
110     | 2023-07-28 | 2023      | 7
*/


-- ============================================================
-- QUERY 8
-- DATE FUNCTION
-- Calculate days between OrderDate and current date.
-- ============================================================

SELECT
    OrderID,
    OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
FROM Orders
ORDER BY OrderID;

/*
EXPECTED OUTPUT IF RUN ON 2026-09-09:

OrderID | OrderDate  | DaysSinceOrder
--------|------------|---------------
101     | 2023-07-01 | 1166
102     | 2023-07-03 | 1164
103     | 2023-07-10 | 1157
104     | 2023-07-12 | 1155
105     | 2023-07-15 | 1152
106     | 2023-07-18 | 1149
107     | 2023-07-20 | 1147
108     | 2023-07-22 | 1145
109     | 2023-07-25 | 1142
110     | 2023-07-28 | 1139

NOTE:
The values will change depending on the date the query is executed.
*/


-- ============================================================
-- QUERY 9
-- DATE FORMAT
-- Format OrderDate as DD-MMM-YYYY.
-- ============================================================

SELECT
    OrderID,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders
ORDER BY OrderID;

/*
EXPECTED OUTPUT:

OrderID | FormattedOrderDate
--------|-------------------
101     | 01-Jul-2023
102     | 03-Jul-2023
103     | 10-Jul-2023
104     | 12-Jul-2023
105     | 15-Jul-2023
106     | 18-Jul-2023
107     | 20-Jul-2023
108     | 22-Jul-2023
109     | 25-Jul-2023
110     | 28-Jul-2023
*/


-- ============================================================
-- QUERY 10
-- STRING FUNCTION
-- Concatenate FirstName and LastName.
-- ============================================================

SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers
ORDER BY CustomerID;

/*
EXPECTED OUTPUT:

CustomerID | FullName
-----------|-----------------
1          | John Doe
2          | Jane Smith
3          | Alice Brown
4          | Robert Wilson
5          | Emily Davis
6          | Chris Taylor
7          | Michael Anderson
8          | Sarah Thomas
9          | Daniel Jackson
10         | Olivia White
*/


-- ============================================================
-- QUERY 11
-- STRING FUNCTION
-- Replace 'John' with 'Jonathan'.
-- ============================================================

SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers
ORDER BY CustomerID;

/*
EXPECTED OUTPUT:

CustomerID | FirstName | UpdatedFirstName
-----------|-----------|----------------
1          | John      | Jonathan
2          | Jane      | Jane
3          | Alice     | Alice
4          | Robert    | Robert
5          | Emily     | Emily
6          | Chris     | Chris
7          | Michael   | Michael
8          | Sarah     | Sarah
9          | Daniel    | Daniel
10         | Olivia    | Olivia
*/


-- ============================================================
-- QUERY 12
-- STRING FUNCTIONS
-- Convert FirstName to uppercase and LastName to lowercase.
-- ============================================================

SELECT
    CustomerID,
    UPPER(FirstName) AS FirstNameUpper,
    LOWER(LastName) AS LastNameLower
FROM Customers
ORDER BY CustomerID;

/*
EXPECTED OUTPUT:

CustomerID | FirstNameUpper | LastNameLower
-----------|----------------|--------------
1          | JOHN           | doe
2          | JANE           | smith
3          | ALICE          | brown
4          | ROBERT         | wilson
5          | EMILY          | davis
6          | CHRIS          | taylor
7          | MICHAEL        | anderson
8          | SARAH          | thomas
9          | DANIEL         | jackson
10         | OLIVIA         | white
*/


-- ============================================================
-- QUERY 13
-- STRING FUNCTION
-- Trim extra spaces from the Email field.
-- ============================================================

SELECT
    CustomerID,
    Email,
    TRIM(Email) AS TrimmedEmail
FROM Customers
ORDER BY CustomerID;

/*
EXPECTED OUTPUT:

CustomerID | Email                         | TrimmedEmail
-----------|-------------------------------|-------------------------
1          |   john.doe@email.com          | john.doe@email.com
2          | jane.smith@email.com          | jane.smith@email.com
3          | alice.brown@email.com         | alice.brown@email.com
4          | robert.wilson@email.com       | robert.wilson@email.com
5          | emily.davis@email.com         | emily.davis@email.com
6          | chris.taylor@email.com        | chris.taylor@email.com
7          | michael.anderson@email.com    | michael.anderson@email.com
8          | sarah.thomas@email.com        | sarah.thomas@email.com
9          | daniel.jackson@email.com      | daniel.jackson@email.com
10         | olivia.white@email.com        | olivia.white@email.com
*/


-- ============================================================
-- QUERY 14
-- WINDOW FUNCTION
-- Calculate the running total of TotalAmount.
-- ============================================================

SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS RunningTotal
FROM Orders
ORDER BY OrderDate, OrderID;

/*
EXPECTED OUTPUT:

OrderID | OrderDate  | TotalAmount | RunningTotal
--------|------------|-------------|-------------
101     | 2023-07-01 | 150.50      | 150.50
102     | 2023-07-03 | 200.75      | 351.25
103     | 2023-07-10 | 50.00       | 401.25
104     | 2023-07-12 | 1200.00     | 1601.25
105     | 2023-07-15 | 800.00      | 2401.25
106     | 2023-07-18 | 300.25      | 2701.50
107     | 2023-07-20 | 650.00      | 3351.50
108     | 2023-07-22 | 1500.00     | 4851.50
109     | 2023-07-25 | 450.50      | 5302.00
110     | 2023-07-28 | 99.99       | 5401.99
*/


-- ============================================================
-- QUERY 15
-- WINDOW FUNCTION
-- Rank orders based on TotalAmount.
-- ============================================================

SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS AmountRank
FROM Orders
ORDER BY AmountRank;

/*
EXPECTED OUTPUT:

OrderID | OrderDate  | TotalAmount | AmountRank
--------|------------|-------------|-----------
108     | 2023-07-22 | 1500.00     | 1
104     | 2023-07-12 | 1200.00     | 2
105     | 2023-07-15 | 800.00      | 3
107     | 2023-07-20 | 650.00      | 4
109     | 2023-07-25 | 450.50      | 5
106     | 2023-07-18 | 300.25      | 6
102     | 2023-07-03 | 200.75      | 7
101     | 2023-07-01 | 150.50      | 8
110     | 2023-07-28 | 99.99       | 9
103     | 2023-07-10 | 50.00       | 10
*/


-- ============================================================
-- QUERY 16
-- CASE EXPRESSION
-- Assign discounts based on TotalAmount.
--
-- > 1000 = 10% off
-- > 500  = 5% off
-- Otherwise = No discount
-- ============================================================

SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% off'
        WHEN TotalAmount > 500 THEN '5% off'
        ELSE 'No discount'
    END AS DiscountTier
FROM Orders
ORDER BY OrderID;

/*
EXPECTED OUTPUT:

OrderID | TotalAmount | DiscountTier
--------|-------------|-------------
101     | 150.50      | No discount
102     | 200.75      | No discount
103     | 50.00       | No discount
104     | 1200.00     | 10% off
105     | 800.00      | 5% off
106     | 300.25      | No discount
107     | 650.00      | 5% off
108     | 1500.00     | 10% off
109     | 450.50      | No discount
110     | 99.99       | No discount
*/


-- ============================================================
-- QUERY 17
-- CASE EXPRESSION
-- Categorize employee salaries.
--
-- > 70000       = High
-- 45000–70000   = Medium
-- < 45000       = Low
-- ============================================================

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary > 70000 THEN 'High'
        WHEN Salary >= 45000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees
ORDER BY EmployeeID;

/*
EXPECTED OUTPUT:

EmployeeID | FirstName | LastName | Salary    | SalaryCategory
-----------|-----------|----------|-----------|---------------
1          | Mark      | Johnson  | 50000.00  | Medium
2          | Susan     | Lee      | 55000.00  | Medium
3          | David     | Kim      | 72000.00  | High
4          | Laura     | Perez    | 48000.00  | Medium
5          | James     | Nguyen   | 90000.00  | High
6          | Sophia    | Martin   | 40000.00  | Low
7          | Daniel    | Clark    | 68000.00  | Medium
8          | Emma      | Lewis    | 62000.00  | Medium
9          | William   | Walker   | 85000.00  | High
10         | Ava       | Hall     | 43000.00  | Low
*/


-- ============================================================
-- END OF QUERIES
-- ============================================================
