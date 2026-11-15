### Q1) Display All Department Information

## Problem Description

Display all records and columns from the `Department` table.

## Solution

```sql
SELECT
    *
FROM
    Department;
```

## Explanation

- `SELECT *` retrieves all columns.
- `FROM Department` specifies the source table.
- Returns all department records.

## Key Concepts

- SELECT Statement
- SELECT *
- FROM Clause

---

### Q2) Display All Employee Details

## Problem Description

Display all records and columns from the `emp` table.

## Solution

```sql
SELECT
    *
FROM
    emp;
```

## Explanation

- `SELECT *` retrieves all columns.
- `FROM emp` specifies the employee table.
- Returns all employee records.

## Key Concepts

- SELECT Statement
- SELECT *
- FROM Clause

---


### Q3) Display Employee Name and Job

## Problem Description

Display the name and job designation of all employees from the `emp` table.

## Solution

```sql
SELECT
    ename,
    job
FROM
    emp;
```

## Explanation

- `SELECT ename, job` retrieves employee names and job designations.
- `FROM emp` specifies the employee table.

## Key Concepts

- SELECT Statement
- Column Selection
- FROM Clause

---


### Q4) Display Employee Name and Salary

## Problem Description

Display the name and salary of all employees from the `emp` table.

## Solution

```sql
SELECT
    ename,
    sal
FROM
    emp;
```

## Explanation

- `SELECT ename, sal` retrieves employee names and salaries.
- `FROM emp` specifies the employee table.

## Key Concepts

- SELECT Statement
- Column Selection
- FROM Clause

---

### Q5) Display Employee Number and Total Salary

## Problem Description

Display the employee number and total salary (salary + commission) for each employee.

## Solution

```sql
SELECT
    emp_no,
    (sal + COALESCE(com, 0)) AS total_salary
FROM
    emp;
```

## Explanation

- `emp_no` retrieves the employee number.
- `sal + COALESCE(com, 0)` calculates total salary.
- `COALESCE()` replaces NULL commission with 0.
- `AS total_salary` assigns an alias to the calculated column.

## Key Concepts

- SELECT Statement
- Arithmetic Operations
- COALESCE()
- Column Aliasing

---


### Q6) Display Employee Name and Annual Salary

## Problem Description

Display the employee name and annual salary for all employees.

## Solution

```sql
SELECT
    ename,
    12 * (sal + COALESCE(com, 0)) AS Annual_salary
FROM
    emp;
```

## Explanation

- `ename` retrieves the employee name.
- `sal + COALESCE(com, 0)` calculates monthly salary including commission.
- `12 *` calculates annual salary.
- `COALESCE()` replaces NULL commission with 0.

## Key Concepts

- SELECT Statement
- Arithmetic Operations
- COALESCE()
- Column Aliasing

---

### Q7) Display Employees Working in Department 10

## Problem Description

Display the names of all employees who are working in department number 10.

## Solution

```sql
SELECT
    ename
FROM
    emp
WHERE
    dept = 10;
```

## Explanation

- `SELECT ename` retrieves employee names.
- `FROM emp` specifies the employee table.
- `WHERE dept = 10` filters employees belonging to department 10.

## Key Concepts

- SELECT Statement
- WHERE Clause
- Filtering Records

---

### Q8) Display Clerks Earning More Than 3000

## Problem Description

Display the names of all employees working as clerks and earning a salary greater than 3000.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'CLERK'
    AND sal > 3000;
```

## Explanation

- `ename` retrieves employee names.
- `job = 'CLERK'` filters employees working as clerks.
- `sal > 3000` selects employees earning more than 3000.
- `AND` ensures both conditions are satisfied.

## Key Concepts

- SELECT Statement
- WHERE Clause
- AND Operator
- Comparison Operator (`>`)

---

### Q9) Display Employees Who Earn Commission

## Problem Description

Display the employee number and names of employees who earn commission.

## Solution

```sql
SELECT
    emp_no AS Employee_Number,
    ename AS Employee_Name
FROM
    emp
WHERE
    com > 0;
```

## Explanation

- `emp_no` retrieves the employee number.
- `ename` retrieves the employee name.
- `com > 0` selects employees receiving commission greater than zero.

## Key Concepts

- SELECT Statement
- WHERE Clause
- Comparison Operator (`>`)

---

### Q10) Display Employees Who Do Not Earn Commission

## Problem Description

Display the employee number and names of employees who do not earn any commission.

## Solution

```sql
SELECT
    emp_no AS Employee_Number,
    ename AS Employee_Name
FROM
    emp
WHERE
    COALESCE(com, 0) = 0;
```

## Explanation

- `emp_no` retrieves the employee number.
- `ename` retrieves the employee name.
- `COALESCE(com, 0)` replaces NULL commission with 0.
- `= 0` selects employees who do not earn commission.

## Key Concepts

- SELECT Statement
- WHERE Clause
- COALESCE()
- NULL Handling

---

### Q11) Display Employees by Job Role and Salary

## Problem Description

Display the names of employees working as Clerk, Salesman, or Analyst and earning a salary greater than 3000.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job IN ('CLERK', 'SALESMAN', 'ANALYST')
    AND sal > 3000;
```

## Explanation

- `ename` retrieves employee names.
- `IN` checks whether the job matches any of the three specified roles.
- `sal > 3000` filters employees earning more than 3000.
- `AND` ensures both conditions are satisfied.

## Key Concepts

- SELECT Statement
- WHERE Clause
- IN Operator
- AND Operator
- Comparison Operator (`>`)

---

### Q12) Display Employees Working in the Company for the Past 5 Years

## Problem Description

Display the names of employees who joined the company within the last 5 years.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    hiredate >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
```

## Explanation

- `ename` retrieves employee names.
- `hiredate` stores the employee joining date.
- `WHERE` filters employees based on their joining date.

## New Concept: DATE_SUB(), CURDATE() and INTERVAL

### 1. CURDATE()

Returns the current date.

```sql
SELECT CURDATE();
```

### 2. DATE_SUB()

Subtracts a specified time interval from a date.

```sql
SELECT DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
```

### 3. INTERVAL

Specifies the amount of time to add or subtract.

| Unit | Meaning |
|---|---|
| YEAR | Years |
| MONTH | Months |
| DAY | Days |
| WEEK | Weeks |

### 4. How It Works

`DATE_SUB(CURDATE(), INTERVAL 5 YEAR)`

- `CURDATE()` gets today's date.
- `INTERVAL 5 YEAR` specifies five years.
- `DATE_SUB()` subtracts five years from today's date.

## Key Concepts

- SELECT Statement
- WHERE Clause
- CURDATE()
- DATE_SUB()
- INTERVAL
- Date Filtering

---

### Q13) Display Employees Who Joined Before June or After December 1990

## Problem Description

Display all employees who joined the company before 30th June 1990 or after 31st December 1990.

## Solution

```sql
SELECT
    *
FROM
    emp
WHERE
    hiredate < '1990-06-30'
    OR hiredate > '1990-12-31';
```

## Explanation

- `hiredate` stores the employee joining date.
- `< '1990-06-30'` selects employees who joined before 30 June 1990.
- `> '1990-12-31'` selects employees who joined after 31 December 1990.
- `OR` returns employees satisfying either condition.

## New Concept: OR Operator

The `OR` operator returns records when at least one condition is true.

Example:

```sql
SELECT
    *
FROM
    emp
WHERE
    deptno = 10
    OR deptno = 20;
```

This retrieves employees working in department 10 or department 20.

## Key Concepts

- SELECT Statement
- WHERE Clause
- OR Operator
- Comparison Operators (`<`, `>`)
- Date Filtering

---


### Q14) Display the Current Date

## Problem Description

Write an SQL query to display the current date.

## Solution

```sql
SELECT CURDATE();
```

## Explanation

- `CURDATE()` is a MySQL date function.
- It returns the current date in `YYYY-MM-DD` format.
- It does not return the current time.

## New Concept: CURDATE()

`CURDATE()` returns the current date from the database system.

Example:

```sql
SELECT CURDATE();
```

Sample Output:

| CURDATE() |
|---|
| 2026-11-15 |

## Key Concepts

- CURDATE()
- MySQL Date Functions
- Current Date

---


### Q15) Display the List of Users from the Log Table

## Problem Description

Display the list of users stored in the `log` table.

## Solution

```sql
SELECT
    Users
FROM
    Log;
```

## Explanation

- `SELECT Users` retrieves the user information.
- `FROM Log` specifies the source table.

## Key Concepts

- SELECT Statement
- Column Selection
- FROM Clause

---


### Q16) Display All Table Names

## Problem Description

Display the names of all tables available in the current database.

## Solution

```sql
SHOW TABLES;
```

## Explanation

- `SHOW TABLES` displays all table names in the currently selected database.
- It does not display table records or column details.

## New Concept: SHOW TABLES

Used in MySQL to list all tables in the selected database.

```sql
SHOW TABLES;
```

## Key Concepts

- SHOW TABLES
- Current Database
- Database Metadata

---

### Q17) Display the Current Database User

## Problem Description

Display the name of the currently connected database user.

## Solution

```sql
SELECT USER();
```

## Explanation

- `USER()` is a MySQL function.
- It returns the current MySQL username and host.

## New Concept: USER()

```sql
SELECT USER();
```

Returns the username and host of the current connection.

## Key Concepts

- USER()
- MySQL System Functions
- Current Database User

---

### Q18) Display the names of employees working in department number 10, 20, or 40, or employees working as clerks, salesmen, or analysts.

## Problem Description

Retrieve the names of employees who satisfy at least one of the following conditions:

1. Work in department number 10, 20, or 40.
2. Work as a CLERK, SALESMAN, or ANALYST.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    dept IN (10, 20, 40)
    OR job IN ('CLERK', 'SALESMAN', 'ANALYST');
```

## Explanation

- `IN` checks whether a value matches any value in a given list.
- `OR` returns records when at least one of the specified conditions is true.
- `AS Employee_Name` provides a meaningful output column name.

## New Concept: OR Operator

The `OR` operator combines multiple conditions.

A record is selected when either condition is true or when both conditions are true.

Example:

```sql
WHERE
    dept = 10
    OR job = 'CLERK';
```

This retrieves employees who work in department 10 or have the job title CLERK.

## Key Concepts

- SELECT
- WHERE
- IN Operator
- OR Operator
- Column Aliases

---

### Q19) Display the names of employees whose name starts with alphabet S.

## Problem Description

Retrieve employee names that start with the alphabet S.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE 'S%';
```

## Explanation

- `LIKE` is used for pattern matching.
- `'S%'` searches for names starting with S.
- `%` represents zero or more characters.

## New Concept: LIKE Operator

The `LIKE` operator searches for a specific pattern in a column.

Common wildcard characters:

| Wildcard | Meaning |
|---|---|
| `%` | Zero or more characters |
| `_` | Exactly one character |

## Key Concepts

- SELECT
- WHERE
- LIKE Operator
- Percentage (%) Wildcard

---

### Q20) Display the names of employees whose name ends with alphabet S.

## Problem Description

Retrieve employee names that end with the alphabet S.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE '%S';
```

## Explanation

- `LIKE` is used for pattern matching.
- `'%S'` searches for names ending with S.
- `%` represents zero or more characters before S.

## Key Concepts

- SELECT
- WHERE
- LIKE Operator
- Percentage (%) Wildcard

---


### Q21) Display the names of employees whose second alphabet is A.

## Problem Description

Retrieve the names of employees whose second character is A.

## Solution

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE '_A%';
```

## Explanation

- `LIKE` is used for pattern matching.
- `_` represents exactly one character.
- `A` checks whether the second character is A.
- `%` represents zero or more remaining characters.

## New Concept: Underscore (_) Wildcard

The underscore wildcard represents exactly one character.

Examples:

| Pattern | Meaning |
|---|---|
| `_A%` | Second character is A |
| `A_%` | First character is A |
| `__A%` | Third character is A |
| `____` | Exactly four characters |

## Key Concepts

- SELECT
- WHERE
- LIKE Operator
- Underscore (_) Wildcard
- Percentage (%) Wildcard

---


### Q22) Display the names of employees whose names are exactly five characters in length.

## Problem Description

Retrieve employee names that contain exactly five characters.

## Solution

### Method 1: Using LENGTH()

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    LENGTH(ename) = 5;
```

