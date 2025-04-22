1) Here's why INSERT is still very important even though REPLACE seems more flexible:

    Why we use INSERT:

        a)Data Integrity: INSERT ensures you're only adding new, unique records. If a record already exists (same primary key), it throws an error — this protects your data from being overwritten by mistake.

        b)Better Performance: INSERT is faster because it doesn't check for existing records or delete anything behind the scenes like REPLACE does.

        c)Intent Clarity: Using INSERT clearly tells the database: "I'm only adding new data." It's good practice for cleaner, safer code.

        d)Avoiding Unwanted NULLs: REPLACE deletes the old row and inserts the new one — so any unspecified fields can become NULL. INSERT avoids this.

2)  Difference between INSERT , UPDATE , REPLACE:
        INSERT adds a new row; fails if the primary key already exists.

        UPDATE modifies existing rows based on a condition; doesn’t add new rows.

        REPLACE deletes the old row (if primary key exists) and inserts a new one.

        When to use each:
            INSERT → When you're sure the data is new.

            UPDATE → When modifying existing records.

            REPLACE → When you want to insert or overwrite depending on existence, but are okay with possible data loss in unspecified fields.

3) Why not always use REPLACE?

    a) Performance Considerations:

        REPLACE performs both a `DELETE and an INSERT` operation. This means it can be more resource-intensive than just using INSERT, especially when you don’t need to replace existing data.

        If you want to add a new row without replacing anything, INSERT is faster and more efficient.

    b) Loss of Data:

        REPLACE deletes the old row before inserting the new one. This can cause a loss of any data that was previously in the row. For example, if there are other columns (not just the one being updated) with important data, using REPLACE might result in accidental data loss.

        INSERT will never modify existing data. It simply adds new rows.

    c) Use Case:

        INSERT is used when you want to add new records without affecting any existing data.

        REPLACE is useful when you need to update a record (based on the primary key) or insert a new record if it doesn’t exist, but you should use it carefully because it involves a deletion.

4) Joins vs Set Operations:  

        Joins: 

            --> Combines multiples tables based on the matching condition. 
            --> Column wise combination. 
            --> Data types of two tables can be different 
            --> CAN GENERATE BOTH DISTINCT OR DUPLICATE ROWS
            --> The number of column(s) selected may or may not be same from each table 
            --> Combines results horizontally . 

        Set: 

            --> Combination is resultinh set from two or more SELECT statements. 
            --> Row wise combination 
            --> Datatypes of corresponding columns from each table should be the same. 
            --> GENRATE DISTINCT ROWS. 
            --> The number of column(s) selected must be same from each table 
            --> Combines results vertically . 

5) SUB QURIES: 

        --> Alternate to JOINS
        --> Outer Query Depends on inner query. 
        --> It is used with FROM, WHERE, SELECT Clause. 

6) SQL Pattern Matching: 

    LIKE operator for simple pattern matching using:

    '%' → matches zero or more characters

    '_' → matches exactly one character

    '%a' → matches any string that ends with 'a'

    '%' → wildcard for any number of characters before

    Pattern || Meaning
    'a%'    || Starts with 'a'
    '%a'    || Ends with 'a'
    '%a%'   || Contains 'a'
    'a'	    || Exactly equal to 'a'
    '____'  || Any 4-letter word
    '%aa%'  || Contains "aa"

