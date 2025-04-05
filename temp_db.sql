CREATE DATABASE IF NOT EXISTS temp;

USE temp ; 

CREATE TABLE customers (
    id integer PRIMARY KEY , 
    cname VARCHAR(225),
    Address VARCHAR(225),
    Gender CHAR(2),
    City VARCHAR(225),
    Pincode integer
);

INSERT INTO customers (id, cname, Address, Gender, City, Pincode) 
VALUES 
(1, 'Rahul Sharma', '123 MG Road', 'M', 'Mumbai', 400001),
(2, 'Priya Verma', '56 Park Street', 'F', 'Kolkata', 700016),
(3, 'Amit Kumar', '78 Residency Road', 'M', 'Bangalore', 560025),
(4, 'Sneha Iyer', '90 Anna Nagar', 'F', 'Chennai', 600102),
(5, 'Arjun Das', '45 Sector 5', 'M', 'Delhi', 110085);

INSERT INTO customers (id, cname, Address, Gender, City, Pincode) 
VALUES 
(6, 'Kiran Rao', NULL, 'M', 'Hyderabad', NULL);

SELECT * FROM temp.customers;

CREATE TABLE order_details(
    Order_id INT PRIMARY KEY, 
    delivery_date DATE , 
    cust_id INT ,
    FOREIGN KEY(cust_id) references temp.customers(id) -- creating cust_Id as foreign key . 
);

SHOW TABLES;

-- DDL constraints : UNIQUE , DEFAULT , CHECK , PRIMARY KEY , FOREIGN KEY , ALTER .
    -- using "UNIQUE" constraint 
    -- "CHECK" constraint : it is a consistency constraint . 

CREATE TABLE account(
    id INT PRIMARY KEY, 
    username VARCHAR(25) UNIQUE NOT NULL,
    balance INT, 
    CONSTRAINT acc_balance_check CHECK (balance > 1000)
    -- syntax to use CHECK constraint 
);

INSERT INTO account(id , username , balance)
    VALUES (1 , 'A' , '1100'), 

INSERT INTO account(id , username , balance)
    VALUES  (2 , 'B' , '1200')
SELECT * FROM temp.account;

-- "DEFAULT" constraint : 
DROP TABLE temp.account;
CREATE table account(
    id int PRIMARY key , 
    username VARCHAR(255) UNIQUE, 
    balance INT NOT NULL DEFAULT 0 
)

INSERT INTO account(id , username)
    VALUES  (2 , 'B' )
 
-- an attribute can be both Primary key and foreign key in a table .  

-- using ALTER operations like : ADD , MODIFY , CHANGE COLUMN, DROP COLUMN , RENAME 
    
    -- using ADD Keyword to add a column in account table :
    ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0 

    
    -- using MODITY keyword to change the datatype of newly created column "interest" for table account : 
    ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;
    SELECT * FROM account;

    -- To know whether the datatype is changed or not the command is : 
    DESC account; -- describe keyword .

    -- CHANGE COLUMN : to rename the cloumn :
    -- Basic syntax : 
    --  ALTER TABLE table_name old_col_name new_col_name + if you want to change the datatype also . 
    ALTER TABLE account CHANGE COLUMN interest saving_int FLOAT NOT NULL DEFAULT 0

    -- "DROP" column :  
    ALTER TABLE account DROP COLUMN saving_int;

    -- NOW TO CHANGE THE NAME OF THE TABLE : 
    ALTER TABLE account RENAME TO account_details;

    SHOW TABLES;


-- DML Commands : INSERT , DELETE UPDATE , REPLACE: 
    -- UPDATE query : 
        UPDATE customers SET Address ="Mumbai" , Pincode = 123456 WHERE id = 1;

        -- using update query to change the pincode attribute for all the names .w/o using the WHERE CLAUSE . 
        UPDATE customers SET Pincode = 00000;
    SELECT * FROM customers;
