SELECT Location, count(Location) as total_employee, avg(Salary) as avg_salary
FROM employee
GROUP BY Location

-- what is the firstName, lastName, location, total count of employee belonging to that location and the average salary of them.
-- subqueries -> one query and inside that there is another query
-- Approach 1 - Joins (Computationally Expensive Task [time required to execute the command is more])

SELECT firstName, lastName, employee.Location, total_employee, avg_salary
FROM employee
JOIN
(SELECT Location, count(Location) as total_employee, avg(Salary) as avg_salary
FROM employee
GROUP BY Location) as temp
ON employee.Location = temp.Location


-- Approach 2 - Window Functions
/*
Window functions in SQL are used to perform calculations 
across a set of table rows that are related to the current row,
 without collapsing the result into a single row
 
 PARTITION BY: Divides the result set into partitions to perform the calculation within each partition.
ORDER BY: Specifies the order of rows in each partition for the window function.
*/
SELECT FirstName,LastName,Location,
COUNT(lOCATION) OVER (PARTITION BY Location) as total,
AVG (Salary) OVER (PARTITION BY Location)  AS AVG_Salary
FROM Employee


-- Inserting two records in employee table having salary as 100000 and 45000
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Pramod", "Kumar", 26, 10000, "Noida");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Rohan", "Roy", 27, 45000, "Hyderabad");

-- RANK() -> ranking with skipping numeric data for which the ranks are same
SELECT FirstName, LastName, Salary,
RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- DENSE_RANK() -> ranking without skipping any numeric data
SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- ROW_NUMBER() vs RANK() vs DENSE_RANK()

-- Give me the details of those employee who are having 2nd highest salary
SELECT * FROM
(SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee) as temp
WHERE Priority_Salary = 2

-- Inserting two records in employee table having salary as 100000 and 45000
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Pramod", "Kumar", 26, 10000, "Noida");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES ("Rohan", "Roy", 27, 45000, "Hyderabad");

-- RANK() -> ranking with skipping numeric data for which the ranks are same
SELECT FirstName, LastName, Salary,
RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- DENSE_RANK() -> ranking without skipping any numeric data
SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- ROW_NUMBER() vs RANK() vs DENSE_RANK()

-- Give me the details of those employee who are having 2nd highest salary
SELECT * FROM
(SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee) as temp
WHERE Priority_Salary = 2


/*
Key Differences:
ROW_NUMBER(): Always unique numbers, no matter if rows have the same values.
RANK(): Same rank for ties, but skips ranks after ties.
DENSE_RANK(): Same rank for ties, but does not skip ranks after ties.
*/








