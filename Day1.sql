
-- this is a single line comment 
/*
 multi line comment
*/
-- see the dabase
SHOW DATABASES

-- create a database
CREATE  DATABASE techforallwithmurari
CREATE  DATABASE IF NOT EXISTS techforallwithmurari

-- use a database 
USE techforallwithmurari

-- see the current database working
SELECT database()

-- create a table
-- INT ,VARCHAR
-- PRIMARY KEY are unique, not null by default
CREATE TABLE employee(
       EID  INT  AUTO_INCREMENT,
       FirstName  varchar(50) NOT NULL,
       LastName   varchar(50)  NOT NULL,
       Age    INT  NOT NULL, 
       Salary  INT NOT NULL,
       Location   varchar(50) NOT NULL,
       PRIMARY KEY(EID)
)
-- see the table
SHOW  TABLES 
 
-- see the schemme or details of table
DESC employee

-- delete the table
DROP TABLE employee

-- insert the  value in a table
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Murari","Kumar",24,50000,"Bengaluru");
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Aman","Raushan",20,60000,"Delhi");
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Saksham","S",26,80000,"Noida");
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Satyam","Jha",25,40000,"Lakshmi Nagar");
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Abhisekh","Kumar",22,90000,"Patna");
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Nabin","A",23,90000,"Nepal");
INSERT INTO employee (FirstName,LastName,Age,Salary,Location) VALUE("Prasun","Kumar",24,50000,"Gaya");

-- read the data from employee table
SELECT * FROM employee

/*
SELECT: Specifies the columns or data to retrieve.
WHERE: Specifies the condition to filter the rows.
*/

-- Give me the employe details having salary more than 50k
-- (WHERE ) is the command of filtering the data
    SELECT  * FROM  employee WHERE Salary > 50000
    
    SELECT FirstName ,LastName FROM employee 
    WHERE Salary >50000
    
-- give me the all report of employee having age more than 25
    SELECT * FROM employee
    WHERE Age >25

-- give me the firstname and lastname of employee having age more than 23
SELECT FirstName ,LastName,Age FROM employee
WHERE Age >23

/*
UPDATE: Changes the data inside the table.   (DML-Data manipulation language)
ALTER: Changes the structure or Schema of the table itself. (DDl-Data definition language)
*/

-- update the name of murari  with roy
UPDATE  employee SET LastName = "Roy"
WHERE EID =1

-- Delete the record of EID  = 5
DELETE FROM employee
WHERE EID =5



  
  
