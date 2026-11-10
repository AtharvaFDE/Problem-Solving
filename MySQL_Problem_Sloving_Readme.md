# My SQL Problem Solving

## Problem

 ### Q1)  Query all columns for **American cities** in the `CITY` table with populations greater than **100000**.

The CountryCode for America is `USA`.

## CITY Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT | VARCHAR2(20) |
| POPULATION | NUMBER |

## Solution

```sql
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA'
AND POPULATION > 100000;
```

## Explanation

- **`SELECT *`**: Retrieves all columns from the table.
- **`FROM CITY`**: Specifies the source table.
- **`COUNTRYCODE = 'USA'`**: Filters American cities.
- **`POPULATION > 100000`**: Selects cities with populations greater than 100000.

---
<br>

### 2Q) Query the **NAME** field for all **American cities** in the `CITY` table with populations greater than **120000**.

The CountryCode for America is `USA`.

## CITY Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT | VARCHAR2(20) |
| POPULATION | NUMBER |

## Solution

```sql
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA'
AND POPULATION > 120000;
```

## Explanation

- **`SELECT NAME`**: Retrieves only the city names.
- **`FROM CITY`**: Specifies the source table.
- **`COUNTRYCODE = 'USA'`**: Filters American cities.
- **`POPULATION > 120000`**: Selects cities with populations greater than 120000.

---
<br>

### 3Q ) Query **all columns (attributes)** for every row in the `CITY` table.

## CITY Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT | VARCHAR2(20) |
| POPULATION | NUMBER |

## Solution

```sql id="7depyk"
SELECT *
FROM CITY;
```

## Explanation

- **`SELECT *`**: Retrieves all columns from the table.
- **`FROM CITY`**: Specifies the source table from which all rows are retrieved.

--- 
<br>

### 4Q) Query all columns for a city in the CITY table with the ID 1661.

## CITY Table Structure
Field	Type
ID	NUMBER
NAME	VARCHAR2(17)
COUNTRYCODE	VARCHAR2(3)
DISTRICT	VARCHAR2(20)
POPULATION	NUMBER

## Solution
SELECT *
FROM CITY
WHERE ID = 1661;


## Explanation
- SELECT *: Retrieves all columns from the table.
- FROM CITY: Specifies the source table.
- WHERE ID = 1661: Retrieves the city whose ID is 1661.
## Optimization

The query is already optimal and uses a simple equality condition. If ID is a primary key, the database can use its associated index for efficient lookup.

---
<br>


### 5Q) Query all attributes of every **Japanese city** in the `CITY` table. The `COUNTRYCODE` for Japan is `JPN`.

## CITY Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT | VARCHAR2(20) |
| POPULATION | NUMBER |

## Solution

```sql
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

## Explanation

- **`SELECT *`**: Retrieves all columns from the table.
- **`FROM CITY`**: Specifies the source table.
- **`WHERE COUNTRYCODE = 'JPN'`**: Retrieves all cities belonging to Japan.

## Optimization

The query is already optimal for this problem. If `COUNTRYCODE` is indexed, the database may use the index to improve lookup performance.

---

### 6Q) Query the names of all the Japanese cities in the `CITY` table. The `COUNTRYCODE` for Japan is `JPN`.**

## CITY Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT | VARCHAR2(20) |
| POPULATION | NUMBER |

## Solution

```sql
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

## Explanation

- **`SELECT NAME`**: Retrieves only the names of cities.
- **`FROM CITY`**: Specifies the source table.
- **`WHERE COUNTRYCODE = 'JPN'`**: Retrieves all cities belonging to Japan.

## Optimization

The query is already optimal because it retrieves only the required column (`NAME`) instead of all columns.

---

