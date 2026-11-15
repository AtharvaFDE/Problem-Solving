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

