
SHOW DATABASES 
USE techforallwithmurari
SHOW TABLES

SELECT * FROM employee
SHOW DATABASES
USE techforallwithmurari
SHOW TABLES
SELECT * FROM employee

/* create a table by the name of courses having field named 
   "CourseID" ,"CourseName","Course_Duration_months","Course_fee"
   
*/

 --  A foreign key is a field in one table that links to the primary key in another table. 
 
CREATE TABLE Course(
 CourseID INT AUTO_INCREMENT,
 CourseName VARCHAR(50) NOT NULL,
 CourseDuration_Months INT  NOT NULL,
 CourseFee  INT NOT NULL,
 PRIMARY KEY(CourseID)
)
DESC Course

-- Insert the course details inside the table named courses
-- "The complete Excel Mastery Course ",3,1499
-- "DSA for Interview Prepration" : 4, 3999
--  "SQL Bootcamp " , 1 ,999
INSERT INTO  Course( CourseName , CourseDuration_Months , CourseFee ) VALUE( "Complete Excel",3,1499); 
INSERT INTO  Course( CourseName , CourseDuration_Months , CourseFee ) VALUE( "DSA Interview",4,3999); 
INSERT INTO  Course( CourseName , CourseDuration_Months , CourseFee ) VALUE( "SQL Bootcamp",1,999); 

 
/*
primary key- primary key is a unique but not NULL allowed
unique key - key is unique  and Null allowed
*/

 /* foreign key ->A foreign key in one table points to a 
 primary key (or unique key) in another table.
 */
 
 /*
 A foreign key is a field in one table that links to the primary key in another table.
 
 The REFERENCES keyword is used when creating a table to set up this relationship. 
 It tells the database that a column (the foreign key) is related to a column in another table (the primary key).
 */

CREATE TABLE Learners(
Learner_Id INT AUTO_INCREMENT,
LearnerFirstName VARCHAR(50) NOT NULL,
LearnerLastName VARCHAR(50) NOT NULL,
LearnerPhoneNo VARCHAR(15) NOT NULL,
LearnerEmailID VARCHAR(50),
LearnerEnrollmentDate TIMESTAMP NOT NULL,
SelectedCourses INT NOT NULL,
YearsOfExperience INT NOT NULL,
LearnerCompany VARCHAR(50),
SourceOfJoining VARCHAR(50) NOT NULL,
Batch_Start_Date TIMESTAMP NOT NULL,
Location VARCHAR(50) NOT NULL,
PRIMARY KEY(Learner_Id),
UNIQUE KEY(LearnerEmailID),
FOREIGN KEY(SelectedCourses) REFERENCES Course(CourseID));

DESC Learners

-- Insert the learners details in the Learners table
-- Batch start date '1' - '2024-02-29'
-- Batch start date '2' - '2024-01-16'
-- Batch start date '3' - '2024-03-25'

INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES ("saksham", "S", '9998887776', "sakshamm@gmail.com", '2024-01-21', 1, 4, "Amazon", "LinkedIn", '2024-02-29', "Bengaluru");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location)
 VALUES("Aman","Raushan","8976685589", "aman@gmail.com", '2024-03-19', 3, 2, "HCL", "Youtube", '2024-03-25', "Chennai");
 INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Satyam","Jha", "9657897665","satyamk@yahoo.co.in", '2024-01-15', 2, 0, "", "Linkedin", '2024-01-16', "Noida");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Abhisekh","Kumar","7689535676", "abhisekh8743@gmail.com", '2024-03-13', 3, 4, "Accenture", "Community", '2024-03-25', "Bengaluru");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location)
VALUES("Murari","Kumar","", "murari@gmail.com",'2024-01-10', 1, 4, "Meta", "Youtube", '2024-03-29', "Bengaluru");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location)
 VALUES("Rakesh","Roy","9182937061", "rakesh2001@gmail.com", '2024-03-17', 3, 4, "TCS", "Community", '2024-03-25', "Mumbai");

SELECT * FROM Learners

-- Data Analysis [Employee, Course, Learners]
-- 1. Give me the record of the employee getting highest salary
/*

ORDER BY is a SQL clause used to sort the results of a query by one or more 
columns, either in ascending (default) or descending order.
*/
SELECT * FROM employee
ORDER BY Salary DESC
LIMIT 1 
/*
MAX():This function returns the maximum value from a column.
MIN():This function returns the minimum value from a column.
The AS keyword is used to rename a column or a table in the result set.
*/

SELECT MAX(Salary) as max_salary FROM employee
SELECT MIN(Salary) as min_salary FROM employee

SELECT *
FROM employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM employee
    
);
SELECT * FROM employee 



-- 2. Give me the record of the employee getting highest salary and age is bigger than 20

SELECT * FROM employee 
WHERE age > 30 
ORDER BY Salary DESC 
LIMIT 1

-- 3. Display the number of enrollments in the webiste of techforallwithmurari
-- COUNT(*): This counts all rows in a table, including rows with NULL values. 
SELECT COUNT(*) as num_of_enrollments 
FROM Learners

-- 4. Display the number of enrollments for the courseid = 3[SQL Bootcamp]
SELECT COUNT(*) AS num_of_learners_SQL
FROM Learners 
WHERE SelectedCourses=3 ;

SELECT * FROM Learners

-- 5. Count the number of learners enrolled in the month of Jan
-- '2024-02-29'

/*
 LIKE operator is used to search for a specific pattern in a column. 
 It’s often used in WHERE clauses to filter rows based on partial matches.
*/
SELECT COUNT(*) as num_learners_jan FROM Learners
WHERE LearnerEnrollmentDate LIKE '%-01-21'

-- 6. Update the Jeevan data with years of experience as 1 and learner company as "Amazon"
Update Learners 
SET YearsOfExperience = 2, LearnerCompany = 'Amazon' 
WHERE Learner_Id = 4

SELECT * FROM Learners

-- 7. Count the number of companies where learners currently doing their job
-- Count -> count the non null entries
-- Unique count of the companies
SELECT COUNT(DISTINCT LearnerCompany) as distinct_companies 
FROM Learners
