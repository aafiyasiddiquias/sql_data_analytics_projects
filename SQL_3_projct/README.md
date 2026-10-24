# SQL SQL case study 3: Jomato Restaurant Analysis

## Problem Statement
A food delivery platform similar to Jomato shared a dataset of restaurants in a city. The task was to use SQL to extract insights and build reusable database objects for reporting.

## Dataset
**File:** `Jomato.csv` (about 7,100 restaurants, 12 columns)

| Column | Description |
|--------|-------------|
| OrderId | Unique ID |
| RestaurantName | Name of the restaurant |
| RestaurantType | Quick Bites, Casual Dining, Cafe, etc. |
| Rating | Customer rating |
| No.of.Rating | Number of ratings |
| AverageCost | Average cost |
| OnlineOrder | Online ordering available (Yes/No) |
| TableBooking | Table booking available (Yes/No) |
| CuisinesType | Cuisines served |
| Area / LocalAddress | Location details |
| Delivery time | Delivery time in minutes |

## Data Preparation
- Imported the CSV into a `restaurant` table using the Flat File Import wizard (MS SQL Server)
- Converted `TableBooking` from Yes/No to 1/0 and changed the column type to `BIT`
- Changed `Rating` to `DECIMAL(3,1)`

## Tasks and Solutions

| # | Task | Concept Used |
|---|------|--------------|
| 1 | Stored procedure to show restaurant name, type and cuisine where table booking is available | Stored Procedure |
| 2 | Update cuisine 'Cafe' to 'Cafeteria', check the result, then roll back | Transaction, ROLLBACK |
| 3 | Row number column and top 5 highest-rated restaurants by area | ROW_NUMBER(), Subquery |
| 4 | Display numbers 1 to 50 | WHILE loop |
| 5 | Create a view of the top 5 highest-rated restaurants | VIEW, TOP, ORDER BY |
| 6 | Show a message whenever a new record is inserted | AFTER INSERT Trigger |

## Files in this Folder
- `ASSIGNMNT_3.sql`: all SQL queries
- `Jomato.csv`: dataset

## Tools
MS SQL Server (T-SQL), SSMS

## Key Learnings
- Wrapping logic in stored procedures and views makes queries reusable
- Transactions let me test an update safely before deciding to keep it
- Window functions like `ROW_NUMBER()` help rank data without extra joins