### 7Q) Query a list of `CITY` and `STATE` from the `STATION` table.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql id="f3qjwv"
SELECT CITY, STATE
FROM STATION;
```

## Explanation

- `SELECT CITY, STATE`: Retrieves only the city and state columns.
- `FROM STATION`: Specifies the source table.

## Optimization

The query is already optimal because it retrieves only the required columns instead of all columns.

---

### 8Q) Query a list of `CITY` names from the `STATION` table for cities that have an even `ID` number. Exclude duplicate city names from the results.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Specifies the source table.
- `MOD(ID, 2) = 0`: Filters cities with even ID numbers.

## Optimization

The query is already optimized for this problem. `ORDER BY` is unnecessary because the question allows results in any order.

---

### 9Q) Find the difference between the total number of `CITY` entries in the table and the number of distinct `CITY` entries in the table.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT
    COUNT(*) - COUNT(DISTINCT CITY) AS difference_results
FROM STATION;
```

## Explanation

- `COUNT(*)`: Counts the total number of rows in the table.
- `COUNT(DISTINCT CITY)`: Counts the number of unique city names.
- `COUNT(*) - COUNT(DISTINCT CITY)`: Calculates the difference between total and distinct city entries.
- `AS difference_results`: Assigns an alias to the result.

## Optimization

The query is already optimal. Both aggregate functions calculate the required counts in a single query.

---

### 10Q) Query the two cities in `STATION` with the shortest and longest `CITY` names, along with their respective lengths. If multiple cities have the same length, choose the one that comes first alphabetically.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

1. Shortest City Name

```sql
SELECT
    CITY,
    LENGTH(CITY) AS City_Length
FROM STATION
ORDER BY
    LENGTH(CITY) ASC,
    CITY ASC
LIMIT 1;
```

2. Longest City Name

```sql
SELECT
    CITY,
    LENGTH(CITY) AS City_Length
FROM STATION
ORDER BY
    LENGTH(CITY) DESC,
    CITY ASC
LIMIT 1;
```

## Explanation

- `LENGTH(CITY)`: Counts the number of characters in the city name.
- `ORDER BY LENGTH(CITY) ASC`: Sorts city names from shortest to longest.
- `ORDER BY LENGTH(CITY) DESC`: Sorts city names from longest to shortest.
- `CITY ASC`: Sorts city names alphabetically when multiple cities have the same length.
- `LIMIT 1`: Returns only the first matching record.
- `AS City_Length`: Assigns an alias to the calculated city name length.

## Optimization

The queries are efficient because they use `ORDER BY` with `LIMIT 1` to retrieve only the required shortest and longest city names.

## Key Concepts

- `LENGTH()`
- `ORDER BY`
- `ASC` and `DESC`
- `LIMIT`

---

### 11Q) Query the list of `CITY` names starting with vowels (i.e., A, E, I, O, or U) from `STATION`. The result cannot contain duplicates.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY LIKE 'A%'
    OR CITY LIKE 'E%'
    OR CITY LIKE 'I%'
    OR CITY LIKE 'O%'
    OR CITY LIKE 'U%';
```

## Alternative Solution (Using REGEXP)

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY REGEXP '^[AEIOU]';
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Retrieves data from the STATION table.
- `WHERE`: Filters records based on specified conditions.
- `LIKE 'A%'`: Finds city names starting with A.
- `LIKE 'E%'`: Finds city names starting with E.
- `LIKE 'I%'`: Finds city names starting with I.
- `LIKE 'O%'`: Finds city names starting with O.
- `LIKE 'U%'`: Finds city names starting with U.
- `OR`: Checks whether at least one condition is true.
- `%`: Represents zero or more characters.
- `REGEXP '^[AEIOU]'`: Matches city names that start with any vowel.

## Optimization

Using `DISTINCT` ensures that duplicate city names are removed from the result.

The `REGEXP` alternative provides a shorter way to check multiple vowel conditions in a single expression.

## Key Concepts

- `SELECT DISTINCT`
- `WHERE`
- `LIKE`
- `OR`
- `REGEXP`
- Wildcard `%`

---

### 12Q) Query the list of `CITY` names ending with vowels (A, E, I, O, or U) from `STATION`. The result cannot contain duplicates.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY LIKE '%A'
    OR CITY LIKE '%E'
    OR CITY LIKE '%I'
    OR CITY LIKE '%O'
    OR CITY LIKE '%U';
```

