-- Q1) Display the department information from the Department table.
--
-- Table: Department
--
-- Requirement:
-- Retrieve all columns and all records from the Department table.
--
-- Expected Output:
-- Display all department information.
--
-- Solution:

SELECT
    *
FROM
    Department;


-- Q2) Display the details of all employees.
--
-- Table: emp
--
-- Requirement:
-- Retrieve all columns and all records from the emp table.
--
-- Solution:

SELECT
    *
FROM
    emp;


-- Q3) Display the name and job for all employees.
--
-- Table: emp
--
-- Requirement:
-- Retrieve employee names and their job designations.
--
-- Solution:

SELECT
    ename,
    job
FROM
    emp;


-- Q4) Display the name and salary of all employees.
--
-- Table: emp
--
-- Requirement:
-- Retrieve employee names and their salaries.
--
-- Solution:

SELECT
    ename,
    sal
FROM
    emp;



-- Q5) Display employee number and total salary for each employee.
--
-- Table: emp
--
-- Requirement:
-- 1. Display employee number (emp_no).
-- 2. Calculate total salary using salary and commission.
-- 3. If commission is NULL, consider it as 0.
--
-- Solution:

SELECT
    emp_no,
    (sal + COALESCE(com, 0)) AS total_salary
FROM
    emp;



-- Q6) Display employee name and annual salary for all employees.
--
-- Table: emp
--
-- Requirement:
-- 1. Display employee name.
-- 2. Calculate annual salary (monthly salary + commission) * 12.
-- 3. Treat NULL commission as 0.
--
-- Solution:

SELECT
    ename,
    12 * (sal + COALESCE(com, 0)) AS Annual_salary
FROM
    emp;



-- Q7) Display the names of all employees who are working in department number 10.
--
-- Table: emp
--
-- Requirement:
-- Retrieve employee names whose department number is 10.
--
-- Solution:

SELECT
    ename
FROM
    emp
WHERE
    dept = 10;


-- Q8) Display the names of all employees working as clerks
-- and drawing a salary more than 3000.
--
-- Table: emp
--
-- Requirement:
-- 1. Retrieve employee names.
-- 2. Job designation must be CLERK.
-- 3. Salary must be greater than 3000.
--
-- Solution:

SELECT
    Employee_Name
FROM
    Employee
WHERE
    Job_Title = 'CLERK'
    AND Salary > 3000;



-- Q9) Display employee number and employee names
-- for employees who earn commission.
--
-- Table: Employee
--
-- Requirement:
-- 1. Display employee number.
-- 2. Display employee name.
-- 3. Retrieve only employees who receive commission.
--
-- Solution:

SELECT
    Employee_Number,
    Employee_Name
FROM
    Employee
WHERE
    Commission > 0;


-- Q10) Display the names of employees who do not earn any commission.
--
-- Table: Employee
--
-- Requirement:
-- 1. Display employee number and employee name.
-- 2. Include employees whose commission is 0 or NULL.
--
-- Solution:

SELECT
    Employee_Number,
    Employee_Name
FROM
    Employee
WHERE
    COALESCE(Commission, 0) = 0;

-- Q11) Display the names of employees who are working as clerk,
-- salesman or analyst and drawing a salary more than 3000.
--
-- Table: Employee
--
-- Requirement:
-- 1. Retrieve employee names.
-- 2. Job designation must be CLERK, SALESMAN or ANALYST.
-- 3. Salary must be greater than 3000.
--
-- Solution:

SELECT
    Employee_Name
FROM
    Employee
WHERE
    Job_Title IN ('CLERK', 'SALESMAN', 'ANALYST')
    AND Salary > 3000;



-- Q12) Display the names of employees who are working
-- in the company for the past 5 years.
--
-- Table: Employee
--
-- Requirement:
-- Retrieve employees who joined the company within the last 5 years.
--
-- Solution:

SELECT
    Employee_Name
FROM
    Employee
WHERE
    Hire_Date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);



-- Q13) Display the list of employees who joined the company
-- before 30th June 1990 or after 31st December 1990.
--
-- Table: Employee
--
-- Requirement:
-- 1. Retrieve all employee details.
-- 2. Include employees who joined before 30 June 1990.
-- 3. Include employees who joined after 31 December 1990.
--
-- Solution:

