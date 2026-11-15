-- Q1 Query all columns for all American cities in theCITY table with populations larger than 100000.
-- The CountryCode for America is USA. ?

SELECT *
FROM
	City
WHERE
	CountryCode = "America" 
AND
	Populations > 100000;


-- Q2. Query the NAME field for all American cities inthe CITY table with populations larger than 120000.
-- The CountryCode for America is USA.


SELECT *
FROM
	City
Where
	CountryCode = "USA"
AND
	Populations > 120000;


-- Q3.Query all columns (attributes) for every row in the CITY table.
-- The CITY table is described as follows:


SELECT
	*
FROM
	City;

-- Q4. Query all columns for a city in CITY with theID 1661.
-- The CITY table is described as follows


SELECT *
FROM
	City
WHERE
	ID = 1661;


-- Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is
-- JPN.


SELECT *
FROM
	City
WHERE
	CountryCode = "JPN"

-- Q6 ) Query the names of all the Japanese cities inthe CITY table. The COUNTRYCODE for Japan is
-- JPN.


SELECT
	NAME
FROM
	City
WHERE
	CountryCode = "JPN"

-- 7Q Query a list of CITY and STATE from the STATIONtable.



SELECT 
	City,
	State
FROM
	Station;


-- 8Q Query a list of CITY names from STATION for citiesthat have an even ID number. Print the results
-- in any order, but exclude duplicates from the answer


SELECT 
	DISTINCT City
FROM
	Station 
WHERE
	MOD(ID,2) = 0
ORDER BY 
	City DESC;



-- 9Q ) Find the difference between the total number of CITY entries in the table and the number of
-- distinct CITY entries in the table.


SELECT
	(
		COUNT(*) - COUNT(DISTINCT City)
	) AS difference_results
FROM
	Station;

-- For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru',
-- there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because total number
-- of records - number of unique city names = 3-2 =1


-- Q10.Query the two cities in STATION with the shortestand longest CITY names, as well as their
-- respective lengths (i.e.: number of characters in the name). If there is more than one smallest
-- or largest city, choose the one that comes first when ordered alphabetically. The STATION table
-- is described as follows:


-- Shortest City
SELECT
    CITY,
    LENGTH(CITY) AS City_Length
FROM
    Station
ORDER BY
    LENGTH(CITY) ASC,
    CITY ASC
LIMIT 1;

-- Longest City
SELECT
    CITY,
    LENGTH(CITY) AS City_Length
FROM
    Station
ORDER BY
    LENGTH(CITY) DESC,
    CITY ASC
LIMIT 1;


-- Q11. Query the list of CITY names starting with vowels(i.e., a, e, i, o, or u) from STATION. Your result
-- cannot contain duplicates

SELECT 
	City 
FROM
	Station 
Where 
	City LIKE 'a%'
	OR City LIKE 'e%'
	OR City LIKE 'i%'
	OR City LIKE 'o%'
	OR City LIKE 'u%';


-- Q12.Query the list of CITY names ending with vowels(a, e, i, o, u) from STATION. Your result cannot
-- contain duplicates

SELECT
	DISTINCT CITY 
FROM 
	STATION 
WHERE 
	City LIKE '%A'
	OR City LIKE '%E'
	OR City LIKE '%I'
	OR City LIKE '%O'
	OR City LIKE '%U';

-- 13Q .Query the list of CITY names from STATION thatdo not start with vowels. Your result cannot
-- contain duplicates.

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



-- Q14.Query the list of CITY names from STATION thatdo not end with vowels. Your result cannot
-- contain duplicates.

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


-- Q15.Query the list of CITY names from STATION thateither do not start with vowels or do not end
-- with vowels. Your result cannot contain duplicates

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


-- Q16.Query the list of CITY names from STATION thatdo not start with vowels and do not end with
-- vowels. Your result cannot contain duplicates.

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



