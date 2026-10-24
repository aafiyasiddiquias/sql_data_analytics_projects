# SQL Case Study 1: Sales, Profit and Marketing Analysis

## Problem Statement
As a database administrator, the goal was to use sample customer data to answer business questions about sales and profit across states, marketing spend, COGS (Cost of Goods Sold) and budget figures, and to find out which products sell the most.

## Dataset
Three related tables, joined using `ProductId` and `Area Code`:

| Table | File | Rows | Columns |
|-------|------|------|---------|
| fact | `fact.csv` | about 4,200 | Date, ProductId, Profit, Sales, Margin, COGS, Total Expenses, Marketing, Inventory, Budget Profit, Budget COGS, Budget Margin, Budget Sales, Area Code |
| Product | `Product.csv` | 13 | ProductId, Product Type, Product, Type |
| Location | `Location.csv` | 156 | Area Code, State, Market, Market Size |

## What the 29 Queries Cover

| Topic | Questions | Concepts Used |
|-------|-----------|---------------|
| Basic aggregations | 1 to 5, 8, 10, 13 | COUNT DISTINCT, SUM, MIN, MAX, AVG |
| Filtering and sorting | 6, 7, 11, 27 | WHERE, BETWEEN, ORDER BY |
| Grouping | 12, 14 | GROUP BY, HAVING |
| Joins | 9, 15, 17, 18, 20 | INNER JOIN on 2 and 3 tables, subquery |
| Window functions | 16 | DENSE_RANK() |
| Calculations and logic | 19, 22 | Calculated columns, CASE WHEN |
| Advanced grouping | 23 | ROLLUP, DATEPART |
| Set operators | 24 | UNION, INTERSECT |
| Stored procedure and function | 21, 25 | Parameterised stored procedure, table-valued user-defined function |
| Transactions and data changes | 26, 28 | BEGIN TRANSACTION, ROLLBACK, UPDATE, DELETE |
| String functions | 29 | ASCII, SUBSTRING |

## Files in this Folder
- `SQL_CASE_STUDY_1.sql`: all 29 queries, with each question written as a comment above its query
- `fact.csv`, `Product.csv`, `Location.csv`: datasets

## Tools
Microsoft SQL Server (T-SQL)

## Key Learnings
- Joining a fact table with dimension tables (Product and Location) to build state-wise and product-wise reports
- Using `GROUP BY` with `HAVING` to filter grouped results
- Using `ROLLUP` to get subtotals at week, date and product level
- Creating reusable stored procedures and user-defined functions
- Testing a data change safely inside a transaction and rolling it back
