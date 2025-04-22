CREATE DATABASE practice_db;
USE practice_db; 

-- Table Worker:
CREATE TABLE Worker(
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    F_Name CHAR(25), 
    L_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME, 
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, F_NAME, L_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

-- Table Title:
CREATE TABLE Title(
    WORKER_REF_ID INT, 
    WORKER_TITLE CHAR(25), 
    AFFECTED_FROM DATETIME, 
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Executive', '2016-06-11 00:00:00'),
    (003, 'Executive', '2016-06-11 00:00:00'),
    (004, 'Manager', '2016-06-11 00:00:00'),
    (005, 'Asst. Manager', '2016-06-11 00:00:00'),
    (006, 'Lead', '2016-06-11 00:00:00'),
    (007, 'Lead', '2016-06-11 00:00:00'),
    (008, 'Lead', '2016-06-11 00:00:00');

-- Table Bonus:
CREATE TABLE Bonus(
    WORKER_REF_ID INT, 
    BONUS_AMT INT(10), 
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
)

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMT, BONUS_DATE) VALUES
    (001, 5000, '2016-02-20'),
    (002, 3000, '2016-06-11'),
    (003, 4000, '2016-02-20'),
    (004, 4500, '2016-06-11'),
    (005, 3500, '2016-06-11');

SELECT * FROM Worker; 
SELECT * FROM Title; 
SELECT * FROM Bonus; 


-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT F_NAME as WORKER_NAME from worker ; 

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(F_NAME)from worker; 

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

    --a) Using Distinct Keyword:
    SELECT DISTINCT DEPARTMENT from worker;

    --b) Using GROUP BY:
    SELECT DEPARTMENT FROM worker GROUP BY DEPARTMENT; 

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(F_Name, 1, 3)  FROM worker; 

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(F_Name, 'b') from worker WHERE F_NAME = 'Amitabh'; -- the INSTR Function Returns the position of the first occurrence of a string in another string. ALSO THIS FUNCTION IS CASE INSENSITIVE.

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(F_NAME) from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(F_NAME) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(F_NAME, 'a', 'A') From worker WHERE F_NAME LIKE '%a%';  

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
-- USING CONCAT : optional to Alias 
SELECT CONCAT(F_NAME, " ", L_NAME) AS FULL_NAME from worker; 

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * from worker ORDER BY F_NAME ASC; --You cannot use ASC or DESC without ORDER BY — they are part of the ORDER BY clause syntax.

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * from worker ORDER BY F_NAME ASC , DEPARTMENT DESC

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM worker WHERE F_NAME IN('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
    --USING NOT IN KEYWORD:
    SELECT * FROM Worker WHERE F_NAME NOT IN('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM worker WHERE DEPARTMENT = 'Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE F_NAME LIKE '%a%'; -- never use "=" with LIKE KEYWORD.

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM worker WHERE F_NAME LIKE '%a'; 

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

    --a) Using the "wilcard" and length:
    SELECT * FROM worker WHERE F_NAME LIKE '%h' And LENGTH(F_NAME) = 6; 

    --b) Simple Query: 
    SELECT * FROM worker WHERE F_NAME LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM worker WHERE SALARY BETWEEN 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM worker WHERE YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02; 

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM Worker where DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT * FROM worker WHERE SALARY >= 50000 AND SALARY <= 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(*) AS NUM_WORKERS
FROM Worker GROUP BY DEPARTMENT ORDER BY NUM_WORKERS DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.

-- Q-26. Write an SQL query to show only odd rows from a table.

-- Q-27. Write an SQL query to show only even rows from a table. 

-- Q-28. Write an SQL query to clone a new table from another table.

-- Q-29. Write an SQL query to fetch intersecting records of two tables.

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.

-- Q-37. Write an SQL query to show one row twice in results from a table.


-- Q-38. Write an SQL query to list worker_id who does not get bonus.

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

-- Q-42. Write an SQL query to show the last record from a table.

-- Q-43. Write an SQL query to fetch the first row of a table.

-- Q-44. Write an SQL query to fetch the last five records from a table.

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.






