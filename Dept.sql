CREATE DATABASE Dept; 
USE Dept; 

CREATE TABLE dept_1(
    empid INT PRIMARY KEY NOT NULL, 
    name VARCHAR(225), 
    role VARCHAR(225)
)

INSERT INTO dept_1 (empid, name, role) VALUES
    (1,'A','engineer'), 
    (2,'B','salesman'), 
    (3,'C','manager'), 
    (4,'D','salesman'), 
    (5,'E','engineer');

SELECT * FROM dept_1; 

CREATE TABLE dept_2(
    empid INT PRIMARY KEY NOT NULL, 
    name VARCHAR(225), 
    role VARCHAR(225)
)

INSERT INTO dept_2 (empid, name, role) VALUES
    (3,'C','manager'),
    (6,'F','marketing'),
    (7,'G','salesman');
    
SELECT * FROM dept_2;

-- SET OPERATIONS : 
    -- 1) List out all the employees in the company USING "UNION" Keyword :
    SELECT * FROM dept_1 UNION SELECT * FROM dept_2;

    --2) List out all the employees in all dept's who work as salesman USING "UNION" Keyword: 
    SELECT * FROM dept_1 WHERE role = 'salesman'
    UNION
    SELECT * FROM dept_1 WHERE role = 'salesman';

    --3) List out all the employees who work for both the departments USING "INTERSECT" idology:
    SELECT * from dept_1 INNER JOIN dept_2 using(empid);

    --4) List out all the employees working in dept but not in dept2 USING "MINUS" idology: 
    SELECt * FROM dept_1 LEFT JOIN dept_2 using(empid) WHERE dept_2.empid is NULL; 





