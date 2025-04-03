-- Creating a database :
CREATE DATABASE ORG;

-- using the created db : 
USE ORG;

-- Creating a table inside the org db : 
CREATE TABLE Workers(
    worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- worker_id the PK for workers table 
    first_name CHAR(25) NOT NULL, 
    last_name CHAR(25) NOT NULL, 
    salary INT,
    joining_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    department_name CHAR(25)
);

-- Using the insert query to insert some details in the workers table , not writing the worker_id as it is auto incremented by itself.
INSERT INTO Workers (first_name, last_name, salary, department_name) 
VALUES
    ('raj', 'sharma', 1000, 'manufacturing'),
    ('rahul', 'roy', 1000, 'chemicals');

INSERT INTO Workers (first_name, last_name, salary, department_name) 
VALUES
    
    ('Amit', 'Verma', 1200, 'finance'),
    ('Sneha', 'Patel', 1500, 'marketing'),
    ('Vikram', 'Singh', 1300, 'sales'),
    ('Priya', 'Sharma', 1100, 'HR'),
    ('Neha', 'Gupta', 1600, 'IT'),
    ('Ravi', 'Mehta', 1400, 'research'),
    ('Kiran', 'Joshi', 1250, 'production'),
    ('Anjali', 'Nair', 1350, 'design'),
    ('Manish', 'Thakur', 1450, 'logistics'),
    ('Pooja', 'Kapoor', 1700, 'legal');

SELECT * FROM Workers;

DROP TABLE bonus; -- to drop means to delete the full table with all the rows and col's present.

create table bonus(
	worker_ref_id INT , 
    bonus_amt int(10),
    bonus_date datetime,
    foreign key (worker_ref_id) references workers(worker_id) on delete cascade -- now the worker_ref_id the FK for workers table referring to workers' worker_id
);

SHOW TABLES; -- command to show the tables present in the org db .

INSERT INTO bonus (worker_ref_id, bonus_amt, bonus_date) 
VALUES
    (1, 500, '2025-03-31 12:00:00'),
    (2, 1000, '2025-04-01 09:30:00');

SELECT * FROM bonus;

SELECT * FROM workers;

create table titles(
	worker_ref_id int , 
    worker_title char(25),
    affected_from datetime, 
    foreign key (worker_ref_id) references workers(worker_id) on delete cascade
);

INSERT INTO titles(worker_ref_id, worker_title, affected_from) 
VALUES 
    (1, 'Manager', '2025-03-31 12:00:00'),--Enclosed in single quotes
    (2, 'Asst. Manager', '2025-04-01 09:30:00');-- Enclosed in single quotes

select * from titles;


SHOW TABLES;

-- Not using the FROM clause with select : as the rdbms creats a dummy table called mysql  
					-- which helps users to to perform certain actions w/o referring to user defined tables 
-- Example :
-- SELECT now();
-- select 2+1; 


-- Using Where clause now to "filter" the db according to quries : 
USE ORG; -- selecting which db to use 
SELECT * FROM workers WHERE worker_id = 1; 
SELECT * FROM titles WHERE worker_ref_id = 1;
SELECT * FROM workers WHERE salary > 100;
SELECT * FROM workers WHERE department_name = 'manufacturing';
SELECT * FROM workers WHERE department_name = 'manufacturing' OR  department_name = 'HR';
 

-- Using Between Clause : 
USE org ;
SELECT * FROM workers WHERE salary BETWEEN 700 AND 3000;

-- Now If we want to search for more than two departmenst we can use "IN" : 
SELECT * FROM workers WHERE department_name IN('manufacturing','logistics','HR','IT','accounts')

--  using NOT :
SELECT * FROM workers WHERE department_name NOT IN ('HR', 'logistics');

-- "IS NULL" : 
SELECT * FROM workers WHERE worker_id is NULL ; 


-- Sorting  In ascending order : 
select * from Workers ORDER BY salary ASC; 

-- sorting in descending order : 
select * from Workers ORDER BY salary DESC;

INSERT INTO Workers (first_name, last_name, salary, department_name) 
VALUES
    ('Rohit', 'Sharma', 1250, 'finance'),
    ('Meera', 'Iyer', 1550, 'marketing'),
    ('Sandeep', 'Yadav', 1350, 'sales'),
    ('Asha', 'Reddy', 1150, 'HR'),
    ('Vivek', 'Mishra', 1650, 'IT'),
    ('Sunil', 'Chauhan', 1450, 'research'),
    ('Nisha', 'Pillai', 1300, 'production'),
    ('Tarun', 'Bose', 1400, 'design'),
    ('Kavita', 'Malhotra', 1500, 'logistics'),
    ('Deepak', 'Saxena', 1750, 'legal');

INSERT INTO Workers (first_name, last_name, salary, department_name) 
VALUES
    ('Amit', 'Verma', 1350, 'finance'),
    ('Sneha', 'Patel', 1600, 'marketing'),
    ('Ravi', 'Shukla', 1450, 'sales'),
    ('Priya', 'Nair', 1250, 'HR'),
    ('Alok', 'Tiwari', 1750, 'IT'),
    ('Gopal', 'Menon', 1550, 'research'),
    ('Swati', 'Joshi', 1400, 'production'),
    ('Rajesh', 'Gupta', 1500, 'design'),
    ('Simran', 'Kapoor', 1650, 'logistics'),
    ('Karan', 'Mehta', 1800, 'legal');

SELECT * FROM Workers; 

-- Distinct Clause : 
SELECT Distinct department_name  FROM workers ;

-- Data Grouping Using "GROUP BY" :  
-- find workers working in different departments :
-- for this types of quries SQL provdies Aggregation functions like COUNT , SUM , AVG , MINI , MAX : 
SELECT department_name FROM Workers GROUP BY department_name; -- this statement w/o count , avg works just like Distinct clause . 

-- USING AGGREGATION FUNCTION WITH GROUP BY : 
-- using "COUNT":
SELECT department_name , COUNT(department_name) FROM workers GROUP BY department_name;

-- using "AVG" : find average salary per department : 
SELECT department_name , AVG(salary) FROM workers GROUP BY department_name 
 
-- using "MIN" :
SELECT department_name , MIN(salary) FROM Workers GROUP BY department_name;

-- using "MAX" : 
SELECT department_name , MAX(salary) FROM workers GROUP BY department_name

-- using "SUM" : 
SELECT department_name , SUM(salary) FROM workers GROUP BY department_name;

-- "HAVING" clause : to apply "filtering" in GROUP BY only :
-- Q: Find the departments that have more than two/three employees :
SELECT department_name , COUNT(department_name) FROM Workers GROUP BY department_name HAVING COUNT(department_name) >= 3 ;  -- here applied the aggregation function with the HAVING both of these work only with GROUP BY . 








