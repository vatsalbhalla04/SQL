1) Here's why INSERT is still very important even though REPLACE seems more flexible:

Why we use INSERT:
        -->Data Integrity: INSERT ensures you're only adding new, unique records. If a record already exists (same primary key), it throws an error — this protects your data from being overwritten by mistake.

        -->Better Performance: INSERT is faster because it doesn't check for existing records or delete anything behind the scenes like REPLACE does.

        -->Intent Clarity: Using INSERT clearly tells the database: "I'm only adding new data." It's good practice for cleaner, safer code.

        -->Avoiding Unwanted NULLs: REPLACE deletes the old row and inserts the new one — so any unspecified fields can become NULL. INSERT avoids this.

2)  Difference between INSERT , UPDATE , REPLACE:
        INSERT adds a new row; fails if the primary key already exists.

        UPDATE modifies existing rows based on a condition; doesn’t add new rows.

        REPLACE deletes the old row (if primary key exists) and inserts a new one.

        When to use each:
            INSERT → When you're sure the data is new.

            UPDATE → When modifying existing records.

            REPLACE → When you want to insert or overwrite depending on existence, but are okay with possible data loss in unspecified fields.