### Method 2: Using LIKE Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE '_____';
```

## Explanation

Method 1:
- `LENGTH()` returns the number of characters in a string.
- `LENGTH(ename) = 5` selects names containing exactly five characters.

Method 2:
- `LIKE` performs pattern matching.
- Each underscore (`_`) represents exactly one character.
- Five underscores (`_____`) match names containing exactly five characters.

## New Concept: LENGTH() Function

The `LENGTH()` function calculates the length of a string.

Syntax:

```sql
LENGTH(column_name)
```

Example:

```sql
SELECT
    LENGTH('SMITH') AS Name_Length;
```

Output: `5`

## Key Concepts

- SELECT
- WHERE
- LENGTH() Function
- LIKE Operator
- Underscore (_) Wildcard

---

### Q23) Display the names of employees who are not working as managers.

## Problem Description

Retrieve the names of employees who are not working as managers.

## Solution

### Method 1: Using != Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job != 'MANAGER';
```

### Method 2: Using <> Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job <> 'MANAGER';
```

### Method 3: Using NOT IN Operator

```sql
SELECT
    e.ename AS Employee_Name
FROM
    emp e
WHERE
    e.emp_no NOT IN (
        SELECT
            mgr
        FROM
            emp
        WHERE
            mgr IS NOT NULL
    );
```

### Method 4: Using LEFT JOIN

```sql
SELECT
    e.ename AS Employee_Name
FROM
    emp e
LEFT JOIN
    emp s
ON
    e.emp_no = s.mgr
WHERE
    s.emp_no IS NULL;
```

## Explanation

### Method 1 and Method 2: Not Equal Operators

- `!=` means not equal to.
- `<>` also means not equal to.
- Both exclude employees whose job title is MANAGER.

### Method 3: NOT IN Operator

- The inner query retrieves manager employee numbers from the `mgr` column.
- `NOT IN` excludes those employee numbers from the outer query.
- `mgr IS NOT NULL` prevents NULL values from affecting the `NOT IN` condition.

### Method 4: LEFT JOIN

- `e` represents employees.
- `s` represents employees who report to a manager.
- The join matches an employee's employee number with another employee's manager number.
- `s.emp_no IS NULL` identifies employees who are not referenced as a manager.

## New Concepts

### 1. Not Equal Operators (!= and <>)

These operators retrieve records where two values are different.

### 2. NOT IN Operator

`NOT IN` checks whether a value does not exist in the result returned by a subquery or in a specified list.

### 3. Subquery (Inner Query)

A subquery is a query written inside another SQL query.

### 4. Self Join

A Self Join joins a table with itself using different table aliases.

### 5. LEFT JOIN

Returns all records from the left table and matching records from the right table.

### 6. IS NULL

Checks whether a column contains a NULL value.

## Key Concepts

- WHERE Clause
- Not Equal Operators (!= and <>)
- NOT IN Operator
- Subquery
- Self Join
- LEFT JOIN
- IS NULL

---


### Q24) Display employee names who are not working as SALESMAN, CLERK, or ANALYST.

## Problem Description

Retrieve employee names whose job titles are not SALESMAN, CLERK, or ANALYST.

## Solution

### Method 1: Using NOT IN

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job NOT IN ('SALESMAN', 'CLERK', 'ANALYST');
```

### Method 2: Using AND with !=

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job != 'SALESMAN'
    AND job != 'CLERK'
    AND job != 'ANALYST';
```

### Method 3: Using AND with <>

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job <> 'SALESMAN'
    AND job <> 'CLERK'
    AND job <> 'ANALYST';
```

### Method 4: Using NOT with IN

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE NOT (
    job IN ('SALESMAN', 'CLERK', 'ANALYST')
);
```

### Method 5: Using CASE Expression

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    CASE
        WHEN job IN ('SALESMAN', 'CLERK', 'ANALYST') THEN 0
        ELSE 1
    END = 1;
```

## Explanation

All five methods exclude employees whose job title is SALESMAN, CLERK, or ANALYST.

- `NOT IN` excludes multiple values.
- `AND` combines multiple conditions that must all be true.
- `!=` and `<>` mean not equal to.
- `NOT` reverses a condition.
- `CASE` evaluates conditions and returns a result.

## New Concepts

### 1. NOT IN Operator

Excludes multiple specified values.

### 2. AND Operator

Requires all specified conditions to be true.

### 3. NOT Operator

Reverses a Boolean condition.

### 4. CASE Expression

Evaluates conditions and returns a value based on the matching condition.

## Key Concepts

- SELECT
- WHERE
- NOT IN
- AND
- NOT
- Not Equal Operators (!= and <>)
- CASE Expression

---

### Q25) Display all rows from EMP table. The system should wait after every screen full of information.

## Problem Description

Display all employee records and retrieve the results page by page instead of displaying all records at once.

## Solution

### Method 1: Using SELECT *

```sql
SELECT
    *
FROM
    emp;
```

### Method 2: Using LIMIT and OFFSET

First Page:

```sql
SELECT
    *
FROM
    emp
LIMIT 10 OFFSET 0;
```

Second Page:

```sql
SELECT
    *
FROM
    emp
LIMIT 10 OFFSET 10;
```

Third Page:

```sql
SELECT
    *
FROM
    emp
LIMIT 10 OFFSET 20;
```

## Explanation

- `SELECT *` retrieves all columns and records.
- `LIMIT 10` retrieves a maximum of 10 records.
- `OFFSET 0` starts from the first record.
- `OFFSET 10` skips the first 10 records.
- `OFFSET 20` skips the first 20 records.

## New Concept: LIMIT and OFFSET

`LIMIT` controls how many records are returned.

`OFFSET` controls how many records are skipped before returning results.

Syntax:

```sql
SELECT
    *
FROM
    table_name
LIMIT number_of_rows OFFSET number_of_rows_to_skip;
```

## Key Concepts

- SELECT Statement
- LIMIT
- OFFSET
- Pagination

---



### Q26) Display the total number of employees working in the company.

## Problem Description

Write an SQL query to display the total number of employees working in the company.

Table: `emp`

## Solution

```sql
SELECT
    COUNT(*) AS Total_Employees
FROM
    emp;
```

## Explanation

- `COUNT(*)` counts all rows in the employee table.
- `emp` is the employee table.
- `AS Total_Employees` assigns a meaningful name to the result column.

## Example Output

| Total_Employees |
|---:|
| 14 |

Note: The output is just an example. The actual count depends on the table data.

## New Concept: COUNT()

`COUNT()` is an aggregate function used to count rows or non-NULL values.

Examples:

```sql
-- Count all employee records
SELECT COUNT(*) FROM emp;

-- Count employees with a non-NULL salary
SELECT COUNT(sal) FROM emp;

-- Count unique job titles
SELECT COUNT(DISTINCT job) FROM emp;
```

## Key Concepts

- `COUNT(*)` – Counts all rows.
- `COUNT(column_name)` – Counts non-NULL values.
- `COUNT(DISTINCT column_name)` – Counts unique non-NULL values.

---



### Q27) Display the total salary being paid to all employees.

## Problem Description

Write an SQL query to calculate the total salary paid to all employees, including their commission.

Table: `emp`

Columns:
- `sal` – Employee Salary
- `com` – Employee Commission

## Solution

```sql
SELECT
    SUM(sal + COALESCE(com, 0)) AS Total_Salary
FROM
    emp;
```

## Explanation

- `SUM()` adds the calculated salary amounts of all employees.
- `sal` represents the employee's basic salary.
- `COALESCE(com, 0)` replaces NULL commission values with 0.
- `sal + COALESCE(com, 0)` calculates the salary including commission.
- `AS Total_Salary` gives a meaningful name to the output column.

## New Concept: SUM()

`SUM()` is an aggregate function used to calculate the total of numeric values in a column or expression.

Example:

```sql
-- Calculate the total basic salary
SELECT SUM(sal) FROM emp;

-- Calculate the total salary including commission
SELECT SUM(sal + COALESCE(com, 0)) FROM emp;
```

## New Concept: COALESCE()

`COALESCE()` returns the first non-NULL value from the given arguments.

Example:

```sql
SELECT COALESCE(NULL, 0);
```

Output:

```text
0
```

It helps prevent NULL commission values from making the salary calculation NULL.

## Key Concepts

- `SUM()` – Calculates the total of numeric values.
- `COALESCE()` – Replaces NULL with a specified value.
- `NULL` – Represents a missing or unknown value.
- `AS` – Assigns an alias to a column.

---



### Q28) Display the maximum salary from the EMP table.

## Problem Description

Write an SQL query to display the highest salary paid to an employee from the `emp` table.

Table: `emp`

Column:
- `sal` – Employee Salary

## Solution

```sql
SELECT
    MAX(sal) AS Maximum_Salary
FROM
    emp;
```

## Explanation

- `MAX()` is an aggregate function used to find the highest value.
- `sal` represents the employee's salary.
- `AS Maximum_Salary` assigns a meaningful name to the output column.

## Example Output

| Maximum_Salary |
|---:|
| 5000 |

Note: The output is just an example. Your actual result depends on the employee records.

## New Concept: MAX()

`MAX()` returns the maximum value from a column or expression.

Example:

```sql
-- Find the maximum salary
SELECT MAX(sal) FROM emp;

-- Find the maximum commission
SELECT MAX(com) FROM emp;
```

## Key Concepts

- `MAX()` – Returns the highest value.
- Aggregate Function – Performs a calculation on multiple rows and returns a single result.
- `AS` – Assigns an alias to a column.

---




### Q29) Display the minimum salary from the EMP table.

## Problem Description

Write an SQL query to display the lowest salary paid to an employee from the `emp` table.

Table: `emp`

Column:
- `sal` – Employee Salary

## Solution

```sql
SELECT
    MIN(sal) AS Minimum_Salary
FROM
    emp;
```

## Explanation

- `MIN()` finds the smallest salary value.
- `sal` represents the employee's salary.
- `AS Minimum_Salary` assigns a meaningful name to the output column.

## Example Output

| Minimum_Salary |
|---:|
| 800 |

Note: The output is only an example. The actual result depends on your employee records.

## New Concept: MIN()

`MIN()` is an aggregate function used to find the smallest value in a column.

Examples:

```sql
-- Find the minimum salary
SELECT MIN(sal) FROM emp;

-- Find the minimum commission
SELECT MIN(com) FROM emp;
```

## Key Concepts

- `MIN()` – Returns the smallest value.
- Aggregate Function – Performs a calculation across multiple rows and returns a single result.
- `AS` – Assigns an alias to a column.

---




### Q30) Display the average salary from the EMP table.

## Problem Description

Write an SQL query to display the average salary of employees working in the company.

Table: `emp`

Column:
- `sal` – Employee Salary

## Solution

```sql
SELECT
    AVG(sal) AS Average_Salary
FROM
    emp;
```

## Explanation

- `AVG()` calculates the average salary.
- `sal` represents the employee's salary.
- `AS Average_Salary` assigns a meaningful name to the output column.

## Example Output

| Average_Salary |
|---:|
| 2073.21 |

Note: This is an example value. The actual result depends on your employee records.

## New Concept: AVG()

`AVG()` is an aggregate function used to calculate the average of numeric values.

Formula:

Average = Sum of Values / Number of Non-NULL Values

Examples:

```sql
-- Calculate average salary
SELECT AVG(sal) FROM emp;

-- Calculate average commission
SELECT AVG(com) FROM emp;
```

Note: `AVG()` ignores NULL values when calculating the average.

## Key Concepts

