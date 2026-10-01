# University Database - DBMS Lab

A relational database for a university, built for DBMS Lab Assignment #1.

## Tables
- department
- professor
- course
- student
- enrollment
- teaching
- prerequisite

## Files
- `university.sql`: creates the database, tables, constraints and sample data
- `assignment1_queries.sql`: the 15 assignment queries

## How to run
1. Install MySQL or MariaDB.
2. Run the setup script:
   ```
   mysql -u root -p < university.sql
   ```
3. Run the queries:
   ```
   mysql -u root -p < assignment1_queries.sql
   ```

## Notes
- Duplicate student roll no. 7 in the source data was inserted once.
- Teaching rows with course IDs `PCE001` and `UCE001` were treated as typos for `PEC001` and `UEC001`.
- `preReqCourse` has no foreign key, since values like `H.S` and `B.E` are not course IDs.
