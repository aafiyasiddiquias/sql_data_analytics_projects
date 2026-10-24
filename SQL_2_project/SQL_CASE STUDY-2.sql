CREATE DATABASE Case_Study_2;

USE Case_Study_2;

CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50)
);

INSERT INTO Location (Location_ID, City) 
VALUES (122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');



CREATE TABLE Department (
    Department_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Location_Id INT, FOREIGN KEY (Location_Id) REFERENCES Location(Location_ID)
);

INSERT INTO Department (Department_Id, Name, Location_Id) 
VALUES (10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);



CREATE TABLE Job (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(50)
);

INSERT INTO Job (Job_ID, Designation) 
VALUES (667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');



CREATE TABLE Employee (
    Employee_Id INT PRIMARY KEY,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Job_Id INT,
    Hire_Date DATE,
    Salary DECIMAL(10, 2),
    Comm DECIMAL(10, 2),
    Department_Id INT,
    FOREIGN KEY (Job_Id) REFERENCES Job(Job_ID),
    FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id)
);

INSERT INTO Employee (Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, Hire_Date, Salary, Comm, Department_Id) VALUES
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, NULL, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '1985-05-15', 2750, NULL, 30),
(757, 'Baker', 'Leslie', 'D', 671, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 50, 30);



--Simple Queries:->
--1. List all the employee details. 
    SELECT * From Employee;

--2. List all the department details. 
    SELECT * From Department;

--3. List all job details. 
    SELECT * From Job;

--4. List all the locations.
    SELECT * From Location;

--5. List out the First Name, Last Name, Salary, Commission for all Employees. 
    SELECT First_Name, Last_Name, Salary, Comm From Employee;

--6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id". 
    SELECT Employee_id AS [ID of the Employee], Last_Name AS [Name of the Employee], Department_id AS Dep_id From Employee;

--7. List out the annual salary of the employees with their names only. 
    SELECT First_Name+ ' ' + Last_name AS Employee_Name, Salary*12 AS Annual_Salary From Employee;



--WHERE Condition:->
--1. List the details about "Smith". 
    SELECT * from Employee WHERE Last_Name = 'Smith';

--2. List out the employees who are working in department 20. 
    SELECT * from Employee WHERE Department_id = 20;

--3. List out the employees who are earning salary between 2000 and 3000. 
    SELECT * from Employee WHERE Salary BETWEEN 2000 AND 3000;

--4. List out the employees who are working in department 10 or 20. 
   SELECT * from Employee WHERE Department_Id = 10 OR Department_Id = 20;

--5. Find out the employees who are not working in department 10 or 30.
   SELECT * from Employee WHERE Department_Id NOT IN (10, 30);

--6. List out the employees whose name starts with 'L'. 
   SELECT * from Employee WHERE First_Name LIKE 'L%';

--7. List out the employees whose name starts with 'L' and ends with 'E'. 
    SELECT * from Employee WHERE First_Name LIKE 'L%E';

--8. List out the employees whose name length is 4 and start with 'J'. 
    SELECT * from Employee WHERE First_Name LIKE 'J___';

--9. List out the employees who are working in department 30 and draw the salaries more than 2500. 
    SELECT * from Employee WHERE Department_id = 30 AND Salary > 2500;

--10. List out the employees who are not receiving commission. 
    SELECT * from Employee WHERE Comm IS NULL;

--ORDER BY Clause:-> 
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID. 
    SELECT Employee_id, Last_Name from Employee ORDER BY Employee_id ASC;

--2. List out the Employee ID and Name in descending order based on salary. 
    SELECT Employee_id, First_Name from Employee ORDER BY Salary DESC; 

--3. List out the employee details according to their Last Name in ascending-order. 
    SELECT * from Employee ORDER BY Last_Name ASC;

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order. 
    SELECT * from Employee ORDER BY Last_Name ASC , Department_id DESC;


--GROUP BY and HAVING Clause:-> 
--1. List out the department wise maximum salary, minimum salary and average salary of the employees. 
    SELECT Department_id, MAX(Salary) AS Maximum_Salary, MIN(Salary) AS Minimum_Salary, AVG(Salary) AS Average_Salary
    from Employee
    GROUP BY Department_id;

--2. List out the job wise maximum salary, minimum salary and average salary of the employees. 
    SELECT Job_id, MAX(Salary) AS Maximum_Salary, MIN(Salary) AS Minimum_Salary, AVG(Salary) AS Average_Salary
    from Employee
    GROUP BY Job_id;