## Alternative Solution (Using REGEXP)

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY REGEXP '[AEIOU]$';
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Retrieves data from the STATION table.
- `WHERE`: Filters records based on specified conditions.
- `LIKE '%A'`: Finds city names ending with A.
- `LIKE '%E'`: Finds city names ending with E.
- `LIKE '%I'`: Finds city names ending with I.
- `LIKE '%O'`: Finds city names ending with O.
- `LIKE '%U'`: Finds city names ending with U.
- `OR`: Checks whether at least one condition is true.
- `%`: Represents zero or more characters.
- `[AEIOU]`: Matches any one of the five vowels.
- `$`: Matches the end of the string in a regular expression.

## Optimization

Using `DISTINCT` ensures that duplicate city names are removed from the result.

The `REGEXP` alternative checks all five vowels in a single condition, making the query shorter and easier to maintain.

## Key Concepts

- `SELECT DISTINCT`
- `WHERE`
- `LIKE`
- `OR`
- `REGEXP`
- Wildcard `%`

---

### 13Q) Query the list of `CITY` names from `STATION` that do not start with vowels. The result cannot contain duplicates.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY NOT LIKE 'A%'
    AND CITY NOT LIKE 'E%'
    AND CITY NOT LIKE 'I%'
    AND CITY NOT LIKE 'O%'
    AND CITY NOT LIKE 'U%';
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Retrieves data from the STATION table.
- `WHERE`: Filters records based on specified conditions.
- `NOT LIKE 'A%'`: Excludes city names starting with A.
- `NOT LIKE 'E%'`: Excludes city names starting with E.
- `NOT LIKE 'I%'`: Excludes city names starting with I.
- `NOT LIKE 'O%'`: Excludes city names starting with O.
- `NOT LIKE 'U%'`: Excludes city names starting with U.
- `AND`: Ensures that all conditions must be true.
- `%`: Represents zero or more characters.

## Optimization

Using `NOT LIKE` with `AND` excludes all city names starting with vowels.

`DISTINCT` ensures that duplicate city names are removed from the result.

## Key Concepts

- `SELECT DISTINCT`
- `WHERE`
- `NOT LIKE`
- `AND`
- Wildcard `%`

---

### 14Q) Query the list of `CITY` names from `STATION` that do not end with vowels. The result cannot contain duplicates.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY NOT LIKE '%A'
    AND CITY NOT LIKE '%E'
    AND CITY NOT LIKE '%I'
    AND CITY NOT LIKE '%O'
    AND CITY NOT LIKE '%U';
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Retrieves data from the STATION table.
- `WHERE`: Filters records based on specified conditions.
- `NOT LIKE '%A'`: Excludes city names ending with A.
- `NOT LIKE '%E'`: Excludes city names ending with E.
- `NOT LIKE '%I'`: Excludes city names ending with I.
- `NOT LIKE '%O'`: Excludes city names ending with O.
- `NOT LIKE '%U'`: Excludes city names ending with U.
- `AND`: Ensures that all conditions must be true.
- `%`: Represents zero or more characters.

## Optimization

Using `NOT LIKE` with `AND` excludes all city names ending with vowels.

`DISTINCT` ensures that duplicate city names are removed from the result.

## Key Concepts

- `SELECT DISTINCT`
- `WHERE`
- `NOT LIKE`
- `AND`
- Wildcard `%`

---