SELECT
    *
FROM
    Employee
WHERE
    Joining_Date < '1990-06-30'
    OR Joining_Date > '1990-12-31';



-- Q14) Display the current date.
--
-- Requirement:
-- Retrieve the current system date.
--
-- Solution:

SELECT
    CURDATE();


-- Q15) Display the list of users in your database using the log table.
--
-- Table: log
--
-- Requirement:
-- Retrieve the user information from the log table.
--
-- Solution:

SELECT
    Users
FROM
    Log;


-- Q16) Display the names of all tables from the current database user.
--
-- Requirement:
-- Retrieve all table names from the current database.
--
-- Solution:

SHOW TABLES;



-- Q17) Display the name of the current database user.
--
-- Requirement:
-- Retrieve the currently connected database username.
--
-- Solution:

SELECT
    USER();



-- Q18) Display the names of employees working in department number 10, 20, or 40,
-- or employees working as clerks, salesmen, or analysts.

-- Table: emp
-- Columns:
--   ename - Employee Name
--   dept  - Department Number
--   job   - Job Title

-- Requirement:
-- Retrieve employee names if they belong to department 10, 20, or 40
-- OR if their job title is CLERK, SALESMAN, or ANALYST.

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    dept IN (10, 20, 40)
    OR job IN ('CLERK', 'SALESMAN', 'ANALYST');



-- Q19) Display the names of employees whose name starts with alphabet S.

-- Table: emp
-- Column:
--   ename - Employee Name

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE 'S%';


-- Q20) Display the names of employees whose name ends with alphabet S.

-- Table: emp
-- Column:
--   ename - Employee Name

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE '%S';


-- Q21) Display the names of employees whose second alphabet is A.

-- Table: emp
-- Column:
--   ename - Employee Name

-- Requirement:
-- Retrieve employee names where the second character is A.

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE '_A%';



-- Q22) Display the names of employees whose names are exactly five characters in length.

-- Table: emp
-- Column:
--   ename - Employee Name

-- Method 1: Using LENGTH() Function

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    LENGTH(ename) = 5;


-- Method 2: Using LIKE Operator

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    ename LIKE '_____';




-- Q23) Display the names of employees who are not working as managers.

-- Table: emp
-- Columns:
--   emp_no - Employee Number
--   ename  - Employee Name
--   job    - Job Title
--   dept   - Department Number
--   mgr    - Manager's Employee Number

-- Method 1: Using != Operator

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job != 'MANAGER';


-- Method 2: Using <> Operator

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job <> 'MANAGER';


-- Method 3: Using NOT IN Operator
-- Find employees whose employee numbers are not listed
-- as managers in the employee table.

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


-- Method 4: Using LEFT JOIN
-- Find employees who are not referenced as a manager
-- by any other employee.

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





-- Q24) Display employee names who are not working as SALESMAN, CLERK, or ANALYST.

-- Method 1: Using NOT IN

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job NOT IN ('SALESMAN', 'CLERK', 'ANALYST');


-- Method 2: Using AND with !=

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job != 'SALESMAN'
    AND job != 'CLERK'
    AND job != 'ANALYST';


-- Method 3: Using AND with <>

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    job <> 'SALESMAN'
    AND job <> 'CLERK'
    AND job <> 'ANALYST';


-- Method 4: Using NOT with IN

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE NOT (
    job IN ('SALESMAN', 'CLERK', 'ANALYST')
);


-- Method 5: Using CASE Expression

SELECT
    ename AS Employee_Name
FROM
    emp
WHERE
    CASE
        WHEN job IN ('SALESMAN', 'CLERK', 'ANALYST') THEN 0
        ELSE 1
    END = 1;




-- Q25) Display all rows from EMP table.
-- The system should wait after every screen full of information.

-- Method 1: Display all employee records

SELECT
    *
FROM
    emp;


-- Method 2: Display records page by page using LIMIT.

-- First Page
SELECT
    *
FROM
    emp
LIMIT 10 OFFSET 0;

-- Second Page
SELECT
    *
FROM
    emp
LIMIT 10 OFFSET 10;

-- Third Page
SELECT
    *
FROM
    emp
LIMIT 10 OFFSET 20;



-- Q26) Display the total number of employees working in the company.

