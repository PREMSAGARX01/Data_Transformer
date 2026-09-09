-- ============================================================
-- PR. 2 — DATA TRANSFORMER
-- ============================================================
-- Database: data_transformer
-- DBMS: MySQL 8.0+
-- Description:
-- Creates the database, tables, and sample data.
-- ============================================================


-- ============================================================
-- DATABASE
-- ============================================================

DROP DATABASE IF EXISTS data_transformer;

CREATE DATABASE data_transformer;

USE data_transformer;


-- ============================================================
-- CUSTOMERS TABLE
-- ============================================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);


-- ============================================================
-- ORDERS TABLE
-- ============================================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);


-- ============================================================
-- EMPLOYEES TABLE
-- ============================================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);


-- ============================================================
-- CUSTOMERS SAMPLE DATA
-- ============================================================

INSERT INTO Customers
    (CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
    (1, 'John', 'Doe', '  john.doe@email.com  ', '2022-03-15'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
    (3, 'Alice', 'Brown', 'alice.brown@email.com', '2022-06-10'),
    (4, 'Robert', 'Wilson', 'robert.wilson@email.com', '2023-01-20'),
    (5, 'Emily', 'Davis', 'emily.davis@email.com', '2020-09-05'),
    (6, 'Chris', 'Taylor', 'chris.taylor@email.com', '2023-08-30'),
    (7, 'Michael', 'Anderson', 'michael.anderson@email.com', '2021-05-18'),
    (8, 'Sarah', 'Thomas', 'sarah.thomas@email.com', '2022-12-01'),
    (9, 'Daniel', 'Jackson', 'daniel.jackson@email.com', '2020-07-22'),
    (10, 'Olivia', 'White', 'olivia.white@email.com', '2023-04-14');


-- ============================================================
-- ORDERS SAMPLE DATA
-- ============================================================
-- Order 110 has a NULL CustomerID.
-- This is used to demonstrate unmatched JOIN results.
-- ============================================================

INSERT INTO Orders
    (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (101, 1, '2023-07-01', 150.50),
    (102, 2, '2023-07-03', 200.75),
    (103, 1, '2023-07-10', 50.00),
    (104, 3, '2023-07-12', 1200.00),
    (105, 4, '2023-07-15', 800.00),
    (106, 5, '2023-07-18', 300.25),
    (107, 7, '2023-07-20', 650.00),
    (108, 8, '2023-07-22', 1500.00),
    (109, 9, '2023-07-25', 450.50),
    (110, NULL, '2023-07-28', 99.99);


-- ============================================================
-- EMPLOYEES SAMPLE DATA
-- ============================================================

INSERT INTO Employees
    (EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
    (1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
    (2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
    (3, 'David', 'Kim', 'Sales', '2019-07-01', 72000.00),
    (4, 'Laura', 'Perez', 'Marketing', '2022-02-11', 48000.00),
    (5, 'James', 'Nguyen', 'IT', '2018-05-23', 90000.00),
    (6, 'Sophia', 'Martin', 'Finance', '2023-04-02', 40000.00),
    (7, 'Daniel', 'Clark', 'Sales', '2020-08-17', 68000.00),
    (8, 'Emma', 'Lewis', 'Marketing', '2021-09-12', 62000.00),
    (9, 'William', 'Walker', 'IT', '2019-11-05', 85000.00),
    (10, 'Ava', 'Hall', 'Finance', '2022-06-25', 43000.00);


-- ============================================================
-- END OF CODE
-- ============================================================
