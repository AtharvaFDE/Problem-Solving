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