-- Q17. Write an SQL query to report the products that were only sold in the first quarter of 2019.
-- The first quarter is between 2019-01-01 and 2019-03-31 (inclusive).
-- Return the product_id and product_name.
-- A product must not have any sales outside this date range.

SELECT 
	p.product_id,
	p.product_name
FROM 
	Product p  
WHERE 
	EXISTS (
		SELECT * 
		FROM 
			Sales s 
		WHERE 
			s.product_id = p.product_id 
		AND 
			s.sale_date BETWEEN 
			'2019-01-01'
			AND 
			'2019-03-31'
	)
AND 
	NOT EXISTS (

		SELECT * 
		FROM 
			Sales s 
		WHERE
			s.product_id = p.product_id
		AND (
				s.sale_date < '2019-01-01'
			OR 
				s.sale_date > '2019-03-31'
		)

	);



-- Q18. Find all authors who have viewed at least one of their own articles.
-- The author_id and viewer_id represent the same person when their values are equal.
-- Return the author IDs as id, remove duplicates, and sort the result in ascending order.


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


-- Q19. Find the percentage of immediate orders in the Delivery table.
-- An order is immediate when order_date is equal to customer_pref_delivery_date.
-- Otherwise, it is considered a scheduled order.
-- Calculate the percentage of immediate orders and round the result to 2 decimal places.

-- Problem With This Query 
-- 
-- Reusing column aliases
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

	) AS Scheduled_Orders,
	ROUND(
		( Immediate_Orders / Total_Orders ) * 100
	,2) As Percentage_Immediate_Orders
FROM 
	Delivery_Table;

-- Two ways to fix it
-- 1. Use a CTE or subquery to calculate the counts first, then calculate the percentage.
-- 2. Repeat the aggregate expressions inside ROUND().


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
	FROM
		Delivery_Table
)

SELECT 
	Immediate_Orders,
	Scheduled_Orders,
	ROUND(
		( Immediate_Orders * 100.0 / Total_Orders ) 
	,2) As Percentage_Immediate_Orders
FROM
	Percentage_Orders;


-- Q20) Write a solution to find the Click-Through Rate (CTR) for each ad.
-- CTR = (Number of Clicks / (Number of Clicks + Number of Views)) * 100
--
-- If an ad has no clicks or views, its CTR should be 0.00.
-- Round the CTR to 2 decimal places.
-- Ignore the 'Ignored' action when calculating CTR.
-- Return the results ordered by CTR in descending order.
-- If two ads have the same CTR, order them by ad_id in ascending order.


WITH Percentage_CTR AS (
	SELECT
		ad_id,
		SUM(
			CASE 
				WHEN action = "Clicked" THEN 1 
				ELSE 0
			END 
		) AS Ads_Total_Clicked,
		SUM(
			CASE 
				WHEN action = "Viewed" THEN 1
				ELSE 0
			END 
		) AS Ads_Total_Viewed
	FROM
		Ads_Table 
	GROUP BY ad_id

)

SELECT 
	ad_id,
	Ads_Total_Clicked,
	Ads_Total_Viewed,
	ROUND(
		COALESCE(
			Ads_Total_Clicked * 100.0 /
			NULLIF(Ads_Total_Clicked + Ads_Total_Viewed,0),
		0)
	,2) AS CTR
FROM
	Percentage_CTR
ORDER BY CTR DESC,
         ad_id ASC;

-- Important Point 

-- This means:
-- 1. First, sort ads by CTR from highest to lowest.
-- 2. If two ads have the same CTR, sort their ad_id from smallest to largest.


-- Q21) Write an SQL query to find the team size of each employee.
-- Each employee belongs to a team identified by team_id.
-- Calculate the total number of employees in each team.
-- Return employee_id and team_size for every employee.
-- The result can be returned in any order.


SELECT
	employee_id,
	COUNT(*) OVER(
		PARTITION BY team_id
	) as team_size
FROM
	Employee;