-- Table: emp
-- Column: Employee Details

-- Solution:

SELECT
    COUNT(*) AS Total_Employees
FROM
    emp;





-- Q27) Display the total salary being paid to all employees.

-- Table: emp
-- Columns:
-- sal = Employee Salary
-- com = Employee Commission

-- Requirement:
-- Calculate the total salary including commission for all employees.

-- Solution:

SELECT
    SUM(sal + COALESCE(com, 0)) AS Total_Salary
FROM
    emp;



-- Q28) Display the maximum salary from the EMP table.

-- Table: emp
-- Column: sal (Employee Salary)

-- Solution:

SELECT
    MAX(sal) AS Maximum_Salary
FROM
    emp;




-- Q29) Display the minimum salary from the EMP table.

-- Table: emp
-- Column: sal (Employee Salary)

-- Solution:

SELECT
    MIN(sal) AS Minimum_Salary
FROM
    emp;



-- Q30) Display the average salary from the EMP table.

-- Table: emp
-- Column: sal (Employee Salary)

-- Solution:

SELECT
    AVG(sal) AS Average_Salary
FROM
    emp;



-- Q31) Display the maximum salary being paid to CLERK.

-- Table: emp
-- Columns:
-- sal = Employee Salary
-- job = Employee Job Title

-- Solution:

SELECT
    MAX(sal) AS Maximum_Salary
FROM
    emp
WHERE
    job = 'CLERK';



-- Q32) Display the maximum salary being paid in department number 20.

-- Table: emp
-- Columns:
-- sal  = Employee Salary
-- dept = Department Number

-- Solution:

SELECT
    MAX(sal) AS Maximum_Salary
FROM
    emp
WHERE
    dept = 20;



-- Q33) Display the minimum salary being paid to any SALESMAN.

-- Table: emp
-- Columns:
-- sal = Employee Salary
-- job = Employee Job Title

-- Solution:

SELECT
    MIN(sal) AS Minimum_Salary
FROM
    emp
WHERE
    job = 'SALESMAN';



-- Q34) Display the average salary drawn by managers.

-- Table: emp
-- Columns:
-- sal = Employee Salary
-- job = Employee Job Title

-- Solution:

SELECT
    AVG(sal) AS Average_Salary
FROM
    emp
WHERE
    job = 'MANAGER';




-- Q35) Display the total salary drawn by analysts working in department number 40.

-- Table: emp
-- Columns:
-- sal  = Employee Salary
-- com  = Employee Commission
-- job  = Employee Job Title
-- dept = Department Number

-- Solution:

SELECT
    SUM(sal + COALESCE(com, 0)) AS Total_Salary
FROM
    emp
WHERE
    job = 'ANALYST'
    AND dept = 40;



-- Q36) Display the names of employees in order of salary.
-- The employee earning the lowest salary should appear first.

-- Table: emp
-- Columns:
-- ename = Employee Name
-- sal   = Employee Salary

-- Solution:

SELECT
    ename AS Employee_Name,
    sal AS Salary
FROM
    emp
ORDER BY
    sal ASC;



-- Q37) Display the names of employees in descending order of salary.
-- The employee earning the highest salary should appear first.

-- Table: emp
-- Columns:
-- ename = Employee Name
-- sal   = Employee Salary

-- Solution:

SELECT
    ename AS Employee_Name,
    sal AS Salary
FROM
    emp
ORDER BY
    sal DESC;



-- Q38) Display the details from EMP table in order of employee name.

-- Table: emp
-- Column:
-- ename = Employee Name

-- Requirement:
-- Display all employee details in alphabetical order of employee name.

-- Solution:

SELECT
    *
FROM
    emp
ORDER BY
    ename ASC;



-- Q39) Display the details from EMP table in descending order of employee name.
-- Names should appear from Z to A.

-- Table: emp
-- Column:
-- ename = Employee Name

-- Solution:

SELECT
    *
FROM
    emp
ORDER BY
    ename DESC;



-- Q40) Display employee number, employee name, department number, and salary.
-- Sort the output first by employee name,
-- within the name by department number,
-- and within the department by salary.

-- Table: emp
-- Columns:
-- emp_no = Employee Number
-- ename  = Employee Name
-- dept   = Department Number
-- sal    = Employee Salary

-- Solution:

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
