CREATE DATABASE Assigment_3;

-- Jomato CSV dataset imported into restaurant table using Flat File Import


UPDATE restaurant
SET TableBooking = 1
WHERE TableBooking = 'Yes';

UPDATE restaurant
SET TableBooking = 0
WHERE TableBooking = 'No';

ALTER table restaurant
ALTER column TableBooking BIT;

ALTER TABLE restaurant
ALTER COLUMN Rating DECIMAL(3,1); 



-- 1) Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero

CREATE PROCEDURE GetRestaurantDetails
AS
BEGIN
    SELECT RestaurantName,
           RestaurantType,
           CuisinesType
    FROM restaurant
    WHERE TableBooking <> 0;
END;

EXEC GetRestaurantDetails;

--2.  transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.

BEGIN TRANSACTION;

UPDATE restaurant
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

SELECT * 
FROM restaurant
WHERE CuisinesType = 'Cafeteria';

ROLLBACK;

--3) Row number column and find the top 5 areas with the highest rating of restaurants.

SELECT *
FROM
(
    SELECT 
        ROW_NUMBER() OVER (ORDER BY Rating DESC) AS Row_Num,
        Area,
        RestaurantName,
        Rating
    FROM restaurant
) AS RankedData
WHERE Row_Num <= 5;

--4) While loop to display the 1 to 50

        DECLARE @num INT = 1;
    WHILE @num <= 50
    BEGIN
        PRINT @num;
        SET @num = @num + 1;
    END;

--5) Create a Top rating view to store the generated top 5 highest rating of restaurants.
    
    CREATE VIEW Top_Rating_View
    AS
    SELECT TOP 5
           RestaurantName,
           Area,
           Rating
    FROM restaurant
    ORDER BY Rating DESC;
    
    --SELECT * FROM Top_Rating_View;


--6) Create a trigger that give an message whenever a new record is inserted.

    CREATE TRIGGER trg_InsertMessage
    ON restaurant
    AFTER INSERT
    AS
    BEGIN
        PRINT 'New record inserted successfully';
    END;