- `AVG()` – Calculates the average of numeric values.
- Aggregate Function – Performs calculations across multiple rows.
- `NULL` – Represents a missing or unknown value.
- `AS` – Assigns an alias to a column.

---




### Q31) Display the maximum salary being paid to CLERK.

## Problem Description

Write an SQL query to display the highest salary paid to employees working as CLERK.

Table: `emp`

Columns:
- `sal` – Employee Salary
- `job` – Employee Job Title

## Solution

```sql
SELECT
    MAX(sal) AS Maximum_Salary
FROM
    emp
WHERE
    job = 'CLERK';
```

## Explanation

- `MAX(sal)` finds the highest salary.
- `FROM emp` selects records from the employee table.
- `WHERE job = 'CLERK'` filters employees working as clerks.
- `AS Maximum_Salary` assigns a meaningful name to the result column.

## Example Output

| Maximum_Salary |
|---:|
| 1300 |

Note: This is an example value. The actual result depends on your employee records.

## New Concept: MAX() with WHERE

`MAX()` can be combined with the `WHERE` clause to find the highest value among records that satisfy a condition.

Example:

```sql
-- Maximum salary of SALESMAN
SELECT MAX(sal)
FROM emp
WHERE job = 'SALESMAN';

-- Maximum salary of MANAGER
SELECT MAX(sal)
FROM emp
WHERE job = 'MANAGER';
```

## Key Concepts

- `MAX()` – Returns the highest value.
- `WHERE` – Filters records based on a condition.
- `=` – Checks whether two values are equal.
- Aggregate Function – Performs calculations across multiple rows.

---




### Q32) Display the maximum salary being paid in department number 20.

## Problem Description

Write an SQL query to display the highest salary paid to employees working in department number 20.

Table: `emp`

Columns:
- `sal` – Employee Salary
- `dept` – Department Number

## Solution

```sql
SELECT
    MAX(sal) AS Maximum_Salary
FROM
    emp
WHERE
    dept = 20;
```

## Explanation

- `MAX(sal)` finds the highest salary.
- `FROM emp` selects records from the employee table.
- `WHERE dept = 20` filters employees belonging to department 20.
- `AS Maximum_Salary` assigns a meaningful name to the result column.

## Example Output

| Maximum_Salary |
|---:|
| 3000 |

Note: This is an example value. The actual result depends on your employee records.

## New Concept: MAX() with WHERE

`MAX()` can be combined with `WHERE` to find the highest value among records that satisfy a condition.

Example:

```sql
-- Maximum salary in department 10
SELECT MAX(sal)
FROM emp
WHERE dept = 10;

-- Maximum salary in department 20
SELECT MAX(sal)
FROM emp
WHERE dept = 20;
```

## Key Concepts

- `MAX()` – Returns the highest value.
- `WHERE` – Filters records based on a condition.
- `=` – Checks whether two values are equal.
- Aggregate Function – Performs calculations across multiple rows.

---




### Q33) Display the minimum salary being paid to any SALESMAN.

## Problem Description

Write an SQL query to display the lowest salary paid to employees working as SALESMAN.

Table: `emp`

Columns:
- `sal` – Employee Salary
- `job` – Employee Job Title

## Solution

```sql
SELECT
    MIN(sal) AS Minimum_Salary
FROM
    emp
WHERE
    job = 'SALESMAN';
```

## Explanation

- `MIN(sal)` finds the lowest salary.
- `FROM emp` selects records from the employee table.
- `WHERE job = 'SALESMAN'` filters employees working as salesmen.
- `AS Minimum_Salary` assigns a meaningful name to the result column.

## Example Output

| Minimum_Salary |
|---:|
| 1250 |

Note: This is an example value. The actual result depends on your employee records.

## New Concept: MIN() with WHERE

`MIN()` can be combined with `WHERE` to find the smallest value among records that satisfy a condition.

Example:

```sql
-- Minimum salary of CLERK
SELECT MIN(sal)
FROM emp
WHERE job = 'CLERK';

-- Minimum salary of SALESMAN
SELECT MIN(sal)
FROM emp
WHERE job = 'SALESMAN';
```

## Key Concepts

- `MIN()` – Returns the smallest value.
- `WHERE` – Filters records based on a condition.
- `=` – Checks whether two values are equal.
- Aggregate Function – Performs calculations across multiple rows.

---




### Q34) Display the average salary drawn by managers.

## Problem Description

Write an SQL query to calculate the average salary earned by employees working as MANAGER.

Table: `emp`

Columns:
- `sal` – Employee Salary
- `job` – Employee Job Title

## Solution

```sql
SELECT
    AVG(sal) AS Average_Salary
FROM
    emp
WHERE
    job = 'MANAGER';
```

## Explanation

- `AVG(sal)` calculates the average salary.
- `FROM emp` selects records from the employee table.
- `WHERE job = 'MANAGER'` filters employees working as managers.
- `AS Average_Salary` assigns a meaningful name to the result column.

## Example Output

| Average_Salary |
|---:|
| 2758.33 |

Note: This is an example value. The actual result depends on your employee records.

## New Concept: AVG() with WHERE

`AVG()` can be combined with `WHERE` to calculate the average of values that satisfy a particular condition.

Examples:

```sql
-- Average salary of CLERK
SELECT AVG(sal)
FROM emp
WHERE job = 'CLERK';

-- Average salary of MANAGER
SELECT AVG(sal)
FROM emp
WHERE job = 'MANAGER';
```

## Key Concepts

- `AVG()` – Calculates the average of numeric values.
- `WHERE` – Filters records based on a condition.
- `=` – Checks whether two values are equal.
- Aggregate Function – Performs calculations across multiple rows.

---




### Q35) Display the total salary drawn by analysts working in department number 40.

## Problem Description

Write an SQL query to calculate the total salary, including commission, earned by analysts working in department number 40.

Table: `emp`

Columns:
- `sal` – Employee Salary
- `com` – Employee Commission
- `job` – Employee Job Title
- `dept` – Department Number

## Solution

```sql
SELECT
    SUM(sal + COALESCE(com, 0)) AS Total_Salary
FROM
    emp
WHERE
    job = 'ANALYST'
    AND dept = 40;
```

## Explanation

- `SUM()` calculates the total salary.
- `sal` represents the employee's basic salary.
- `COALESCE(com, 0)` replaces NULL commission with 0.
- `WHERE job = 'ANALYST'` filters employees working as analysts.
- `AND dept = 40` filters employees belonging to department 40.

## Example Output

| Total_Salary |
|---:|
| 6000 |

Note: This is an example value. The actual result depends on your employee records.

## New Concept: SUM() with Multiple Conditions

`SUM()` can be combined with `WHERE` and `AND` to calculate totals for records that satisfy multiple conditions.

Example:

```sql
-- Total salary of clerks in department 10
SELECT SUM(sal)
FROM emp
WHERE job = 'CLERK'
AND dept = 10;

-- Total salary of analysts in department 40
SELECT SUM(sal)
FROM emp
WHERE job = 'ANALYST'
AND dept = 40;
```

## Key Concepts

- `SUM()` – Calculates the total of numeric values.
- `COALESCE()` – Replaces NULL with a specified value.
- `WHERE` – Filters records based on a condition.
- `AND` – Requires both conditions to be true.
- `=` – Checks whether two values are equal.

---




### Q36) Display the names of employees in order of salary, with the lowest salary first.

## Problem Description

Write an SQL query to display employee names and their salaries in ascending order of salary.

Table: `emp`

Columns:
- `ename` – Employee Name
- `sal` – Employee Salary

## Solution

```sql
SELECT
    ename AS Employee_Name,
    sal AS Salary
FROM
    emp
ORDER BY
    sal ASC;
```

## Explanation

- `ename` displays the employee name.
- `sal` displays the employee salary.
- `ORDER BY sal` sorts the employee records based on salary.
- `ASC` arranges salaries from lowest to highest.

## Example Output

| Employee_Name | Salary |
|---|---:|
| SMITH | 800 |
| JAMES | 950 |
| ADAMS | 1100 |
| WARD | 1250 |
| SCOTT | 3000 |

Note: Example output only.

## New Concept: ORDER BY

`ORDER BY` is used to sort records based on one or more columns.

### Ascending Order (ASC)

Displays values from lowest to highest.

```sql
SELECT ename, sal
FROM emp
ORDER BY sal ASC;
```

### Descending Order (DESC)

Displays values from highest to lowest.

```sql
SELECT ename, sal
FROM emp
ORDER BY sal DESC;
```

Note: `ASC` is the default sorting order in MySQL if no direction is specified.

## Key Concepts

- `ORDER BY` – Sorts query results.
- `ASC` – Sorts values in ascending order.
- `DESC` – Sorts values in descending order.
- Sorting – Arranges records in a specific order.

---




### Q37) Display the names of employees in descending order of salary.

## Problem Description

Write an SQL query to display employee names and their salaries in descending order of salary, with the highest salary appearing first.

Table: `emp`

Columns:
- `ename` – Employee Name
- `sal` – Employee Salary

## Solution

```sql
SELECT
    ename AS Employee_Name,
    sal AS Salary
FROM
    emp
ORDER BY
    sal DESC;
```

## Explanation

- `ename` displays the employee name.
- `sal` displays the employee salary.
- `ORDER BY sal` sorts employee records based on salary.
- `DESC` arranges salaries from highest to lowest.

## Example Output

| Employee_Name | Salary |
|---|---:|
| KING | 5000 |
| SCOTT | 3000 |
| FORD | 3000 |
| JONES | 2975 |
| ALLEN | 1600 |

Note: Example output only.

## New Concept: ORDER BY DESC

`DESC` is used with `ORDER BY` to sort records in descending order.

Example:

```sql
-- Highest salary first
SELECT ename, sal
FROM emp
ORDER BY sal DESC;

-- Lowest salary first
SELECT ename, sal
FROM emp
ORDER BY sal ASC;
```

## Key Concepts

- `ORDER BY` – Sorts query results.
- `DESC` – Sorts values from highest to lowest.
- `ASC` – Sorts values from lowest to highest.
- Sorting – Arranges records in a specific order.

---




### Q38) Display the details from EMP table in order of employee name.

## Problem Description

Write an SQL query to display all employee details in alphabetical order of employee names.

Table: `emp`

Column:
- `ename` – Employee Name

## Solution

```sql
SELECT
    *
FROM
    emp
ORDER BY
    ename ASC;
```

## Explanation

- `SELECT *` displays all columns from the employee table.
- `FROM emp` retrieves records from the `emp` table.
- `ORDER BY ename` sorts records based on employee names.
- `ASC` arranges employee names alphabetically from A to Z.

## New Concept: ORDER BY with Character Columns

`ORDER BY` can sort character columns alphabetically.

Example:

```sql
-- Alphabetical order (A to Z)
SELECT *
FROM emp
ORDER BY ename ASC;

-- Reverse alphabetical order (Z to A)
SELECT *
FROM emp
ORDER BY ename DESC;
```

## Key Concepts

- `SELECT *` – Displays all columns.
- `ORDER BY` – Sorts query results.
- `ASC` – Sorts in ascending order.
- `DESC` – Sorts in descending order.
- Alphabetical Sorting – Arranges names from A to Z.
- For Descending Alphabetical order is Z to A

---



### Q39) Display the details from EMP table in descending order of employee name.

## Problem Description

Write an SQL query to display all employee details in reverse alphabetical order of employee names (Z to A).

Table: `emp`

Column:
- `ename` – Employee Name

## Solution

```sql
SELECT
    *
FROM
    emp
ORDER BY
    ename DESC;
```

## Explanation

- `SELECT *` displays all columns from the employee table.
- `FROM emp` retrieves records from the `emp` table.
- `ORDER BY ename` sorts records based on employee names.
- `DESC` arranges names in descending alphabetical order (Z to A).

## New Concept: ORDER BY DESC

`DESC` is used with `ORDER BY` to sort records in descending order.

