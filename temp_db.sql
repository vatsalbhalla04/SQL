-- Create database
CREATE DATABASE IF NOT EXISTS temp;
USE temp;

-- Create customers table
CREATE TABLE customers (
    id INT PRIMARY KEY, 
    cname VARCHAR(225),
    Address VARCHAR(225),
    Gender CHAR(2),
    City VARCHAR(225),
    Pincode INT
);

-- Insert customer data
INSERT INTO customers (id, cname, Address, Gender, City, Pincode) VALUES 
(1, 'Rahul Sharma', '123 MG Road', 'M', 'Mumbai', 400001),
(2, 'Priya Verma', '56 Park Street', 'F', 'Kolkata', 700016),
(3, 'Amit Kumar', '78 Residency Road', 'M', 'Bangalore', 560025),
(4, 'Sneha Iyer', '90 Anna Nagar', 'F', 'Chennai', 600102),
(5, 'Arjun Das', '45 Sector 5', 'M', 'Delhi', 110085),
(6, 'Kiran Rao', NULL, 'M', 'Hyderabad', NULL);

-- View customer data
SELECT * FROM customers;

-- Create order_details table with FK constraint
CREATE TABLE order_details (
    Order_id INT PRIMARY KEY, 
    delivery_date DATE, 
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- Insert order records (customer can place multiple orders)
INSERT INTO order_details VALUES 
(1, '2019-03-11', 4),
(2, '2019-03-12', 4);

-- Show existing tables
SHOW TABLES;

-- Create account table with UNIQUE and CHECK constraints
CREATE TABLE account (
    id INT PRIMARY KEY, 
    username VARCHAR(25) UNIQUE NOT NULL,
    balance INT,
    CONSTRAINT acc_balance_check CHECK (balance > 1000)
);

-- Insert account data
INSERT INTO account (id, username, balance) VALUES
(1, 'A', 1100),
(2, 'B', 1200);

-- View account data
SELECT * FROM account;

-- Drop and recreate account table with DEFAULT constraint
DROP TABLE account;
CREATE TABLE account (
    id INT PRIMARY KEY, 
    username VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

-- Insert record with default balance
INSERT INTO account (id, username) VALUES
(2, 'B');

-- ALTER operations
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;
ALTER TABLE account CHANGE COLUMN interest saving_int FLOAT NOT NULL DEFAULT 0;
ALTER TABLE account DROP COLUMN saving_int;
ALTER TABLE account RENAME TO account_details;

-- Check updated structure
DESC account_details;
SELECT * FROM account_details;
SHOW TABLES;

-- DML operations
-- UPDATE specific customer
UPDATE customers SET Address = 'Mumbai', Pincode = 123456 WHERE id = 1;

-- UPDATE all customer pincodes
UPDATE customers SET Pincode = 11111;

-- DELETE specific customer
DELETE FROM customers WHERE id = 4;

-- Drop all tables safely
USE temp;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS account_details;
DROP TABLE IF EXISTS workers;

-- Show tables after cleanup
SHOW TABLES;

-- Verify cascading behavior (only works before dropping order_details)
SELECT * FROM order_details;