-- Q22) Write an SQL query to find the type of weather in each country for November 2019.
--
-- Calculate the average weather_state for each country during November 2019.
--
-- Weather Classification:
-- 1. Cold: Average weather_state <= 15
-- 2. Hot: Average weather_state >= 25
-- 3. Warm: Otherwise
--
-- Return country_name and weather_type.
-- Exclude countries that have no weather records in November 2019.
-- The result can be returned in any order.



SELECT
	c.country_name,
	CASE
		WHEN AVG(w.weather_state) <= 15 THEN 'Cold'
		WHEN AVG(w.weather_state) >=15 THEN 'HOT'
		ELSE 'Warm'
	END AS weather_type 
FROM 
	Countries c
INNER JOIN 
	Weather w 
ON 
	c.country_id = w.country_id 
WHERE 
	w.day >= '2019-11-01'
AND
	w.day < '2019-12-01'
GROUP BY 
	c.country_id,
	c.country_name;


-- Q23) Write an SQL query to find the average selling price for each product.
--
-- Calculate the average selling price using the following formula:
-- Average Price = Total Sales Amount / Total Units Sold
--
-- Total Sales Amount = SUM(price * units)
-- Total Units Sold = SUM(units)
--
-- Match the Prices and UnitsSold tables using product_id.
-- Match purchase_date with the corresponding start_date and end_date.
-- Round the average_price to 2 decimal places.
-- Return product_id and average_price.
-- The result can be returned in any order.


SELECT 
	p.product_id,
	ROUND(
		SUM(p.price * u.units) / SUM(u.units),
	2) AS average_price
FROM
	Prices p 
INNER JOIN 
	UnitsSold u  
ON
	p.product_id = u.product_id
AND
	u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
	p.product_id;



-- Q24) Write an SQL query to report the first login date for each player.
--
-- Find the earliest event_date for every player.
-- Return player_id and first_login.
-- Use an appropriate aggregate function to find the minimum event_date.
-- Group the records by player_id.
-- The result can be returned in any order.


SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;


-- Q25) Write an SQL query to report the device that each player used for their first login.
-- Find the earliest event_date for every player using MIN().
-- Use INNER JOIN to retrieve the device_id associated with the first login date.
-- Return player_id and device_id.



SELECT
	a.player_id,
	a.device_id
FROM
	Activity a
INNER JOIN (
	SELECT
		player_id,
		MIN(event_date) AS first_login
	FROM
		Acitvity
	GROUP BY 
		player_id 
) b 
ON  a.player_id = b.player_id 
AND a.event_date = b.first_login;



-- Q26) Write an SQL query to find the names of products that have at least 100 units ordered in February 2020.
--
-- Table: Products
-- +------------+-----------------+------------------+
-- | product_id | product_name    | product_category |
-- +------------+-----------------+------------------+
-- | 1          | Leetcode        | Book             |
-- | 2          | Solutions       | Book             |
-- | 3          | Jewels of       | Book             |
-- | 4          | HP              | Laptop           |
-- | 5          | Lenovo          | Laptop           |
-- | 6          | Leetcode Kit    | T-shirt          |
-- +------------+-----------------+------------------+
--
-- Table: Orders
-- +------------+------------+------+
-- | product_id | order_date | unit |
-- +------------+------------+------+
-- | 1          | 2020-02-05 | 60   |
-- | 1          | 2020-02-10 | 70   |
-- | 2          | 2020-01-18 | 30   |
-- | 2          | 2020-02-11 | 80   |
-- | 3          | 2020-02-17 | 2    |
-- | 3          | 2020-02-24 | 3    |
-- | 4          | 2020-03-01 | 20   |
-- | 4          | 2020-03-04 | 30   |
-- | 4          | 2020-03-04 | 60   |
-- | 6          | 2020-02-25 | 50   |
-- | 6          | 2020-02-27 | 50   |
-- | 6          | 2020-03-01 | 50   |
-- +------------+------------+------+
--
-- Expected Output:
-- +------------------+------+
-- | product_name     | unit |
-- +------------------+------+
-- | Leetcode         | 130  |
-- | Leetcode Kit     | 100  |
-- +------------------+------+
--
-- Requirements:
-- 1. Join Products and Orders using product_id.
-- 2. Filter orders placed in February 2020.
-- 3. Calculate total units for each product using SUM().
-- 4. Group by product_id and product_name.
-- 5. Use HAVING to return products with at least 100 total units.