Example:

```sql
-- Reverse alphabetical order (Z to A)
SELECT *
FROM emp
ORDER BY ename DESC;

-- Alphabetical order (A to Z)
SELECT *
FROM emp
ORDER BY ename ASC;
```

## Key Concepts

- `ORDER BY` – Sorts query results.
- `DESC` – Sorts in descending order.
- `ASC` – Sorts in ascending order.
- Alphabetical Sorting – Arranges names alphabetically.

---



### Q40) Display empno, ename, deptno, and sal. Sort the output first based on name, within name by deptno, and within deptno by sal.

## Problem Description

Write an SQL query to display employee number, employee name, department number, and salary.

Sort the output using three levels:
1. Employee name in ascending order.
2. Department number within employee name.
3. Salary within department number.

Table: `emp`

Columns:
- `emp_no` – Employee Number
- `ename` – Employee Name
- `dept` – Department Number
- `sal` – Employee Salary

## Solution

```sql
SELECT
    emp_no,
    ename,
    dept,
    sal
FROM
    emp
ORDER BY
    ename ASC,
    dept ASC,
    sal ASC;
```

## Explanation

- `SELECT` specifies the four columns to display.
- `FROM emp` retrieves records from the employee table.
- `ORDER BY ename ASC` sorts employee names alphabetically.
- `dept ASC` sorts department numbers when employee names are equal.
- `sal ASC` sorts salaries when both employee names and department numbers are equal.

## New Concept: Multiple Column Sorting

Multiple column sorting means arranging records using more than one column.

MySQL sorts records from left to right according to the columns specified in `ORDER BY`.

Example:

```sql
-- Sort by employee name, then department, then salary
SELECT
    emp_no,
    ename,
    dept,
    sal
FROM
    emp
ORDER BY
    ename ASC,
    dept ASC,
    sal ASC;
```

## Key Concepts

- `ORDER BY` – Sorts query results.
- `ASC` – Sorts values in ascending order.
- `DESC` – Sorts values in descending order.
- Multiple Column Sorting – Sorts records using multiple columns.
- Sorting Priority – MySQL applies sorting from left to right.

---



### Q41) Display the name of the employee along with their annual salary (Sal * 12). The employee earning the highest annual salary should appear first.

## Problem Description

Write an SQL query to display employee names along with their annual salaries.

Calculate annual salary by multiplying monthly salary by 12.

Sort the result from highest annual salary to lowest annual salary.

Table: `emp`

Columns:
- `ename` – Employee Name
- `sal` – Employee Salary

## Solution

```sql
SELECT
    ename AS Employee_Name,
    (sal * 12) AS Annual_Salary
FROM
    emp
ORDER BY
    Annual_Salary DESC;
```

## Explanation

- `ename` displays the employee name.
- `sal * 12` calculates the annual salary.
- `AS Annual_Salary` assigns a meaningful name to the calculated column.
- `ORDER BY Annual_Salary DESC` sorts employees from highest annual salary to lowest annual salary.

## Example Output

| Employee_Name | Annual_Salary |
|---|---:|
| KING | 60000 |
| SCOTT | 36000 |
| FORD | 36000 |
| JONES | 35700 |
| ALLEN | 19200 |

Note: Example output only.

## New Concept: Calculated Columns

A calculated column is created by performing an arithmetic operation on existing columns.

Example:

```sql
-- Calculate annual salary
SELECT
    ename,
    sal * 12 AS Annual_Salary
FROM emp;
```

## New Concept: ORDER BY with Alias

In MySQL, you can use a column alias in the `ORDER BY` clause.

Example:

```sql
SELECT
    ename,
    sal * 12 AS Annual_Salary
FROM emp
ORDER BY Annual_Salary DESC;
```

## Key Concepts

- Arithmetic Operations – Perform calculations using operators such as `*`, `+`, and `-`.
- Calculated Column – Creates a result using existing column values.
- `AS` – Assigns an alias to a column.
- `ORDER BY` – Sorts query results.
- `DESC` – Sorts values from highest to lowest.

---



### Q42) Display Employee Name, Salary, HRA, PF, DA, and Total Salary

## Problem Description

Write a SQL query to display the employee name, salary, HRA, PF, DA, and total salary for each employee.

Calculation requirements:

- HRA = 15% of Salary
- PF = 5% of Salary
- DA = 10% of Salary
- Total Salary = Salary + HRA + DA - PF

Display employees in descending order of Total Salary (highest first).

## Solution

```sql
SELECT
    ename AS Employee_Name,
    sal AS Salary,
    sal * 0.15 AS HRA,
    sal * 0.05 AS PF,
    sal * 0.10 AS DA,
    sal + (sal * 0.15) + (sal * 0.10) - (sal * 0.05) AS Total_Salary
FROM
    emp
ORDER BY
    Total_Salary DESC;
```

## Explanation

1. `ename AS Employee_Name` – Displays the employee name with a readable column heading.
2. `sal AS Salary` – Displays the employee's basic salary.
3. `sal * 0.15` – Calculates HRA as 15% of salary.
4. `sal * 0.05` – Calculates PF as 5% of salary.
5. `sal * 0.10` – Calculates DA as 10% of salary.
6. `Total_Salary` – Adds salary, HRA, and DA, then subtracts PF.
7. `ORDER BY Total_Salary DESC` – Sorts employees from highest to lowest total salary.

## New Concept

### 1. Percentage Calculation

To calculate a percentage in SQL, multiply the value by the percentage divided by 100.

Examples:

```sql
sal * 0.15  -- 15%
sal * 0.05  -- 5%
sal * 0.10  -- 10%
```

### 2. Calculated Columns

SQL allows mathematical expressions in the `SELECT` statement to calculate values dynamically.

### 3. Column Aliases

`AS` assigns a readable name to a calculated column.

Example:

```sql
sal * 0.15 AS HRA
```

### 4. ORDER BY with Alias

You can use a column alias in `ORDER BY` to sort the calculated result.

```sql
ORDER BY Total_Salary DESC;
```

## Key Concepts

- SELECT
- Mathematical Operators (+, -, *)
- Percentage Calculation
- Column Aliases (AS)
- Calculated Columns
- ORDER BY
- DESC

---



### Q43) Display Department Numbers and Total Number of Employees Within Each Department

## Problem Description

Write a SQL query to display each department number along with the total number of employees working in that department.

## Solution 1: Using GROUP BY

```sql
SELECT
    dept AS Department_Number,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    dept;
```

## Solution 2: Using GROUP BY with ORDER BY

```sql
SELECT
    dept AS Department_Number,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    dept
ORDER BY
    dept ASC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Department_Number,
    Total_Employees
FROM
    (
        SELECT
            dept AS Department_Number,
            COUNT(*) AS Total_Employees
        FROM
            emp
        GROUP BY
            dept
    ) AS Department_Employee_Count;
```

## Explanation

1. `SELECT dept` – Displays the department number.
2. `COUNT(*)` – Counts all employee records in each department group.
3. `GROUP BY dept` – Groups employees based on their department number.
4. `ORDER BY dept ASC` – Sorts the department numbers in ascending order.
5. The subquery first calculates employee counts by department, and the outer query displays those results.

## New Concept

### 1. GROUP BY

`GROUP BY` combines rows that have the same value in a specified column into groups.

Example:

```sql
SELECT
    dept,
    COUNT(*)
FROM
    emp
GROUP BY
    dept;
```

### 2. COUNT()

`COUNT(*)` returns the total number of rows in each group.

### 3. ORDER BY

`ORDER BY` sorts the result.

- `ASC` – Ascending order.
- `DESC` – Descending order.

### 4. Subquery

A subquery is a query written inside another SQL query. The inner query executes to produce results that the outer query can use.

## Key Concepts

- SELECT
- COUNT()
- GROUP BY
- ORDER BY
- ASC
- Subquery
- Column Aliases (AS)

---



### Q44) Display Different Job Titles and Total Number of Employees in Each Job Group

## Problem Description

Write a SQL query to display the different job titles along with the total number of employees working in each job group.

## Solution 1: Using GROUP BY

```sql
SELECT
    job AS Job_Title,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    job;
```

## Solution 2: Using GROUP BY with ORDER BY

```sql
SELECT
    job AS Job_Title,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    job
ORDER BY
    job ASC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Job_Title,
    Total_Employees
FROM
    (
        SELECT
            job AS Job_Title,
            COUNT(*) AS Total_Employees
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Employee_Count;
```

## Solution 4: Using a Derived Table with ORDER BY

```sql
SELECT
    Job_Title,
    Total_Employees
FROM
    (
        SELECT
            job AS Job_Title,
            COUNT(*) AS Total_Employees
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Employee_Count
ORDER BY
    Job_Title ASC;
```

## Explanation

1. `job AS Job_Title` – Displays the employee's job title with a readable column name.
2. `COUNT(*)` – Counts the total number of employees in each job group.
3. `GROUP BY job` – Groups employees who have the same job title.
4. `ORDER BY job ASC` – Sorts job titles alphabetically.
5. The subquery first calculates the employee count for each job title. The outer query displays the calculated results.

## New Concept

### 1. GROUP BY

`GROUP BY` combines rows with the same value into groups.

Example:

```sql
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job;
```

### 2. COUNT()

`COUNT(*)` counts all rows within each group.

### 3. Subquery

A subquery is a query written inside another query. It allows the outer query to use the result of the inner query.

### 4. Derived Table

A derived table is a subquery used in the `FROM` clause. It acts like a temporary table for the outer query.

### 5. ORDER BY

`ORDER BY` sorts the final result.

- `ASC` – Ascending order.
- `DESC` – Descending order.

## Key Concepts

- SELECT
- COUNT()
- GROUP BY
- ORDER BY
- ASC
- Subquery
- Derived Table
- Column Aliases (AS)

---



### Q45) Display Department Numbers and Total Salary for Each Department

## Problem Description

Write a SQL query to display each department number along with the total salary paid to all employees working in that department.

## Solution 1: Using GROUP BY

```sql
SELECT
    dept AS Department_Number,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    dept;
```

## Solution 2: Using GROUP BY with ORDER BY

```sql
SELECT
    dept AS Department_Number,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    dept
ORDER BY
    dept ASC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Department_Number,
    Total_Salary
FROM
    (
        SELECT
            dept AS Department_Number,
            SUM(sal) AS Total_Salary
        FROM
            emp
        GROUP BY
            dept
    ) AS Department_Salary;
```

## Solution 4: Using a Subquery with ORDER BY

```sql
SELECT
    Department_Number,
    Total_Salary
FROM
    (
        SELECT
            dept AS Department_Number,
            SUM(sal) AS Total_Salary
        FROM
            emp
        GROUP BY
            dept
    ) AS Department_Salary
ORDER BY
    Total_Salary DESC;
```

## Explanation

1. `dept AS Department_Number` – Displays the department number.
2. `SUM(sal)` – Calculates the total salary of employees in each department.
3. `GROUP BY dept` – Groups employees according to their department number.
4. `ORDER BY dept ASC` – Sorts department numbers in ascending order.
5. `ORDER BY Total_Salary DESC` – Sorts departments from highest total salary to lowest.
6. The subquery calculates the department-wise salary totals, and the outer query displays the results.

## New Concept

### 1. SUM()

`SUM()` is an aggregate function that calculates the total of numeric values.

Example:

```sql
SELECT SUM(sal)
FROM emp;
```

### 2. GROUP BY with SUM()

You can combine `GROUP BY` and `SUM()` to calculate totals separately for each group.

Example:

```sql
SELECT
    dept,
    SUM(sal)
FROM
    emp
GROUP BY
    dept;
```

### 3. Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single result per group.

Common aggregate functions:

- `COUNT()` – Counts rows.
- `SUM()` – Calculates the total.
- `AVG()` – Calculates the average.
- `MAX()` – Finds the maximum value.
- `MIN()` – Finds the minimum value.

### 4. Subquery and Derived Table

