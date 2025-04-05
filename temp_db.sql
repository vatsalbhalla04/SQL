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