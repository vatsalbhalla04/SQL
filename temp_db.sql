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

    -- View customer data using select query:
    SELECT * FROM customers;

    -- Create order_details table with FK constraint
    CREATE TABLE order_details (
        Order_id INT PRIMARY KEY, 
        delivery_date DATE, 
        cust_id INT, -- FK
        FOREIGN KEY (cust_id) REFERENCES customers(id) ON DELETE SET NULL

        --cust_id in the order_details table is the foreign key that "points" to the id in the customers table. It establishes a relationship between the two tables. 

        -- ON DELETE CASCADE : is a foreign key constraint behavior in SQL that automatically deletes child table rows when the referenced row in the parent table is deleted.

        --ON DELETE SET NULL : If a record in the parent table is deleted, set the foreign key in the child table to NULL.
    );

    -- Insert order records (customer can place multiple orders)
    INSERT INTO order_details VALUES 
    (1, '2019-03-11', 4),
    (2, '2019-03-12', 4);

    SELECT * FROM order_details;  
    -- Show existing tables
    SHOW TABLES;

    -- Create account table with UNIQUE and adding a constraints along while creating the table/
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

    -- ALTER operations : when you use the ALTER query, it is always applied to an existing table. The purpose of the ALTER statement is to modify the structure of a table after it has been created. You can't use ALTER to create a new table; it's only for making changes to an already existing table, such as adding or dropping columns, changing column data types, adding constraints (like foreign keys), and so on.

    -- Commands associated with ALTER ARE ADD, MODIFY, DROP, RENAME, CHANGE
        ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

        ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

    -- CHANGE COLUMN : to rename the cloumn :
        -- Basic syntax : 
        --  ALTER TABLE table_name old_col_name new_col_name + if you want to change the datatype also . 
        ALTER TABLE account CHANGE COLUMN interest saving_int FLOAT NOT NULL DEFAULT 0;

        -- "DROP" column :  
        ALTER TABLE account DROP COLUMN saving_int;

        -- NOW TO CHANGE THE NAME OF THE TABLE : 
        ALTER TABLE account RENAME TO account_details;

        -- Check updated structure
        DESC account_details;

        SELECT * FROM account_details;
        
        SHOW TABLES;

        -- DML operations : INSERT , DELETE UPDATE , REPLACE , ON DELETE CASCADE , ON DELETE NULL
        -- UPDATE specific customer
        UPDATE customers SET Address = 'Mumbai', Pincode = 123456 WHERE id = 1;

        -- UPDATE all customer pincodes
        UPDATE customers SET Pincode = 11111;

        -- DELETE specific customer
        DELETE FROM customers WHERE id = 125;

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

        -- Replace  : if the data is already present then it will replace . and if not present then it will insert . 
        REPLACE INTO customers VALUES (1, 'Vatsal', 'Maninagar', 'M', 'Ahmedabad', 123456);

        REPLACE INTO customers VALUES(2,'Priya','Kankaria','F','Ahmedabad',380040);

        -- This query will insert a record with NULL values for all unspecified fields.
        REPLACE INTO customers (id) VALUES (2);

        -- Using SELECT with the REPLACE statement to replace a record, setting unspecified fields to "NULL" : 
        REPLACE INTO customers (id,cname,city)
                 SELECT id,cname,city
                 FROM customers WHERE id = 3;

        SELECT * FROM customers;

    

        


        

    