A subquery is a query inside another query. When used in the `FROM` clause, it creates a derived table that the outer query can read.

## Key Concepts

- SELECT
- SUM()
- GROUP BY
- ORDER BY
- ASC
- DESC
- Aggregate Functions
- Subquery
- Derived Table
- Column Aliases (AS)

---



### Q46) Display Different Jobs and Total Salary for Each Job

## Problem Description

Write a SQL query to display the different job titles along with the total salary paid to employees working in each job.

## Solution 1: Using GROUP BY

```sql
SELECT
    job AS Job_Title,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    job;
```

## Solution 2: Using GROUP BY with ORDER BY

```sql
SELECT
    job AS Job_Title,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    job
ORDER BY
    job ASC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Job_Title,
    Total_Salary
FROM
    (
        SELECT
            job AS Job_Title,
            SUM(sal) AS Total_Salary
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Salary;
```

## Solution 4: Using a Subquery with ORDER BY

```sql
SELECT
    Job_Title,
    Total_Salary
FROM
    (
        SELECT
            job AS Job_Title,
            SUM(sal) AS Total_Salary
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Salary
ORDER BY
    Total_Salary DESC;
```

## Explanation

1. `job AS Job_Title` – Displays the employee's job title with a readable column name.
2. `SUM(sal)` – Calculates the total salary paid to employees in each job group.
3. `GROUP BY job` – Groups employees who have the same job title.
4. `ORDER BY job ASC` – Sorts job titles alphabetically.
5. `ORDER BY Total_Salary DESC` – Sorts job groups from highest total salary to lowest.
6. The subquery calculates the total salary for each job, and the outer query displays the result.

## New Concept

### 1. SUM()

`SUM()` is an aggregate function used to calculate the total of numeric values.

Example:

```sql
SELECT SUM(sal)
FROM emp;
```

### 2. GROUP BY with SUM()

Combining `GROUP BY` and `SUM()` calculates totals separately for each group.

Example:

```sql
SELECT
    job,
    SUM(sal)
FROM
    emp
GROUP BY
    job;
```

### 3. Aggregate Functions

Aggregate functions perform calculations on multiple rows.

- `COUNT()` – Counts rows.
- `SUM()` – Calculates the total.
- `AVG()` – Calculates the average.
- `MAX()` – Finds the maximum value.
- `MIN()` – Finds the minimum value.

### 4. Subquery and Derived Table

A subquery is a query inside another query. When used in the `FROM` clause, it creates a derived table that the outer query can use.

## Key Concepts

- SELECT
- SUM()
- GROUP BY
- ORDER BY
- ASC
- DESC
- Aggregate Functions
- Subquery
- Derived Table
- Column Aliases (AS)

---




### Q47) Display Each Job Along with the Minimum Salary in Each Job Group

## Problem Description

Write a SQL query to display each job title along with the minimum salary paid to employees working in that job group.

## Solution 1: Using GROUP BY

```sql
SELECT
    job AS Job_Title,
    MIN(sal) AS Minimum_Salary
FROM
    emp
GROUP BY
    job;
```

## Solution 2: Using GROUP BY with ORDER BY

```sql
SELECT
    job AS Job_Title,
    MIN(sal) AS Minimum_Salary
FROM
    emp
GROUP BY
    job
ORDER BY
    Minimum_Salary ASC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Job_Title,
    Minimum_Salary
FROM
    (
        SELECT
            job AS Job_Title,
            MIN(sal) AS Minimum_Salary
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Minimum_Salary;
```

## Solution 4: Using a Subquery with ORDER BY

```sql
SELECT
    Job_Title,
    Minimum_Salary
FROM
    (
        SELECT
            job AS Job_Title,
            MIN(sal) AS Minimum_Salary
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Minimum_Salary
ORDER BY
    Minimum_Salary ASC;
```

## Explanation

1. `job AS Job_Title` – Displays the employee's job title.
2. `MIN(sal)` – Finds the lowest salary in each job group.
3. `GROUP BY job` – Groups employees who have the same job title.
4. `ORDER BY Minimum_Salary ASC` – Sorts job groups from the lowest minimum salary to the highest.
5. The subquery calculates the minimum salary for each job group, and the outer query displays the results.

## New Concept

### 1. MIN()

`MIN()` is an aggregate function that returns the smallest value from a column.

Example:

```sql
SELECT MIN(sal)
FROM emp;
```

### 2. MIN() with GROUP BY

Combining `MIN()` with `GROUP BY` finds the minimum value separately for each group.

Example:

```sql
SELECT
    job,
    MIN(sal)
FROM
    emp
GROUP BY
    job;
```

### 3. Aggregate Functions

Aggregate functions perform calculations on multiple rows.

- `COUNT()` – Counts rows.
- `SUM()` – Calculates the total.
- `AVG()` – Calculates the average.
- `MAX()` – Finds the maximum value.
- `MIN()` – Finds the minimum value.

### 4. Subquery and Derived Table

A subquery is a query inside another query. When used in the `FROM` clause, it creates a derived table that the outer query can use.

## Key Concepts

- SELECT
- MIN()
- GROUP BY
- ORDER BY
- ASC
- Aggregate Functions
- Subquery
- Derived Table
- Column Aliases (AS)

---




### Q48) Display Department Numbers Having More Than Three Employees in Each Department

## Problem Description

Write a SQL query to display department numbers along with the total number of employees in each department.

Display only those departments that have more than three employees.

## Solution 1: Using GROUP BY and HAVING

```sql
SELECT
    dept AS Department_Number,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    dept
HAVING
    COUNT(*) > 3;
```

## Solution 2: Using GROUP BY, HAVING and ORDER BY

```sql
SELECT
    dept AS Department_Number,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    dept
HAVING
    COUNT(*) > 3
ORDER BY
    dept ASC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Department_Number,
    Total_Employees
FROM
    (
        SELECT
            dept AS Department_Number,
            COUNT(*) AS Total_Employees
        FROM
            emp
        GROUP BY
            dept
    ) AS Department_Employee_Count
WHERE
    Total_Employees > 3;
```

## Solution 4: Using a CTE

```sql
WITH Department_Employee_Count AS
(
    SELECT
        dept AS Department_Number,
        COUNT(*) AS Total_Employees
    FROM
        emp
    GROUP BY
        dept
)
SELECT
    Department_Number,
    Total_Employees
FROM
    Department_Employee_Count
WHERE
    Total_Employees > 3;
```

## Explanation

1. `dept AS Department_Number` – Displays the department number.
2. `COUNT(*)` – Counts the total employees in each department.
3. `GROUP BY dept` – Groups employees according to department number.
4. `HAVING COUNT(*) > 3` – Displays only departments having more than three employees.
5. `ORDER BY dept ASC` – Sorts department numbers in ascending order.
6. The subquery and CTE solutions first calculate employee counts and then filter the results using `WHERE`.

## New Concept

### 1. HAVING Clause

`HAVING` is used to filter groups created by the `GROUP BY` clause.

Example:

```sql
SELECT
    dept,
    COUNT(*)
FROM
    emp
GROUP BY
    dept
HAVING
    COUNT(*) > 3;
```

### 2. Difference Between WHERE and HAVING

| WHERE | HAVING |
|---|---|
| Filters individual rows | Filters groups |
| Executes before GROUP BY | Executes after GROUP BY |
| Generally filters normal columns | Commonly filters aggregate results |

### 3. Subquery

A subquery is a query written inside another SQL query. It allows the outer query to use the result of the inner query.

### 4. CTE (Common Table Expression)

A CTE is a temporary named result set created using the `WITH` clause. It makes complex queries easier to read and maintain.

## Key Concepts

- SELECT
- COUNT()
- GROUP BY
- HAVING
- WHERE
- ORDER BY
- Subquery
- CTE (WITH Clause)
- Aggregate Functions

---



### Q49) Display Different Jobs Along with Total Salary Greater Than 40000

## Problem Description

Write a SQL query to display different job titles along with the total salary paid to employees in each job group.

Display only those job groups where the total salary is greater than 40000.

## Solution 1: Using GROUP BY and HAVING

```sql
SELECT
    job AS Job_Title,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    job
HAVING
    SUM(sal) > 40000;
```

## Solution 2: Using GROUP BY, HAVING and ORDER BY

```sql
SELECT
    job AS Job_Title,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    job
HAVING
    SUM(sal) > 40000
ORDER BY
    Total_Salary DESC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Job_Title,
    Total_Salary
FROM
    (
        SELECT
            job AS Job_Title,
            SUM(sal) AS Total_Salary
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Salary
WHERE
    Total_Salary > 40000;
```

## Solution 4: Using a CTE

```sql
WITH Job_Salary AS
(
    SELECT
        job AS Job_Title,
        SUM(sal) AS Total_Salary
    FROM
        emp
    GROUP BY
        job
)
SELECT
    Job_Title,
    Total_Salary
FROM
    Job_Salary
WHERE
    Total_Salary > 40000;
```

## Explanation

1. `job AS Job_Title` – Displays the employee's job title.
2. `SUM(sal)` – Calculates the total salary for each job group.
3. `GROUP BY job` – Groups employees according to their job title.
4. `HAVING SUM(sal) > 40000` – Displays only job groups whose total salary exceeds 40000.
5. `ORDER BY Total_Salary DESC` – Sorts the job groups from highest total salary to lowest.
6. The subquery and CTE calculate job-wise salary totals first, then filter those results using `WHERE`.

## Reason: Why Do We Use HAVING Instead of WHERE?

We use `HAVING` instead of `WHERE` because we need to filter the result of an aggregate function (`SUM(sal)`) after grouping.

### 1. WHERE Clause

`WHERE` filters individual employee records before grouping.

Example:

```sql
SELECT
    job,
    sal
FROM
    emp
WHERE
    sal > 3000;
```

Here, SQL checks each employee's salary individually and returns employees earning more than 3000.

### 2. HAVING Clause

`HAVING` filters grouped results after the `GROUP BY` operation.

Example:

```sql
SELECT
    job,
    SUM(sal) AS Total_Salary
FROM
    emp
GROUP BY
    job
HAVING
    SUM(sal) > 40000;
```

Here:
- First, employees are grouped by job.
- Then, `SUM(sal)` calculates the total salary for each job.
- Finally, `HAVING` displays only job groups with total salary greater than 40000.

### 3. Can We Use WHERE and HAVING Together?

Yes, both can be used in the same query.

```sql
SELECT
    job,
    SUM(sal) AS Total_Salary
FROM
    emp
WHERE
    sal > 2000
GROUP BY
    job
HAVING
    SUM(sal) > 40000;
```

- `WHERE sal > 2000` – Filters individual employees before grouping.
- `GROUP BY job` – Groups employees by job title.
- `HAVING SUM(sal) > 40000` – Filters job groups based on total salary.

### 4. Difference Between WHERE and HAVING

| WHERE | HAVING |
|---|---|
| Filters individual rows | Filters groups |
| Executes before GROUP BY | Executes after GROUP BY |
| Cannot directly filter aggregate results at the same query level | Can filter aggregate results |
| Commonly used with normal columns | Commonly used with aggregate functions |

### 5. SQL Logical Execution Order

Remember this logical execution order:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

This is why `WHERE` cannot directly filter the grouped result of `SUM(sal)`, while `HAVING` can.

## New Concept

### 1. HAVING with SUM()

`HAVING` filters grouped results based on aggregate calculations.

### 2. Comparison Operator (>)

The greater-than operator checks whether a value exceeds a specified number.

### 3. CTE (Common Table Expression)

A CTE is a named temporary result set created using the `WITH` clause. It helps organize complex queries into readable sections.

## Key Concepts

- SELECT
- SUM()
- GROUP BY
- HAVING
- WHERE
- ORDER BY
- Comparison Operator (>)
- Subquery
- CTE (WITH Clause)
- Aggregate Functions
- SQL Logical Execution Order

---