SELECT *,
	s.product_name,
	SUM(p.unit) AS unit 
FROM
	Products s 
INNER JOIN 
	Orders p 
ON 
	s.product_id = p.product_id 
 WHERE 
 	p.order_date >='2020-02-01' 
 AND
 	p.order_date < '2020-03-01'
 GROUP BY 
 	s.product_id,
 	s.product_name
 HAVING 
 	SUM(p.unit) >=100;



-- Q27) Write an SQL query to find users who have valid email addresses.
--
-- Table: Users
-- +---------+-------------+----------------------+
-- | user_id | name        | mail                 |
-- +---------+-------------+----------------------+
-- | 1       | Winston     | winston@leetcode.com |
-- | 2       | Jonathan    | jonathanisgreat      |
-- | 3       | Annabelle   | bella-@leetcode.com  |
-- | 4       | Sally       | sally.come@leetcode.com |
-- | 5       | Marwan      | quarz#2020@leetcode.com |
-- | 6       | David       | david69@gmail.com    |
-- | 7       | Shapiro     | .shapo@leetcode.com |
-- +---------+-------------+----------------------+
--
-- Requirements:
-- 1. Email prefix must start with an English letter (A-Z or a-z).
-- 2. Prefix can contain letters, digits, underscore (_), period (.), and dash (-).
-- 3. Email domain must be exactly '@leetcode.com'.
-- 4. Exclude emails containing invalid characters.
-- 5. Exclude emails that do not start with a letter.
-- 6. Use REGEXP (Regular Expression) to validate email addresses.
-- 7. Return user_id, name, and mail.
--
-- Expected Output:
-- +---------+-----------+---------------------------+
-- | user_id | name      | mail                      |
-- +---------+-----------+---------------------------+
-- | 1       | Winston   | winston@leetcode.com      |
-- | 3       | Annabelle | bella-@leetcode.com       |
-- | 4       | Sally     | sally.come@leetcode.com   |
-- +---------+-----------+---------------------------+




SELECT
	user_id,
	user_name,
	mail
FROM
	Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$';



-- Q28) Write an SQL query to find customers who have spent at least $100 in each month of June and July 2020.
--
-- Table: Customers
-- +-------------+---------+---------+
-- | customer_id | name    | country |
-- +-------------+---------+---------+
-- | 1           | Winston  | USA     |
-- | 2           | Jonathan | Peru    |
-- | 3           | Moustafa | Egypt   |
-- +-------------+---------+---------+
--
-- Table: Product
-- +------------+-------------+-------+
-- | product_id | description | price |
-- +------------+-------------+-------+
-- | 10         | LC Phone    | 300   |
-- | 20         | LC T-Shirt  | 10    |
-- | 30         | LC Book     | 45    |
-- | 40         | LC Keychain | 2     |
-- +------------+-------------+-------+
--
-- Table: Orders
-- +----------+-------------+------------+------------+----------+
-- | order_id | customer_id | product_id | order_date | quantity |
-- +----------+-------------+------------+------------+----------+
-- | 1        | 1           | 10         | 2020-06-10 | 1        |
-- | 2        | 1           | 20         | 2020-07-01 | 1        |
-- | 3        | 1           | 30         | 2020-07-08 | 2        |
-- | 4        | 2           | 10         | 2020-06-15 | 2        |
-- | 5        | 2           | 40         | 2020-07-01 | 10       |
-- | 6        | 3           | 20         | 2020-06-24 | 2        |
-- | 7        | 3           | 30         | 2020-06-25 | 2        |
-- | 9        | 3           | 30         | 2020-05-08 | 3        |
-- +----------+-------------+------------+------------+----------+
--
-- Expected Output:
-- +-------------+---------+
-- | customer_id | name    |
-- +-------------+---------+
-- | 1           | Winston |
-- +-------------+---------+
--
-- Requirements:
-- 1. Join Customers, Orders, and Product tables.
-- 2. Filter orders placed in June and July 2020.
-- 3. Calculate spending using price * quantity.
-- 4. Calculate June and July spending separately using CASE WHEN.
-- 5. Group results by customer_id and name.
-- 6. Use HAVING to ensure spending is at least $100 in BOTH months.
-- 7. Return customer_id and customer name.