### 15Q) Query the list of `CITY` names from `STATION` that either do not start with vowels or do not end with vowels. The result cannot contain duplicates.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY NOT LIKE 'A%'
    AND CITY NOT LIKE 'E%'
    AND CITY NOT LIKE 'I%'
    AND CITY NOT LIKE 'O%'
    AND CITY NOT LIKE 'U%'
    OR
    CITY NOT LIKE '%A'
    AND CITY NOT LIKE '%E'
    AND CITY NOT LIKE '%I'
    AND CITY NOT LIKE '%O'
    AND CITY NOT LIKE '%U';
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Retrieves data from the STATION table.
- `WHERE`: Filters city names based on the specified conditions.
- `CITY NOT LIKE 'A%'`: Checks whether the city name does not start with A.
- `CITY NOT LIKE 'E%'`: Checks whether the city name does not start with E.
- `CITY NOT LIKE 'I%'`: Checks whether the city name does not start with I.
- `CITY NOT LIKE 'O%'`: Checks whether the city name does not start with O.
- `CITY NOT LIKE 'U%'`: Checks whether the city name does not start with U.
- `CITY NOT LIKE '%A'`: Checks whether the city name does not end with A.
- `CITY NOT LIKE '%E'`: Checks whether the city name does not end with E.
- `CITY NOT LIKE '%I'`: Checks whether the city name does not end with I.
- `CITY NOT LIKE '%O'`: Checks whether the city name does not end with O.
- `CITY NOT LIKE '%U'`: Checks whether the city name does not end with U.
- `AND`: Ensures all conditions in a group are true.
- `OR`: Returns a city if either condition group is true.
- `%`: Represents zero or more characters.

## Optimization

Using `OR` combines two conditions:

1. City names that do not start with vowels.
2. City names that do not end with vowels.

`DISTINCT` ensures that duplicate city names are removed from the result.

## Key Concepts

- `SELECT DISTINCT`
- `WHERE`
- `NOT LIKE`
- `AND`
- `OR`
- Wildcard `%`

---
### 16Q) Query the list of `CITY` names from `STATION` that do not start with vowels and do not end with vowels. The result cannot contain duplicates.

## STATION Table Structure

| Field | Type |
|---|---|
| ID | NUMBER |
| CITY | VARCHAR2(21) |
| STATE | VARCHAR2(2) |
| LAT_N | NUMBER |
| LONG_W | NUMBER |

## Solution

```sql
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    CITY NOT LIKE 'A%'
    AND CITY NOT LIKE 'E%'
    AND CITY NOT LIKE 'I%'
    AND CITY NOT LIKE 'O%'
    AND CITY NOT LIKE 'U%'
    AND CITY NOT LIKE '%A'
    AND CITY NOT LIKE '%E'
    AND CITY NOT LIKE '%I'
    AND CITY NOT LIKE '%O'
    AND CITY NOT LIKE '%U';
```

## Explanation

- `SELECT DISTINCT CITY`: Retrieves unique city names and removes duplicates.
- `FROM STATION`: Retrieves data from the STATION table.
- `WHERE`: Filters city names based on specified conditions.
- `CITY NOT LIKE 'A%'`: Excludes city names starting with A.
- `CITY NOT LIKE 'E%'`: Excludes city names starting with E.
- `CITY NOT LIKE 'I%'`: Excludes city names starting with I.
- `CITY NOT LIKE 'O%'`: Excludes city names starting with O.
- `CITY NOT LIKE 'U%'`: Excludes city names starting with U.
- `CITY NOT LIKE '%A'`: Excludes city names ending with A.
- `CITY NOT LIKE '%E'`: Excludes city names ending with E.
- `CITY NOT LIKE '%I'`: Excludes city names ending with I.
- `CITY NOT LIKE '%O'`: Excludes city names ending with O.
- `CITY NOT LIKE '%U'`: Excludes city names ending with U.
- `AND`: Ensures that all conditions must be true.
- `%`: Represents zero or more characters.

## Optimization

Using `NOT LIKE` with `AND` ensures that city names starting with vowels and ending with vowels are excluded.

`DISTINCT` ensures that duplicate city names are removed from the result.

## Key Concepts

- `SELECT DISTINCT`
- `WHERE`
- `NOT LIKE`
- `AND`
- Wildcard `%`

---


### 17Q) Products Sold Only in the First Quarter of 2019

