# Data Transformer — SQL Project

## Overview
"Data Transformer" is a SQL project simulating a small **Corporate Data Analysis System** with three related tables — `Customers`, `Orders`, and `Employees`. It demonstrates:
- Joins (INNER, LEFT, RIGHT, FULL OUTER)
- Subqueries
- Date functions (extract, difference, formatting)
- String functions (concatenate, replace, case conversion, trim)
- Window functions (running total, RANK)
- CASE expressions

## Files in this project
| File | Description |
|---|---|
| `schema.sql` | Creates the database and three tables, then loads sample data |
| `queries.sql` | All 17 required queries, each with its expected output written as a comment block underneath |
| `README.md` | This file |

## How to run
1. Run `schema.sql` first in a MySQL 8.0+ client (MySQL Workbench, `mysql` CLI, DBeaver, etc.). This drops and recreates the `data_transformer` database from scratch.
2. Run `queries.sql` against that database. Each query is followed by a comment showing what it should return, so results can be checked without re-running anything.

## Schema

**Customers** — `CustomerID (PK)`, `FirstName`, `LastName`, `Email`, `RegistrationDate`
**Orders** — `OrderID (PK)`, `CustomerID (FK → Customers)`, `OrderDate`, `TotalAmount`
**Employees** — `EmployeeID (PK)`, `FirstName`, `LastName`, `Department`, `HireDate`, `Salary`

## Design choices in the sample data
A few rows were deliberately shaped to exercise the trickier queries:
- **Order 110 has a `NULL` CustomerID.** This is what makes `RIGHT JOIN` and `FULL OUTER JOIN` meaningfully different from `INNER JOIN` — that order is dropped by an inner join but shows up with `NULL` customer fields in the others.
- **Customers 6 (Chris Taylor) and 10 (Olivia White) have no orders.** This is what makes `LEFT JOIN` meaningfully different — they appear with `NULL` order fields instead of being dropped.
- **Customer 1's email is stored with leading/trailing spaces** (`'  john.doe@email.com  '`), specifically so Query 13's `TRIM()` has something real to clean up.
- **Employee salaries range from 40000 to 90000**, so the average-salary subquery (Query 6) and the High/Medium/Low categorization (Query 17) each split employees across more than one group instead of trivially returning everyone or no one.

## Notes on portability
- Written for **MySQL** syntax (`DATE_FORMAT`, `DATEDIFF`, `CURDATE()`, `RANK() OVER (...)`).
- MySQL has no native `FULL OUTER JOIN`; Query 4 emulates it with a `UNION` of a `LEFT JOIN` and a `RIGHT JOIN`. On PostgreSQL, SQL Server, or Oracle, `FULL OUTER JOIN` can be written directly instead.
- Query 8's day counts (`DATEDIFF` to `CURDATE()`) will differ depending on the day the query is actually run — the comment block notes what the output looks like if run on **2026-09-09**.
- Query 16 labels each order with a discount tier (`'10% off'`, `'5% off'`, `'No discount'`) rather than computing a discounted dollar amount; either interpretation is reasonable for "assign a discount."
- Query 17 uses High > 70000, Medium 45000–70000, Low < 45000 as the salary bands — adjust these thresholds if your instructor specified different cutoffs.
-
