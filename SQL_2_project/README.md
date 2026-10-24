# SQL Case Study 2: Employee Database Analysis

## Problem Statement
Create a small company database with four related tables (Location, Department, Job and Employee), insert the data, and answer 53 business questions using SQL, from simple queries to joins and subqueries.

## Database Design
Four tables linked by primary and foreign keys:

```
Location (Location_ID PK, City)
   ↑
Department (Department_Id PK, Name, Location_Id FK)
   ↑
Employee (Employee_Id PK, Last_Name, First_Name, Middle_Name, Job_Id FK,
          Hire_Date, Salary, Comm, Department_Id FK)
   ↓
Job (Job_ID PK, Designation)
```

| Table | Rows | Details |
|-------|------|---------|
| Location | 4 | New York, Dallas, Chicago, Boston |
| Department | 4 | Accounting, Sales, Research, Operations |
| Job | 6 | Clerk, Staff, Analyst, Sales Person, Manager, President |
| Employee | 6 | Names, hire dates, salary, commission, job and department |

## What the 53 Queries Cover

| Section | Queries | Concepts Used |
|---------|---------|---------------|
| Simple Queries | 7 | SELECT, column aliases, calculated columns (annual salary) |
| WHERE Condition | 10 | BETWEEN, IN, NOT IN, LIKE (pattern matching), AND/OR, IS NULL |
| ORDER BY | 4 | Ascending and descending, multi-column sorting |
| GROUP BY and HAVING | 11 | MAX, MIN, AVG, COUNT, MONTH(), YEAR(), HAVING |
| Joins | 8 | INNER JOIN, LEFT JOIN, RIGHT JOIN, joining 3 tables |
| Conditional Statement | 3 | CASE WHEN to create salary grades A to D |
| Subqueries | 10 | Nested queries, ALL, NOT EXISTS, correlated subquery, UPDATE with subquery |

## Files in this Folder
- `SQL_mandatory_CASE STUDY-2.sql`: creates the tables, inserts the data and has all 53 queries, with each question written as a comment above its query
- `Case_Study_2_Table.txt`: table creation and insert statements

## Tools
Microsoft SQL Server (T-SQL)

## Key Learnings
- Designing related tables with primary keys and foreign keys
- Pattern matching with `LIKE` and wildcards
- Extracting month and year from dates to group data
- Choosing the right join type (INNER, LEFT, RIGHT) to keep or drop unmatched rows
- Writing nested and correlated subqueries, such as employees earning above their department average
- Using `CASE WHEN` to turn salary ranges into grades