--3. List out the number of employees who joined each month in ascending order. 
    SELECT MONTH(Hire_Date) AS Hire_Month, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY MONTH(Hire_Date)
    ORDER BY Number_Of_Employees ASC;

--4. List out the number of employees for each month and year in ascending order based on the year and month.
    SELECT YEAR(Hire_Date) AS Hire_Year, MONTH(Hire_Date) AS Hire_Month, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
    ORDER BY Hire_Year, Hire_Month;

--5. List out the Department ID having at least four employees. 
    SELECT Department_id, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY Department_id
    HAVING COUNT(*) >= 4;
    
--6. How many employees joined in February month. 
    SELECT MONTH(Hire_Date) AS Hire_Month, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY MONTH(Hire_Date)
    HAVING MONTH(Hire_Date) = 2;

--7. How many employees joined in May or June month. 
    SELECT MONTH(Hire_Date) AS Hire_Month, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY MONTH(Hire_Date)
    HAVING MONTH(Hire_Date) IN (5 , 6);

--8. How many employees joined in 1985? 
    SELECT YEAR(Hire_Date) AS Hire_YEAR, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY YEAR(Hire_Date)
    HAVING YEAR(Hire_Date) = 1985;

--9. How many employees joined each month in 1985? 
    SELECT YEAR(Hire_Date) AS Hire_Year, MONTH(Hire_Date) AS Hire_Month, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY MONTH(Hire_Date), YEAR(Hire_Date)
    HAVING YEAR(Hire_Date) = 1985;
    

--10. How many employees were joined in April 1985? 
    SELECT YEAR(Hire_Date) AS Hire_Year, MONTH(Hire_Date) AS Hire_Month, COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY MONTH(Hire_Date), YEAR(Hire_Date)
    HAVING YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date)= 4;
    
--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985? 
    SELECT Department_Id, COUNT(*) AS Number_Of_Employee from Employee
    WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4
    GROUP BY Department_Id
    HAVING COUNT(*) >= 3;

--Joins: 
--1. List out employees with their department names. 
    SELECT E.Employee_Id, E.First_Name, E.Last_Name, E.Department_id, D.Name AS Department_Name 
    from Employee AS E
    LEFT JOIN Department AS D ON E.Department_id = D.Department_id;

--2. Display employees with their designations. 
    SELECT E.Employee_Id, E.First_Name, E.Last_Name, E.Job_id, J.Designation 
    from Employee AS E
    JOIN Job AS J ON E.Job_id = J.Job_id;

--3. Display the employees with their department names and city. 
    SELECT E.Employee_Id, E.First_Name, E.Last_Name, D.Name AS Department_Name, L.City 
    from Employee AS E
    JOIN Department AS D ON E.Department_id = D.Department_id
    JOIN Location AS L ON D.Location_id = L.Location_ID;

--4. How many employees are working in different departments? Display with department names.
    SELECT D.Name AS Department_Name, COUNT(E.Employee_Id) AS NO_EMPLOYEE
    from Employee AS E
    RIGHT JOIN Department AS D ON E.Department_id = D.Department_id
    GROUP BY D.Name;
 
--5. How many employees are working in the sales department? 
    SELECT D.Name AS Department_Name, COUNT(E.Employee_Id) AS NO_EMPLOYEE
    from Employee AS E
    RIGHT JOIN Department AS D ON E.Department_id = D.Department_id
    WHERE D.Name = 'Sales'
    GROUP BY D.Name;

--6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order. 
    SELECT D.Name AS Department_Name, COUNT(E.Employee_Id) AS Number_Of_Employees
    from Employee E
    JOIN Department D ON E.Department_Id = D.Department_Id
    GROUP BY D.Name
    HAVING COUNT(E.Employee_Id) >= 3
    ORDER BY D.Name ASC;

--7. How many employees are working in 'Dallas'? 
    SELECT L.City, COUNT(E.Employee_Id) AS Number_Of_Employees
    from Employee E
    JOIN Department AS D ON E.Department_id = D.Department_Id
    JOIN Location AS L ON D.Location_Id = L.Location_ID
    WHERE L.City = 'Dallas'
    GROUP BY L.City;