Write an SQL query to report the products that were only sold during the first quarter of 2019 (January 1, 2019, to March 31, 2019, inclusive).

A product should be included only if:
- It was sold at least once during the first quarter of 2019.
- It was never sold outside the first quarter of 2019.

## Product Table Structure

| Column Name | Type |
|---|---|
| product_id | INT |
| product_name | VARCHAR |
| unit_price | INT |

## Sales Table Structure

| Column Name | Type |
|---|---|
| seller_id | INT |
| product_id | INT |
| buyer_id | INT |
| sale_date | DATE |
| quantity | INT |
| price | INT |

## Solution

```sql
SELECT
    p.product_id,
    p.product_name
FROM
    Product p
WHERE
    EXISTS (
        SELECT 1
        FROM Sales s
        WHERE s.product_id = p.product_id
          AND s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
    )
    AND NOT EXISTS (
        SELECT 1
        FROM Sales s
        WHERE s.product_id = p.product_id
          AND (
              s.sale_date < '2019-01-01'
              OR s.sale_date > '2019-03-31'
          )
    );
```

## Explanation

- `SELECT p.product_id, p.product_name`: Retrieves the product ID and product name.
- `FROM Product p`: Retrieves product information from the Product table.
- `EXISTS`: Checks whether the product was sold at least once during the first quarter of 2019.
- `SELECT 1`: Checks for the existence of matching records.
- `s.product_id = p.product_id`: Matches sales records with their corresponding products.
- `BETWEEN '2019-01-01' AND '2019-03-31'`: Checks whether the sale date falls within the first quarter of 2019.
- `NOT EXISTS`: Ensures that the product was never sold outside the specified date range.
- `s.sale_date < '2019-01-01'`: Checks for sales before the first quarter.
- `s.sale_date > '2019-03-31'`: Checks for sales after the first quarter.
- `AND`: Ensures that both conditions are satisfied.

## Optimization

Using `EXISTS` and `NOT EXISTS` avoids duplicate product records even when the Sales table contains repeated rows.

- `EXISTS` ensures that at least one sale occurred during the first quarter.
- `NOT EXISTS` ensures that no sales occurred outside the first quarter.

An index on `Sales(product_id, sale_date)` can help improve query performance on large datasets.

## Interview Tip

Whenever a question says:

- Only sold during a particular period.
- Never sold outside a date range.
- No records exist after a particular date.

Think about using `NOT EXISTS` or conditional aggregation.

## Key Concepts

- `EXISTS`
- `NOT EXISTS`
- `BETWEEN`
- `AND`
- Subqueries
- Date Filtering
- Product and Sales Relationships

---

### 18Q) Find all authors who have viewed at least one of their own articles. Return the result sorted by ID in ascending order.

## Views Table Structure

| Column Name | Type |
|---|---|
| article_id | INT |
| author_id | INT |
| viewer_id | INT |
| view_date | DATE |

Note: The `Views` table does not have a primary key and may contain duplicate rows. If `author_id` and `viewer_id` are equal, they represent the same person.

## Solution

```sql
SELECT DISTINCT
    e1.author_id AS id
FROM
    Views e1
WHERE
    EXISTS (
        SELECT 1
        FROM Views e2
        WHERE
            e2.author_id = e1.author_id
            AND e2.author_id = e2.viewer_id
    )
ORDER BY
    id ASC;
```

## Explanation

- `SELECT DISTINCT`: Retrieves unique author IDs and removes duplicates.
- `e1.author_id AS id`: Returns the author ID with the column name `id`.
- `FROM Views e1`: Retrieves records from the Views table using alias `e1`.
- `EXISTS`: Checks whether at least one matching record exists.
- `SELECT 1`: Checks for matching records without retrieving unnecessary column values.
- `e2.author_id = e1.author_id`: Matches the author ID from the outer query with the inner query.
- `e2.author_id = e2.viewer_id`: Checks whether the author viewed their own article.
- `ORDER BY id ASC`: Sorts the author IDs in ascending order.