### Q50) Display Different Jobs Along with Total Number of Employees in Each Job Group Having More Than Three Employees

## Problem Description

Write a SQL query to display different job titles along with the total number of employees working in each job group.

Display only those job groups that have more than three employees.

## Solution 1: Using GROUP BY and HAVING

```sql
SELECT
    job AS Job_Title,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(*) > 3;
```

## Solution 2: Using GROUP BY, HAVING and ORDER BY

```sql
SELECT
    job AS Job_Title,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(*) > 3
ORDER BY
    Total_Employees DESC;
```

## Solution 3: Using a Subquery

```sql
SELECT
    Job_Title,
    Total_Employees
FROM
    (
        SELECT
            job AS Job_Title,
            COUNT(*) AS Total_Employees
        FROM
            emp
        GROUP BY
            job
    ) AS Job_Employee_Count
WHERE
    Total_Employees > 3;
```

## Solution 4: Using a CTE

```sql
WITH Job_Employee_Count AS
(
    SELECT
        job AS Job_Title,
        COUNT(*) AS Total_Employees
    FROM
        emp
    GROUP BY
        job
)
SELECT
    Job_Title,
    Total_Employees
FROM
    Job_Employee_Count
WHERE
    Total_Employees > 3;
```

## Explanation

1. `job AS Job_Title` – Displays the employee's job title with a readable column name.
2. `COUNT(*)` – Counts the total number of employees in each job group.
3. `GROUP BY job` – Groups employees according to their job title.
4. `HAVING COUNT(*) > 3` – Displays only job groups having more than three employees.
5. `ORDER BY Total_Employees DESC` – Sorts job groups from the highest employee count to the lowest.
6. The subquery and CTE calculate employee counts first, then filter the results using `WHERE`.

## Reason: Why Do We Use HAVING Instead of WHERE?

We use `HAVING` instead of `WHERE` because `COUNT(*)` is an aggregate function, and we need to filter the grouped results.

### 1. WHERE Clause

`WHERE` filters individual employee records before grouping.

Example:

```sql
SELECT
    job,
    ename
FROM
    emp
WHERE
    job = 'CLERK';
```

This returns individual employees whose job is CLERK.

### 2. HAVING Clause

`HAVING` filters groups after the `GROUP BY` operation.

Example:

```sql
SELECT
    job,
    COUNT(*) AS Total_Employees
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(*) > 3;
```

This returns only job groups containing more than three employees.

### 3. Can We Use WHERE and HAVING Together?

Yes. Both clauses can be used in the same query.

```sql
SELECT
    job,
    COUNT(*) AS Total_Employees
FROM
    emp
WHERE
    sal > 2000
GROUP BY
    job
HAVING
    COUNT(*) > 3;
```

- `WHERE sal > 2000` – Filters individual employees before grouping.
- `GROUP BY job` – Groups employees according to their job title.
- `HAVING COUNT(*) > 3` – Displays only groups containing more than three qualifying employees.

### 4. Difference Between WHERE and HAVING

| WHERE | HAVING |
|---|---|
| Filters individual rows | Filters groups |
| Executes before GROUP BY | Executes after GROUP BY |
| Filters individual column values | Commonly filters aggregate results |
| Cannot directly filter aggregate results at the same query level | Can filter COUNT(), SUM(), AVG(), etc. |

### 5. SQL Logical Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

## New Concept

### 1. COUNT()

`COUNT(*)` counts all rows in a table or within each group.

### 2. HAVING with COUNT()

`HAVING` can filter groups based on the result of `COUNT()`.

Example:

```sql
HAVING COUNT(*) > 3;
```

### 3. Comparison Operator (>)

The greater-than operator checks whether a value is greater than a specified number.

### 4. Subquery

A subquery is a query written inside another SQL query.

### 5. CTE (Common Table Expression)

A CTE is a named temporary result set created using the `WITH` clause.

## Key Concepts

- SELECT
- COUNT()
- GROUP BY
- HAVING
- WHERE
- ORDER BY
- Comparison Operator (>)
- Subquery
- CTE (WITH Clause)
- Aggregate Functions
- SQL Logical Execution Order

---




### Q51) Display the Name of the Employee Who Earns the Highest Salary

## Problem Description

Write a SQL query to display the name of the employee who earns the highest salary in the company.

If multiple employees earn the same highest salary, display all of their names.

## Solution 1: Using a Subquery

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    sal = (
        SELECT
            MAX(sal)
        FROM
            emp
    );
```

## Solution 2: Using ORDER BY and LIMIT

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
ORDER BY
    sal DESC
LIMIT 1;
```

Note: This returns only one employee. If multiple employees share the highest salary, it does not guarantee that all of them will be displayed.

## Solution 3: Using a CTE

```sql
WITH Maximum_Salary AS
(
    SELECT
        MAX(sal) AS Highest_Salary
    FROM
        emp
)
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    sal = (
        SELECT
            Highest_Salary
        FROM
            Maximum_Salary
    );
```

## Solution 4: Using JOIN with a Subquery

```sql
SELECT
    e.ename AS Employee_Name
FROM
    emp e
INNER JOIN
    (
        SELECT
            MAX(sal) AS Highest_Salary
        FROM
            emp
    ) AS m
ON
    e.sal = m.Highest_Salary;
```

## Explanation

1. `MAX(sal)` – Finds the highest salary from the employee table.
2. The inner query calculates the maximum salary.
3. `WHERE sal = (...)` – Matches employee salaries with the highest salary returned by the subquery.
4. `ORDER BY sal DESC` – Sorts employees from highest salary to lowest.
5. `LIMIT 1` – Returns only the first row.
6. The CTE stores the highest salary in a named result set.
7. The JOIN solution matches employees with the maximum salary.

## Reason: Why Don't We Use MAX() Directly in WHERE?

We cannot directly write the following query:

```sql
SELECT
    ename
FROM
    emp
WHERE
    sal = MAX(sal);
```

The reason is that `MAX()` is an aggregate function. It calculates a result across multiple rows, whereas `WHERE` filters individual rows.

To solve this, we use a subquery to calculate the maximum salary first.

Correct approach:

```sql
SELECT
    ename
FROM
    emp
WHERE
    sal = (
        SELECT MAX(sal)
        FROM emp
    );
```

The inner query finds the highest salary, and the outer query finds employees earning that salary.

## New Concept

### 1. MAX()

`MAX()` is an aggregate function that returns the highest value from a column.

Example:

```sql
SELECT MAX(sal)
FROM emp;
```

### 2. Subquery

A subquery is a query written inside another SQL query.

In this example, the inner query finds the highest salary, and the outer query displays the matching employee names.

### 3. ORDER BY DESC

`ORDER BY DESC` sorts records from highest to lowest.

```sql
ORDER BY sal DESC;
```

### 4. LIMIT

`LIMIT` restricts the number of rows returned by a query.

```sql
LIMIT 1;
```

It returns only one row.

### 5. CTE (Common Table Expression)

A CTE is a named temporary result set created using the `WITH` clause.

### 6. JOIN with Subquery

A subquery can be used as a temporary table and joined with another table to match records.

## Key Concepts

- SELECT
- MAX()
- WHERE
- Subquery
- ORDER BY
- DESC
- LIMIT
- CTE (WITH Clause)
- INNER JOIN
- Aggregate Functions

---



### Q52) Display the employee number and name of the employee working as CLERK and earning the highest salary among all CLERKS.

## Problem Description

Write a SQL query to display the employee number and employee name of the employee who earns the highest salary among employees working as CLERK.

Table: `emp`

Required Columns:
- `emp_no` – Employee Number
- `ename` – Employee Name
- `job` – Job Title
- `sal` – Salary

## Solution 1: Using ORDER BY and LIMIT

```sql
SELECT
    emp_no AS Employee_Number,
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'CLERK'
ORDER BY
    sal DESC
LIMIT 1;
```

## Solution 2: Using Subquery with MAX()

```sql
SELECT
    emp_no AS Employee_Number,
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'CLERK'
AND
    sal = (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'CLERK'
    );
```

## Explanation

### Solution 1: ORDER BY and LIMIT

1. `WHERE job = 'CLERK'` filters employees working as clerks.
2. `ORDER BY sal DESC` sorts their salaries from highest to lowest.
3. `LIMIT 1` returns only the employee with the highest salary.

### Solution 2: Subquery with MAX()

1. The inner query finds the maximum salary among clerks using `MAX(sal)`.
2. The inner query filters records using `WHERE job = 'CLERK'`.
3. The outer query selects employees whose job is CLERK.
4. The `AND` condition matches their salary with the maximum clerk salary.
5. The final result displays the employee number and employee name.

## New Concept

### 1. MAX()

The `MAX()` function returns the highest value from a column.

```sql
SELECT MAX(sal)
FROM emp;
```

### 2. ORDER BY DESC

Sorts records in descending order, from highest to lowest.

```sql
SELECT *
FROM emp
ORDER BY sal DESC;
```

### 3. LIMIT

Restricts the number of rows returned by a query.

```sql
SELECT *
FROM emp
LIMIT 1;
```

### 4. Subquery

A subquery is a query written inside another SQL query.

Here, the inner query calculates the highest salary among clerks, and the outer query retrieves the matching employee details.

## Key Concepts

- WHERE
- AND
- MAX()
- ORDER BY
- DESC
- LIMIT
- Subquery
- Aggregate Functions

## Important Note

- `ORDER BY sal DESC LIMIT 1` returns only one employee, even if multiple clerks share the highest salary.
- The `MAX()` subquery solution returns all employees who share the highest clerk salary.
- Always apply `WHERE job = 'CLERK'` inside the subquery so that the maximum salary is calculated only among clerks.

---


### Q53) Display the names of salesmen who earn a salary greater than the highest salary earned by any clerk.

## Problem Description

Write a SQL query to display the names of employees working as SALESMAN whose salary is greater than the highest salary earned by any employee working as CLERK.

Table: `emp`

Required Columns:
- `ename` – Employee Name
- `job` – Job Title
- `sal` – Salary

## Solution 1: Using Subquery with MAX()

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'SALESMAN'
AND
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'CLERK'
    );
```

## Solution 2: Using CTE

```sql
WITH Highest_Clerk_Salary AS (
    SELECT
        MAX(sal) AS Maximum_Salary
    FROM
        emp
    WHERE
        job = 'CLERK'
)
SELECT
    e.ename AS Employee_Name
FROM
    emp e
CROSS JOIN
    Highest_Clerk_Salary h
WHERE
    e.job = 'SALESMAN'
AND
    e.sal > h.Maximum_Salary;
```

## Solution 3: Using ALL Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'SALESMAN'
AND
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'CLERK'
    );
```

## Explanation

### Solution 1: Subquery with MAX()

1. The inner query executes first.
2. `MAX(sal)` finds the highest salary among employees working as CLERK.
3. The outer query filters employees working as SALESMAN.
4. The `AND` condition checks whether the salesman's salary is greater than the highest clerk salary.
5. Finally, the employee names satisfying both conditions are displayed.

### Solution 2: Using CTE

1. The CTE calculates the highest clerk salary.
2. `CROSS JOIN` combines the CTE result with employee records.
3. The `WHERE` clause filters salesmen.
4. The salary comparison returns salesmen earning more than the maximum clerk salary.

### Solution 3: Using ALL Operator

1. The inner query retrieves all clerk salaries.
2. `ALL` checks whether the salesman's salary is greater than every salary returned by the subquery.
3. Only salesmen satisfying this condition are displayed.

## New Concept

### 1. MAX()

Returns the highest value from a column.

```sql
SELECT MAX(sal)
FROM emp
WHERE job = 'CLERK';
```

### 2. ALL Operator

The `ALL` operator compares a value against every value returned by a subquery.

```sql
SELECT ename
FROM emp
WHERE sal > ALL (
    SELECT sal
    FROM emp
    WHERE job = 'CLERK'
);
```

### 3. CTE (Common Table Expression)