--8. Display all employees in sales or operation departments.
    SELECT E.Employee_Id, E.First_Name, E.Last_Name, D.Name AS Department_Name
    from Employee E
    JOIN Department D ON E.Department_Id = D.Department_Id
    WHERE D.Name IN ('Sales', 'Operations');

--CONDITIONAL STATEMENT:-> 
--1. Display the employee details with salary grades. Use conditional statement to create a grade column.
    SELECT Employee_Id, (First_Name+ ' ' +Last_Name) AS Employee_Name, Department_id, Salary,
        CASE
            WHEN Salary >= 2500 THEN 'A'
            WHEN Salary >= 2000 THEN 'B'
            WHEN Salary >= 1500 THEN 'C'
            ELSE 'D'
            END AS Salary_Grade
        from Employee;

--2. List out the number of employees grade wise. Use conditional statement to create a grade column.
    SELECT
    CASE
        WHEN Salary >= 2500 THEN 'A'
        WHEN Salary >= 2000 THEN 'B'
        WHEN Salary >= 1500 THEN 'C'
        ELSE 'D'
        END AS Salary_Grade,
        COUNT(*) AS Number_Of_Employees
    from Employee
    GROUP BY
        CASE
            WHEN Salary >= 2500 THEN 'A'
            WHEN Salary >= 2000 THEN 'B'
            WHEN Salary >= 1500 THEN 'C'
            ELSE 'D'
        END;

--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
    SELECT
        CASE
            WHEN Salary >= 2500 THEN 'A'
            WHEN Salary >= 2000 THEN 'B'
            WHEN Salary >= 1500 THEN 'C'
            ELSE 'D'
        END AS Salary_Grade,
        COUNT(*) AS Number_Of_Employees
    from Employee
    WHERE Salary BETWEEN 2000 AND 5000
    GROUP BY
        CASE
            WHEN Salary >= 2500 THEN 'A'
            WHEN Salary >= 2000 THEN 'B'
            WHEN Salary >= 1500 THEN 'C'
            ELSE 'D'
        END
    ORDER BY Salary_Grade;

--Subqueries:->
--1. Display the employees list who got the maximum salary. 
    SELECT * from Employee
    WHERE Salary = (SELECT MAX(Salary) from Employee);

--2. Display the employees who are working in the sales department. 
    SELECT * from Employee
    WHERE Department_Id = (SELECT Department_Id from Department WHERE Name = 'Sales');

--3. Display the employees who are working as 'Clerk'. 
    SELECT * from Employee
    WHERE Job_Id = (SELECT Job_ID from Job WHERE Designation = 'Clerk');

--4. Display the list of employees who are living in 'Boston'. 
    SELECT * from Employee
    WHERE Department_Id = (SELECT D.Department_Id from Department AS D
                            JOIN Location AS L ON D.Location_Id = L.Location_ID
                            WHERE L.City = 'Boston');
        
--5. Find out the number of employees working in the sales department. 
    SELECT COUNT(*) AS Number_Of_Employees from Employee
    WHERE Department_Id = (SELECT Department_Id from Department
                            WHERE Name = 'Sales');
        
--6. Update the salaries of employees who are working as clerks on the basis of 10%. 
    UPDATE Employee
    SET Salary = Salary * 1.10
    WHERE Job_Id = (SELECT Job_ID from Job
                    WHERE Designation = 'Clerk');
       
--7. Display the second highest salary drawing employee details. 
    SELECT * from Employee
     WHERE Salary = (SELECT MAX(Salary) from Employee 
                    WHERE Salary < (SELECT MAX(Salary) from Employee)
                    );
                                                    
--8. List out the employees who earn more than every employee in department 30. 
    SELECT * from Employee
    WHERE Salary > ALL (SELECT Salary from Employee
                        WHERE Department_Id = 30);
       
--9. Find out which department has no employees. 
    SELECT D.Name, D.Department_Id, 0 AS Employee_no from Department AS D
    WHERE NOT EXISTS (SELECT 1 from Employee AS E
                      WHERE E.Department_Id = D.Department_Id);
        

--10. Find out the employees who earn greater than the average salary for their department.
  SELECT E.Employee_Id, E.First_Name, E.Last_Name, E.Salary, E.Department_Id from Employee AS E
  WHERE E.Salary > (SELECT AVG(E2.Salary)from Employee AS E2
                    WHERE E2.Department_Id = E.Department_Id);
    
