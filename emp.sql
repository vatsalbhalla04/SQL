CREATE DATABASE emp; 
USE emp; 

-- creating the employee table : 
CREATE TABLE employee (
    id INT PRIMARY KEY NOT NULL,
    fname VARCHAR(225),
    lname VARCHAR(225),
    emailID VARCHAR(225),
    Phone_No VARCHAR(15),
    City VARCHAR(225)
);

INSERT INTO employee (id, fname, lname, emailID, Phone_No, City) VALUES
    (1, 'Aarav', 'Patel', 'aarav.patel@example.com', '9876543210', 'Ahmedabad'),
    (2, 'Sneha', 'Sharma', 'sneha.sharma@example.com', '9123456789', 'Mumbai'),
    (3, 'Rohan', 'Mehta', 'rohan.mehta@example.com', '9988776655', 'Delhi'),
    (4, 'Priya', 'Singh', 'priya.singh@example.com', '9090909090', 'Bangalore'),
    (5, 'Karan', 'Desai', 'karan.desai@example.com', '9000012345', 'Pune');


SELECT * FROM employee; 

-- creating table clinet :   
CREATE TABLE client (
    id INT PRIMARY KEY NOT NULL, 
    cfirst_name VARCHAR(225),
    clast_name VARCHAR(225),
    client_emailID VARCHAR(225),
    client_Phone_No VARCHAR(15),
    City VARCHAR(225),
    emp_ID INT,
    FOREIGN KEY (emp_ID) REFERENCES employee(id) ON DELETE CASCADE
);

INSERT INTO client (id, cfirst_name, clast_name, client_emailID, client_Phone_No, City, emp_ID) VALUES
    (1, 'Neha', 'Kapoor', 'neha.kapoor@example.com', '9812345678', 'Delhi', 1),
    (2, 'Amit', 'Verma', 'amit.verma@example.com', '9823456789', 'Mumbai', 2),
    (3, 'Riya', 'Jain', 'riya.jain@example.com', '9834567890', 'Chennai', 3),
    (4, 'Vikram', 'Rao', 'vikram.rao@example.com', '9845678901', 'Hyderabad', 4),
    (5, 'Tina', 'Sharma', 'tina.sharma@example.com', '9856789012', 'Pune', 5);

SELECT * FROM client; 

--creating the project table : 
CREATE TABLE project(
    project_id INT PRIMARY KEY NOT NULL, 
    name VARCHAR(100),
    startdate DATE,
    empID INT,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES employee(id) ON DELETE SET NULL,
    FOREIGN KEY (clientID) REFERENCES client(id) ON DELETE SET NULL
);

INSERT INTO project (project_id, name, startdate, empID, clientID) VALUES 
    (1, 'Project Alpha', '2021-04-21', 1, 3),
    (2, 'Project Beta', '2021-03-12', 2, 1),
    (3, 'Project Gamma', '2021-01-16', 3, 5),
    (4, 'Project Delta', '2021-04-27', 3, 2),
    (5, 'Project Epsilon', '2021-05-01', 5, 4);


SELECT * FROM project;  


-- Performing the JOINS on the above three tables: 

    --1) INNER JOIN : 
        --a)Enlist all the employees ID , names along with the project allocated to them. 
         -- employee is the left table and project is the right table.
        SELECT e.id , e.fname , e.lname , p.project_id , p.name from employee as e 
        INNER JOIN project as p ON e.id = p.empID; 
         

        --b) Now using the * for selecting all the col's from both the employee and project table:
        SELECT * FROM employee as e 
        INNER JOIN project as p ON e.id = p.project_id; 


        SELECT DISTINCT City FROM employee;
        -- emp are working in Ahmedabad, Mumbai, Delhi, Bangalore, Pune

        SELECT DISTINCT City FROM client;
        --clinets location: Delhi, Mumbai, Chennai, Hyderabad, Pune


        --c) Fetch out all the employee ID's and their contact detail who have been working from Bangalore with clients name and location from  Hyderabad 
        SELECT e.id, e.emailID, e.Phone_No , e.City, c.cfirst_name, c.id, c.clast_name ,c.City from employee as e INNER JOIN client as c ON e.id = c.emp_ID 
        WHERE e.City = "Bangalore" AND c.City = "Hyderabad"; 

    --2)Left Join : 
        -- a) Fetch out each project allocated to each employee:
        SELECT e.id, e.fname, p.project_id, p.name from employee as e LEFT JOIN project as p ON e.id = p.empID; 

    -- 3) Right Join:
        -- a) List out all the projects along with the employee's name and their respective allocated emailID :  
        SELECT p.project_id, p.name, e.fname, e.id, e.emailID From employee as e 
        RIGHT JOIN project as p ON e.id = p.empID;  

    -- THERE IS NO USE OF CROSS JOIN AS SUCH WHILE PERFORMING JOIN operations. 
    -- 4)  CROSS Join : 
        --a) List out all the combinations possible for the employee's name and project that can exist. 
        SELECT e.fname, e.lname, e.id, p.name FROM employee as e CROSS JOIN project as p ;


    --5) Join w/o using JOIN keyword:
        -- Syntax: SELECT * from leftable , rightable  Where leftable.id = rightable.id;

        SELECT e.id , e.fname , e.lname , p.project_id, p.name from employee as e, 
        project as p WHERE e.id = p.empID;

        
 