A CTE creates a temporary named result using the `WITH` keyword. It can be referenced by the main query.

```sql
WITH Highest_Salary AS (
    SELECT MAX(sal) AS Maximum_Salary
    FROM emp
)
SELECT *
FROM Highest_Salary;
```

### 4. CROSS JOIN

Combines every row from the first table or result with every row from the second table or result.

## Key Concepts

- WHERE
- AND
- MAX()
- Greater Than (`>`)
- Subquery
- ALL Operator
- CTE
- WITH
- CROSS JOIN

## Important Note

The main subquery solution uses `MAX(sal)` to find the highest clerk salary. The `ALL` solution checks the salesman's salary against every clerk salary.

All three solutions are equivalent when the clerk subquery returns at least one non-NULL salary. If there are no clerks, the `MAX()` approach returns NULL and the `ALL` approach over an empty result behaves differently.

Recommended solution: Solution 1, because it is simple, readable, and directly solves the problem.

---


### Q54) Display the names of employees working as CLERK whose salary is greater than the salary of JAMES but less than the salary of SCOTT.

## Problem Description

Write a SQL query to display the names of employees working as CLERK whose salary is greater than JAMES's salary but less than SCOTT's salary.

Table: `emp`

Required Columns:
- `ename` – Employee Name
- `job` – Job Title
- `sal` – Salary

## Solution 1: Using Subqueries with Comparison Operators

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'CLERK'
AND
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JAMES'
    )
AND
    sal < (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'SCOTT'
    );
```

## Solution 2: Using BETWEEN with Subqueries

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job = 'CLERK'
AND
    sal BETWEEN
        (SELECT sal FROM emp WHERE ename = 'JAMES')
    AND
        (SELECT sal FROM emp WHERE ename = 'SCOTT');
```

## Explanation

### Solution 1: Using Subqueries

1. The first subquery finds the salary of JAMES.
2. The second subquery finds the salary of SCOTT.
3. `WHERE job = 'CLERK'` filters employees working as clerks.
4. `sal >` checks whether the clerk's salary is greater than JAMES's salary.
5. `sal <` checks whether the clerk's salary is less than SCOTT's salary.
6. The final result displays the names of employees satisfying all three conditions.

### Solution 2: Using BETWEEN

1. The first subquery retrieves JAMES's salary.
2. The second subquery retrieves SCOTT's salary.
3. `BETWEEN` checks whether the clerk's salary falls within the specified salary range.

Important: `BETWEEN` includes both boundary values, while the original question requires strictly greater than and strictly less than.

## New Concept

### 1. Comparison Operators

Comparison operators compare two values.

| Operator | Meaning |
|---|---|
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal to |
| `<=` | Less than or equal to |
| `=` | Equal to |
| `!=` or `<>` | Not equal to |

### 2. Subquery

A subquery is a query written inside another SQL query.

Here, two subqueries are used:
- One retrieves JAMES's salary.
- Another retrieves SCOTT's salary.

### 3. BETWEEN Operator

The `BETWEEN` operator checks whether a value falls within a specified range. Both boundary values are included.

```sql
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;
```

This includes salaries of 1000 and 3000.

## Key Concepts

- WHERE
- AND
- Comparison Operators
- Greater Than (`>`)
- Less Than (`<`)
- BETWEEN
- Subquery
- Scalar Subquery

## Important Note

Use Solution 1 for this question because it uses strict greater-than and less-than conditions.

The `BETWEEN` solution is not exactly equivalent because it includes the boundary salaries.

---


### Q55) Display the names of employees whose salary is greater than the salary of JAMES or greater than the salary of SCOTT.

## Problem Description

Write a SQL query to display the names of employees whose salary is greater than JAMES's salary or greater than SCOTT's salary.

Table: `emp`

Required Columns:
- `ename` – Employee Name
- `sal` – Salary

## Solution 1: Using Subqueries with OR Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JAMES'
    )
OR
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'SCOTT'
    );
```

## Solution 2: Using ANY Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename IN ('JAMES', 'SCOTT')
    );
```

## Explanation

### Solution 1: Using Subqueries with OR

1. The first subquery retrieves the salary of JAMES.
2. The second subquery retrieves the salary of SCOTT.
3. The first condition checks whether an employee earns more than JAMES.
4. The `OR` operator checks whether an employee earns more than SCOTT.
5. If either condition is true, the employee's name is displayed.

### Solution 2: Using ANY Operator

1. The inner query retrieves the salaries of JAMES and SCOTT.
2. The `ANY` operator compares an employee's salary against the returned salaries.
3. The condition `sal > ANY (...)` is true if the employee earns more than at least one of those salaries.

## New Concept

### 1. OR Operator

The `OR` operator returns records when at least one condition is true.

```sql
SELECT *
FROM emp
WHERE job = 'CLERK'
OR job = 'SALESMAN';
```

### 2. ANY Operator

The `ANY` operator compares a value with any value returned by a subquery.

```sql
SELECT *
FROM emp
WHERE sal > ANY (
    SELECT sal
    FROM emp
    WHERE job = 'CLERK'
);
```

It returns employees whose salary is greater than at least one clerk's salary.

### 3. IN Operator

The `IN` operator checks whether a value matches any value in a given list.

```sql
SELECT *
FROM emp
WHERE ename IN ('JAMES', 'SCOTT');
```

## Key Concepts

- WHERE
- OR
- Subquery
- ANY Operator
- IN Operator
- Comparison Operator (`>`)
- Scalar Subquery

## Important Note

The `OR` condition means an employee must earn more than JAMES or more than SCOTT.

The `ANY` solution provides equivalent logic when both employees exist and their salaries are non-NULL.

---

### Q56) Display the names of employees who earn the highest salary in their respective departments.

## Problem Description

Write a SQL query to display the names of employees who earn the highest salary in each department.

Table: `emp`

Required Columns:
- `ename` – Employee Name
- `dept` – Department Number
- `sal` – Salary

## Solution 1: Using Correlated Subquery

```sql
SELECT
    e.ename AS Employee_Name,
    e.dept AS Department_Number,
    e.sal AS Salary
FROM
    emp e
WHERE
    e.sal = (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            dept = e.dept
    );
```

## Solution 2: Using GROUP BY and IN

```sql
SELECT
    ename AS Employee_Name,
    dept AS Department_Number,
    sal AS Salary
FROM
    emp
WHERE
    (dept, sal) IN (
        SELECT
            dept,
            MAX(sal)
        FROM
            emp
        GROUP BY
            dept
    );
```

## Solution 3: Using JOIN with Subquery

```sql
SELECT
    e.ename AS Employee_Name,
    e.dept AS Department_Number,
    e.sal AS Salary
FROM
    emp e
INNER JOIN
    (
        SELECT
            dept,
            MAX(sal) AS Highest_Salary
        FROM
            emp
        GROUP BY
            dept
    ) AS d
ON
    e.dept = d.dept
AND
    e.sal = d.Highest_Salary;
```

## Explanation

### Solution 1: Correlated Subquery

1. The outer query selects employee details from the `emp` table.
2. The inner query calculates the maximum salary using `MAX(sal)`.
3. The condition `dept = e.dept` matches the inner query's department with the current employee's department.
4. The outer query compares the employee's salary with the maximum salary of their department.
5. Employees whose salaries match their department's maximum salary are displayed.

### Solution 2: GROUP BY and IN

1. The inner query groups employees by department.
2. `MAX(sal)` calculates the highest salary for each department.
3. The outer query uses `IN` to match the department and salary pairs.
4. Matching employees are displayed.

### Solution 3: JOIN with Subquery

1. The subquery calculates the highest salary for each department.
2. `GROUP BY dept` creates department-wise groups.
3. `INNER JOIN` combines the employee records with the department-wise maximum salary results.
4. The `ON` condition matches both department number and highest salary.
5. The final query displays employees earning the highest salary in their departments.

## New Concept

### 1. Correlated Subquery

A correlated subquery is a subquery that depends on the outer query.

It uses a column from the outer query to perform its calculation.

```sql
SELECT
    e.ename,
    e.dept,
    e.sal
FROM
    emp e
WHERE
    e.sal = (
        SELECT MAX(sal)
        FROM emp
        WHERE dept = e.dept
    );
```

Here, `e.dept` belongs to the outer query. The inner query uses it to calculate the maximum salary for the current employee's department.

### 2. GROUP BY

The `GROUP BY` clause groups rows that have the same value.

```sql
SELECT
    dept,
    MAX(sal)
FROM
    emp
GROUP BY
    dept;
```

This calculates the highest salary separately for each department.

### 3. IN Operator

The `IN` operator checks whether a value matches any value in a list or subquery result.

### 4. INNER JOIN

`INNER JOIN` combines matching records from two tables or query results based on a specified condition.

### 5. Composite Comparison

MySQL supports comparing multiple columns together.

```sql
WHERE (dept, sal) IN (
    SELECT dept, MAX(sal)
    FROM emp
    GROUP BY dept
);
```

Here, both the department number and salary must match.

## Key Concepts

- MAX()
- GROUP BY
- Correlated Subquery
- IN Operator
- INNER JOIN
- Subquery
- Table Aliases
- Composite Comparison

## Important Note

- A normal subquery can calculate the maximum salary for the entire company.
- A correlated subquery calculates the maximum salary for the current employee's department.
- The `IN` and `JOIN` solutions also match employees with their respective department's maximum salary.
- All three solutions return multiple employees if employees share the highest salary in a department.

Recommended solution: Solution 1, using a Correlated Subquery, because it clearly demonstrates how to calculate and compare values department-wise.

## 6. Remember This Important Concept

Whenever a question contains requirements such as:

- Highest salary in each department.
- Lowest salary in each department.
- Employees earning more than their department's average salary.
- Employees earning more than their manager.
- Employees earning more than the average salary of their job group.

A correlated subquery can be a useful approach.

### The Formula to Remember

```sql
SELECT *
FROM emp e
WHERE e.sal = (
    SELECT MAX(sal)
    FROM emp
    WHERE dept = e.dept
);
```

The inner query refers to `e.dept` from the outer query.

This makes the subquery correlated because it depends on the current employee's department from the outer query.


### Q57) Display the names of employees who earn the highest salaries in their respective job groups.

## Problem Description

Write a SQL query to display the employee names, job titles, and salaries of employees who earn the highest salary within their respective job groups.

For example:
- Find the highest salary among CLERK employees.
- Find the highest salary among SALESMAN employees.
- Find the highest salary among MANAGER employees.
- Display employees whose salary matches the highest salary in their job group.

## Solution 1: Using Correlated Subquery

```sql
SELECT
    e.ename AS Employee_Name,
    e.job AS Job_Title,
    e.sal AS Salary
FROM
    emp e
WHERE
    e.sal = (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = e.job
    );
```

## Explanation

1. The outer query selects the employee name, job title, and salary.
2. The inner query calculates the maximum salary using `MAX(sal)`.
3. The condition `job = e.job` finds the maximum salary for the current employee's job group.
4. The outer query compares each employee's salary with the maximum salary of their job group.
5. If both salaries match, that employee is displayed.

## Solution 2: Using JOIN with a Subquery

```sql
SELECT
    e.ename AS Employee_Name,
    e.job AS Job_Title,
    e.sal AS Salary
FROM
    emp e
INNER JOIN
    (
        SELECT
            job,
            MAX(sal) AS Highest_Salary
        FROM
            emp
        GROUP BY
            job
    ) AS j
ON
    e.job = j.job
AND
    e.sal = j.Highest_Salary;
```

### Explanation

1. The inner query groups employees by their job title.
2. `MAX(sal)` calculates the highest salary for each job group.
3. The subquery returns each job title along with its highest salary.
4. `INNER JOIN` matches the original employee records with these maximum salaries.
5. Only employees whose salary matches their job group's highest salary are displayed.

## Solution 3: Using CTE (Common Table Expression)