## Optimization

Using `EXISTS` avoids unnecessary duplicate rows from matching records.

`DISTINCT` ensures that each author ID appears only once in the final result.

## Interview Tip

Whenever a question says:

- Find users who performed an action themselves.
- Find authors who viewed their own articles.
- Find employees who meet a condition in their own records.

Think about using `EXISTS` with a self-comparison condition.

When working with the same table in outer and inner queries, use different aliases to identify each reference clearly. This technique is called a self-referencing subquery.

## Key Concepts

- `SELECT DISTINCT`
- `EXISTS`
- Subqueries
- Table Aliases
- Self-Referencing Subquery
- `ORDER BY`
- `ASC`

---

### 19Q) Immediate Food Delivery Percentage

Write a solution to find the percentage of immediate orders in the Delivery table. Round the percentage to 2 decimal places.

An order is considered immediate if the customer's preferred delivery date is the same as the order date. Otherwise, it is considered scheduled.

## Delivery Table Structure

| Column Name | Type |
|---|---|
| delivery_id | int |
| customer_id | int |
| order_date | date |
| customer_pref_delivery_date | date |

- `delivery_id` is the primary key.
- Each row represents a delivery order.
- `order_date` represents the date when the order was placed.
- `customer_pref_delivery_date` represents the customer's preferred delivery date.

## Solution

```sql
WITH Percentage_Orders AS (
    SELECT
        COUNT(*) AS Total_Orders,

        SUM(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1
                ELSE 0
            END
        ) AS Immediate_Orders,

        SUM(
            CASE
                WHEN order_date != customer_pref_delivery_date THEN 1
                ELSE 0
            END
        ) AS Scheduled_Orders

    FROM Delivery
)

SELECT
    Immediate_Orders,
    Scheduled_Orders,
    ROUND(
        (Immediate_Orders * 100.0 / Total_Orders),
        2
    ) AS Percentage_Immediate_Orders
FROM Percentage_Orders;
```

## Explanation

1. `COUNT(*)` counts the total number of orders.
2. `CASE WHEN` checks whether the order date matches the preferred delivery date.
3. `SUM()` counts immediate orders by adding 1 for matching dates and 0 otherwise.
4. Another `CASE WHEN` calculates the scheduled orders.
5. A CTE named `Percentage_Orders` stores all the calculated order counts.
6. The outer query calculates the immediate order percentage.
7. `ROUND()` rounds the percentage to 2 decimal places.

## Percentage Formula

```text
Percentage of Immediate Orders =
(Immediate Orders / Total Orders) * 100
```

## Important Note: Integer Division vs Decimal Division

In some SQL databases, dividing two integer values can produce an integer result instead of a decimal result.

Example:

```sql
SELECT 2 / 6;
```

Possible result:

```text
0
```

To preserve the decimal portion, use a decimal value:

```sql
SELECT 2 / 6.0;
```

Result:

```text
0.333333
```

For percentage calculations, use `100.0` instead of `100`.

```sql
ROUND(
    (Immediate_Orders * 100.0 / Total_Orders),
    2
)
```

Why use `100.0`?

- `100` is an integer.
- `100.0` is a decimal value.
- Decimal arithmetic helps preserve fractional values.
- `ROUND(value, 2)` rounds the final percentage to 2 decimal places.

For example:

```text
Immediate Orders = 2
Total Orders = 6

(2 * 100.0) / 6 = 33.3333

Final Percentage = 33.33
```

## Optimization

- Use conditional aggregation with `SUM(CASE WHEN ...)` to count records based on conditions.
- A CTE helps organize complex calculations and reuse aggregate results.
- Use `100.0` instead of `100` to help preserve decimal precision during division.

## Interview Tip

When an SQL question asks you to calculate a percentage based on a condition:

- Use `CASE WHEN` to identify matching records.
- Use `SUM()` to count records conditionally.
- Use `COUNT(*)` to calculate the total records.
- Use `ROUND()` to control decimal precision.
- Use a CTE or subquery when you need to reuse calculated aliases.
- Be careful with integer division when calculating percentages.