SELECT
	c.customer_id,
	c.name 
FROM
	Customers c
INNER JOIN 
	Orders o 
ON 
	c.customer_id = o.customer_id 
INNER JOIN 
	Product p 
ON
	o.product_id = p.product_id 
WHERE 
		o.order_date >='2020-06-01'
	AND
		o.order_date < '2020-08-01'
GROUP BY
	c.customer_id,
	c.name 
HAVING 
	SUM(
		CASE 
			WHEN MONTH(o.order_date) = 6 
			THEN p.price * p.qunatity
			ELSE 0 
		END 
	) > = 100
	AND 
	SUM(
		CASE 
			WHEN MONTH(o.order_date) = 7 
			THEN p.price * p.quantity 
			ELSE 0 
		END 
	) >= 100;




-- Q29) Find the distinct titles of kid-friendly movies streamed in June 2020.
--
-- Table: TVProgram
--
-- Column Name     Type
-- -------------------------
-- program_date    date
-- content_id      int
-- channel         varchar
--
-- Primary Key: (program_date, content_id)
--
-- Table: Content
--
-- Column Name     Type
-- -------------------------
-- content_id      int
-- title           varchar
-- Kids_content    enum('Y', 'N')
-- content_type    varchar
--
-- Primary Key: content_id
--
-- Sample Input:
--
-- TVProgram Table:
--
-- program_date         content_id    channel
-- ------------------------------------------------
-- 2020-06-10 08:00     1             LC-Channel
-- 2020-05-11 12:00     2             LC-Channel
-- 2020-05-12 12:00     3             LC-Channel
-- 2020-05-13 14:00     4             Disney Ch
-- 2020-06-18 14:00     4             Disney Ch
-- 2020-07-15 16:00     5             Disney Ch
--
-- Content Table:
--
-- content_id    title             Kids_content    content_type
-- --------------------------------------------------------------
-- 1             Alg. for Kids     Y               Series
-- 2             Database Sols     N               Series
-- 3             Aladdin           Y               Movies
-- 4             Cinderella        Y               Movies
-- 5             Leetcode Movie    N               Movies
--
-- Requirements:
--
-- 1. Find movies streamed during June 2020.
-- 2. Include only kid-friendly content (Kids_content = 'Y').
-- 3. Include only movies (content_type = 'Movies').
-- 4. Return distinct movie titles.
-- 5. The result can be returned in any order.
--
-- Expected Output:
--
-- title
-- ----------------
-- Aladdin
--
-- Explanation:
--
-- 1. "Alg. for Kids" is not a movie.
-- 2. "Database Sols" is not kid-friendly and is not a movie.
-- 3. "Aladdin" is a kid-friendly movie streamed in June 2020.
-- 4. "Cinderella" is a kid-friendly movie but was not streamed in June 2020.
-- 5. "Leetcode Movie" is not kid-friendly.
--
-- Solution:



SELECT DISTINCT 
	c.title 
FROM
	TVProgram s 
INNER JOIN 
	Content c
ON 
	c.content_id = s.content_id
WHERE 
		s.program_date >= '2020-06-01'
	AND 
		s.program_date < '2020-07-01'
	AND 
		c.Kids_content = 'Y'
	AND 
		c.content_type = "Movies";