```sql
WITH Job_Group_Salary AS (
    SELECT
        job,
        MAX(sal) AS Highest_Salary
    FROM
        emp
    GROUP BY
        job
)
SELECT
    e.ename AS Employee_Name,
    e.job AS Job_Title,
    e.sal AS Salary
FROM
    emp e
INNER JOIN
    Job_Group_Salary j
ON
    e.job = j.job
AND
    e.sal = j.Highest_Salary;
```

## New Concept: Correlated Subquery

A correlated subquery is a subquery that depends on a value from the outer query.

In this question:

```sql
WHERE job = e.job
```

- `e.job` belongs to the outer query.
- `job` belongs to the inner query.
- The inner query uses the current employee's job title to calculate the highest salary for that job group.

Therefore, the inner query is correlated with the outer query.

## New Concept: GROUP BY

`GROUP BY` combines rows having the same value into groups.

Example:

```sql
SELECT
    job,
    MAX(sal) AS Highest_Salary
FROM
    emp
GROUP BY
    job;
```

This query calculates the highest salary separately for each job group.

## New Concept: JOIN with a Subquery

A subquery can be used as a temporary result set and joined with another table.

In this question:
- The subquery calculates the highest salary for each job group.
- The `INNER JOIN` matches employees with their respective job group's highest salary.

## Important Concept to Remember

When a question contains requirements such as:

- Highest salary in each job group.
- Lowest salary in each job group.
- Highest salary in each department.
- Employees earning more than the average salary of their job group.

A correlated subquery can be a useful approach.

### Formula to Remember

```sql
SELECT *
FROM emp e
WHERE e.sal = (
    SELECT MAX(sal)
    FROM emp
    WHERE job = e.job
);
```

The inner query refers to `e.job` from the outer query.

## Key Concepts

- `MAX()` – Returns the maximum value.
- `GROUP BY` – Groups rows having the same value.
- Correlated Subquery – A subquery that depends on the outer query.
- `INNER JOIN` – Combines matching records from two result sets.
- `CTE` – Creates a temporary named result set using `WITH`.

---


### Q58) Display the names of employees who are working in the ACCOUNTING department.

## Problem Description

Write a SQL query to display the names of employees who are working in the ACCOUNTING department.

Table: `Employee`

Columns:
- `Employee_Name` – Name of the employee.
- `Department` – Department name.

## Solution

```sql
SELECT
    Employee_Name
FROM
    Employee
WHERE
    Department = 'ACCOUNTING';
```

## Explanation

1. `SELECT Employee_Name` retrieves the employee names.
2. `FROM Employee` specifies the table from which data is retrieved.
3. `WHERE Department = 'ACCOUNTING'` filters employees who belong to the ACCOUNTING department.
4. Only the names of matching employees are displayed.

## New Concept: WHERE Clause with Text Values

The `WHERE` clause filters records based on a specified condition.

When comparing text values, use single quotation marks (`' '`).

Example:

```sql
SELECT
    Employee_Name
FROM
    Employee
WHERE
    Department = 'ACCOUNTING';
```

Here, SQL returns only employees whose department value is `ACCOUNTING`.

## Key Concepts

- `SELECT` – Retrieves specified columns.
- `FROM` – Specifies the table.
- `WHERE` – Filters records based on a condition.
- Single Quotes – Used for text values in SQL conditions.

---


### Q59) Display the names of employees who are working in CHICAGO.

## Problem Description

Write a SQL query to display the names of employees who are working in the department located in CHICAGO.

Tables:

1. `emp` – Contains employee information.
2. `dept` – Contains department information.

Important Columns:

| Table | Column | Description |
|---|---|---|
| emp | ename | Employee Name |
| emp | deptno | Department Number |
| dept | deptno | Department Number |
| dept | loc | Department Location |

## Solution 1: Using Subquery

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            loc = 'CHICAGO'
    );
```

## Explanation

This query contains two parts.

### 1. Inner Query

```sql
SELECT
    deptno
FROM
    dept
WHERE
    loc = 'CHICAGO';
```

- The inner query searches the `dept` table.
- `WHERE loc = 'CHICAGO'` finds the department located in CHICAGO.
- `SELECT deptno` returns the department number.

Example result:

| deptno |
|---:|
| 30 |

### 2. Outer Query

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    deptno = 30;
```

- The outer query searches the `emp` table.
- It finds employees whose department number matches the result of the inner query.
- Finally, it displays their names.

## Solution 2: Using IN Operator

```sql
SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    deptno IN (
        SELECT
            deptno
        FROM
            dept
        WHERE
            loc = 'CHICAGO'
    );
```

This approach is useful when the inner query can return multiple department numbers.

## Solution 3: Using INNER JOIN

```sql
SELECT
    e.ename AS Employee_Name
FROM
    emp e
INNER JOIN
    dept d
ON
    e.deptno = d.deptno
WHERE
    d.loc = 'CHICAGO';
```

### Explanation

1. `emp e` represents the Employee table.
2. `dept d` represents the Department table.
3. `INNER JOIN` connects the two tables.
4. `ON e.deptno = d.deptno` matches employees with their departments.
5. `WHERE d.loc = 'CHICAGO'` filters departments located in CHICAGO.

## New Concept: Subquery

A subquery is a query written inside another SQL query.

In this question:
- The inner query finds the department number of CHICAGO.
- The outer query uses that department number to find employee names.

## New Concept: Single-Row Subquery

A single-row subquery returns only one value.

Example:

```sql
WHERE deptno = (
    SELECT deptno
    FROM dept
    WHERE loc = 'CHICAGO'
);
```

The `=` operator expects the subquery to return one value.

If the inner query returns multiple department numbers, use `IN` instead of `=`.

## New Concept: IN Operator

The `IN` operator checks whether a value matches any value in a list or subquery result.

Example:

```sql
WHERE deptno IN (10, 20, 30);
```

It is useful when a subquery can return multiple rows.

## Important Concept to Remember

| Operator | Purpose |
|---|---|
| `=` | Used when a subquery returns one value |
| `IN` | Used when a subquery can return multiple values |

## Key Concepts

- `SELECT` – Retrieves specified columns.
- `WHERE` – Filters records based on a condition.
- `Subquery` – A query inside another query.
- `Single-Row Subquery` – Returns one value.
- `IN` – Checks against multiple possible values.
- `INNER JOIN` – Combines matching records from two tables.
- `ON` – Specifies the matching condition between tables.

---


### Q60) Display the job groups having total salary greater than the maximum salary earned by any manager.

## Problem Description

Write a SQL query to display the job groups whose total salary is greater than the highest individual salary earned by any employee working as a MANAGER.

Requirements:

1. Calculate the total salary for each job group.
2. Find the maximum salary among employees working as MANAGER.
3. Display only those job groups whose total salary is greater than the maximum manager salary.

## Solution 1: Using Subquery

```sql
SELECT
    Job_Title,
    SUM(Salary) AS Total_Salary
FROM
    Employee
GROUP BY
    Job_Title
HAVING
    SUM(Salary) > (
        SELECT
            MAX(Salary)
        FROM
            Employee
        WHERE
            Job_Title = 'MANAGER'
    );
```

## Explanation

This query contains two parts.

### 1. Inner Query – Find Maximum Manager Salary

```sql
SELECT
    MAX(Salary)
FROM
    Employee
WHERE
    Job_Title = 'MANAGER';
```

Explanation:

- `WHERE Job_Title = 'MANAGER'` filters only managers.
- `MAX(Salary)` finds the highest salary among managers.
- The inner query returns one value.

Example:

| Job_Title | Salary |
|---|---:|
| MANAGER | 5000 |
| MANAGER | 4000 |
| MANAGER | 2975 |

Result:

```sql
5000
```

### 2. Outer Query – Calculate Total Salary for Each Job Group

```sql
SELECT
    Job_Title,
    SUM(Salary) AS Total_Salary
FROM
    Employee
GROUP BY
    Job_Title;
```

Explanation:

- `GROUP BY Job_Title` creates separate groups for each job title.
- `SUM(Salary)` calculates the total salary for each job group.

### 3. HAVING – Compare Total Salary

```sql
HAVING
    SUM(Salary) > (
        SELECT MAX(Salary)
        FROM Employee
        WHERE Job_Title = 'MANAGER'
    );
```

The HAVING clause compares each job group's total salary with the maximum manager salary.

Only job groups whose total salary is greater than the maximum manager salary are displayed.

## Solution 2: Using CTE (Common Table Expression)

```sql
WITH Manager_Maximum_Salary AS (
    SELECT
        MAX(Salary) AS Maximum_Salary
    FROM
        Employee
    WHERE
        Job_Title = 'MANAGER'
)
SELECT
    e.Job_Title,
    SUM(e.Salary) AS Total_Salary
FROM
    Employee e
CROSS JOIN
    Manager_Maximum_Salary m
GROUP BY
    e.Job_Title,
    m.Maximum_Salary
HAVING
    SUM(e.Salary) > m.Maximum_Salary;
```

Explanation:

1. The CTE calculates the maximum salary among managers.
2. `CROSS JOIN` makes that single maximum salary available to each job group.
3. `GROUP BY` calculates the total salary for each job group.
4. `HAVING` filters groups whose total salary is greater than the manager's maximum salary.

## Solution 3: Using Derived Table

```sql
SELECT
    j.Job_Title,
    j.Total_Salary
FROM
    (
        SELECT
            Job_Title,
            SUM(Salary) AS Total_Salary
        FROM
            Employee
        GROUP BY
            Job_Title
    ) AS j
WHERE
    j.Total_Salary > (
        SELECT
            MAX(Salary)
        FROM
            Employee
        WHERE
            Job_Title = 'MANAGER'
    );
```

Explanation:

1. The inner derived table calculates the total salary for each job group.
2. The outer query compares each group's total salary with the maximum manager salary.
3. Only matching job groups are displayed.

## New Concept: Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single result for each group or for the entire result set.

| Function | Purpose |
|---|---|
| `SUM()` | Calculates the total |
| `MAX()` | Finds the maximum value |
| `MIN()` | Finds the minimum value |
| `AVG()` | Calculates the average |
| `COUNT()` | Counts rows |

## New Concept: GROUP BY with HAVING

`GROUP BY` creates groups based on a column, while `HAVING` filters those groups after aggregation.

Example:

```sql
SELECT
    Job_Title,
    SUM(Salary) AS Total_Salary
FROM
    Employee
GROUP BY
    Job_Title
HAVING
    SUM(Salary) > 40000;
```

This query displays job groups whose total salary is greater than 40000.

## New Concept: Subquery with MAX()

A subquery can calculate a value that is used for comparison in the outer query.

Example:

```sql
SELECT
    MAX(Salary)
FROM
    Employee
WHERE
    Job_Title = 'MANAGER';
```

Here, the subquery finds the highest salary among managers, which can then be compared with other values.

## Important Concept to Remember

When a question asks for:

- Total salary of each job group greater than the highest manager salary.
- Total employees in each department greater than a particular count.
- Average salary of each department greater than a specified amount.

Remember this general structure:

```sql
SELECT
    Group_Column,
    SUM(Amount_Column)
FROM
    Table_Name
GROUP BY
    Group_Column
HAVING
    SUM(Amount_Column) > (
        SELECT
            MAX(Amount_Column)
        FROM
            Table_Name
        WHERE
            Condition
    );
```

## WHERE vs HAVING

| WHERE | HAVING |
|---|---|
| Filters individual rows | Filters grouped results |
| Applied before GROUP BY | Applied after GROUP BY |
| Commonly used with row conditions | Commonly used with aggregate conditions |

## Key Concepts

- `SUM()` – Calculates total salary.
- `MAX()` – Finds the highest salary.
- `GROUP BY` – Groups employees by job title.
- `HAVING` – Filters grouped results.
- `Subquery` – A query inside another query.
- `CTE` – Creates a temporary named result set using WITH.
- `CROSS JOIN` – Combines every row from one result with every row from another result.
- `Derived Table` – A subquery used as a table in the FROM clause.

---