## Key Concepts

- `COUNT()`
- `SUM()`
- `CASE WHEN`
- `WITH` (CTE)
- `ROUND()`
- Conditional Aggregation
- Integer Division
- Decimal Division
- Percentage Calculation

---

### 20Q) Calculate the Click-Through Rate (CTR) for Each Ad

Q20) Write a solution to find the Click-Through Rate (CTR) for each ad.
CTR = (Number of Clicks / (Number of Clicks + Number of Views)) * 100

If an ad has no clicks or views, its CTR should be 0.00.
Round the CTR to 2 decimal places.
Ignore the 'Ignored' action when calculating CTR.
Return the results ordered by CTR in descending order.
If two ads have the same CTR, order them by ad_id in ascending order.

## Ads Table Structure

| Column Name | Data Type                             |
| ----------- | ------------------------------------- |
| ad_id       | int                                   |
| user_id     | int                                   |
| action      | enum ('Clicked', 'Viewed', 'Ignored') |

## Solution

```sql
WITH Percentage_CTR AS (
    SELECT
        ad_id,
        SUM(
            CASE
                WHEN action = 'Clicked' THEN 1
                ELSE 0
            END
        ) AS Ads_Total_Clicked,
        SUM(
            CASE
                WHEN action = 'Viewed' THEN 1
                ELSE 0
            END
        ) AS Ads_Total_Viewed
    FROM Ads_Table
    GROUP BY ad_id
)

SELECT
    ad_id,
    Ads_Total_Clicked,
    Ads_Total_Viewed,
    ROUND(
        COALESCE(
            Ads_Total_Clicked * 100.0 /
            NULLIF(Ads_Total_Clicked + Ads_Total_Viewed, 0),
            0
        ),
        2
    ) AS CTR
FROM Percentage_CTR
ORDER BY CTR DESC, ad_id ASC;
```

## Explanation

1. CTE (Percentage_CTR):

   - Creates an intermediate result for each ad.
   - Uses `GROUP BY ad_id` to group records by ad.
   - Uses conditional aggregation with `SUM(CASE WHEN...)` to count clicks and views separately.

2. Clicked Count:

   - Counts the number of times an ad was clicked.
   - `CASE WHEN action = 'Clicked' THEN 1 ELSE 0 END` returns 1 for clicks and 0 for other actions.

3. Viewed Count:

   - Counts the number of times an ad was viewed.
   - Ignores the 'Ignored' action when calculating CTR.

4. CTR Calculation:

   - Formula: `(Total Clicks / (Total Clicks + Total Views)) * 100`.
   - Multiplies by `100.0` to preserve decimal calculation.
   - Uses `NULLIF()` to prevent division by zero.
   - Uses `COALESCE()` to replace NULL with 0.
   - Uses `ROUND()` to round the CTR to 2 decimal places.

5. ORDER BY: ( Important Point )&#x20;

   - Sorts CTR in descending order.
   - If CTR values are equal, sorts `ad_id` in ascending order.

## Optimization

- Uses conditional aggregation to calculate clicks and views in a single table scan.
- Uses a CTE to separate counting logic from CTR calculation.
- Uses `NULLIF()` to safely handle ads with zero clicks and views.
- Uses `COALESCE()` to ensure the CTR result is 0 instead of NULL.

## Interview Tip

- Understand conditional aggregation using `SUM(CASE WHEN...)`.
- Remember that `Ignored` actions should not be included in the CTR denominator.
- Use `100.0` instead of `100` to avoid integer division in databases that perform integer division.
- Always handle division by zero using `NULLIF()`.
- Use `COALESCE()` when you need to replace NULL values with a default value.

## Key Concepts

- CTE (Common Table Expression)
- GROUP BY
- SUM()
- CASE WHEN
- Conditional Aggregation
- ROUND()
- COALESCE()
- NULLIF()
- ORDER BY

---

