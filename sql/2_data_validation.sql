/*  Before joining the tables, it is necessary to validate the imported data.
In this section I check for:
1. Duplicate values in identifier columns.
2. NULL values.
3. Blank values.
4. Referential integrity. */

------------------------------- Section 1 --------------------------------
--             Duplicate values in identification columns.
-- CategoryID
SELECT
    "CategoryID",
    COUNT(*) AS duplicates
FROM categories
GROUP BY "CategoryID"
HAVING COUNT(*) > 1;

-- EmployeeID
SELECT
    "EmployeeID",
    COUNT(*) AS duplicates
FROM employees
GROUP BY "EmployeeID"
HAVING COUNT(*) > 1;

-- CustomerID
SELECT
    "CustomerID",
    COUNT(*) AS duplicates
FROM customers
GROUP BY "CustomerID"
HAVING COUNT(*) > 1;

-- CityID
SELECT
    "CityID",
    COUNT(*) AS duplicates
FROM cities
GROUP BY "CityID"
HAVING COUNT(*) > 1;

-- CountryID
SELECT
    "CountryID",
    COUNT(*) AS duplicates
FROM countries
GROUP BY "CountryID"
HAVING COUNT(*) > 1;

-- ProductID
SELECT
    "ProductID",
    COUNT(*) AS duplicates
FROM products
GROUP BY "ProductID"
HAVING COUNT(*) > 1;


------------------------------- Section 2 --------------------------------
--                             NULL values.

-- CategoryID
SELECT
    COUNT(*) AS null_value
FROM categories
WHERE "CategoryID" IS NULL;

-- EmployeeID
SELECT
    COUNT(*) AS null_value
FROM employees
WHERE "EmployeeID" IS NULL;

-- CustomerID
SELECT
    COUNT(*) AS null_value
FROM customers
WHERE "CustomerID" IS NULL;

-- CityID
SELECT
    COUNT(*) AS null_value
FROM cities
WHERE "CityID" IS NULL;

-- CountryID
SELECT
    COUNT(*) AS null_value
FROM countries
WHERE "CountryID" IS NULL;

-- ProductID
SELECT
    COUNT(*) AS null_value
FROM products
WHERE "ProductID" IS NULL;

-- Quantity
SELECT
    COUNT(*) AS null_value
FROM sales
WHERE "Quantity" IS NULL;

-- Price
SELECT
    COUNT(*) AS null_value
FROM products
WHERE "Price" IS NULL;

-- Discount
SELECT
    COUNT(*) AS null_value
FROM sales
WHERE "Discount" IS NULL;

-- SalesDate
SELECT
    COUNT(*) AS null_value
FROM sales
WHERE "SalesDate" IS NULL;


------------------------------- Section 3 --------------------------------
--                            Blank values.
-- CategoryName
SELECT
    COUNT(*) AS blank_value
FROM categories
WHERE TRIM("CategoryName") = '';

-- EmployeeName
SELECT
    COUNT(*) AS blank_value
FROM employees
WHERE TRIM("FirstName") = ''
    OR TRIM("MiddleInitial") = ''
    OR TRIM("LastName") = '';

-- CustomerName
SELECT
    COUNT(*) AS blank_value
FROM customers
WHERE TRIM("FirstName") = ''
    OR TRIM("LastName") = '';

-- CityName
SELECT
    COUNT(*) AS blank_value
FROM cities
WHERE TRIM("CityName") = '';

-- CountryName
SELECT
    COUNT(*) AS blank_value
FROM countries
WHERE TRIM("CountryName") = '';

-- ProductName
SELECT
    COUNT(*) AS blank_value
FROM products
WHERE TRIM("ProductName") = '';

-- SalesDate
SELECT
    COUNT(*) AS blank_value
FROM sales
WHERE TRIM("SalesDate") = '';
/* Returned 67526 blank values. When working with the column, I 
will use the TRIM function to filter out the blank values. */


------------------------------- Section 4 --------------------------------
--                        Referential integrity.

-- sales and employee table
SELECT
    sl."SalesPersonID",
    emp."EmployeeID"
FROM sales AS sl
    LEFT JOIN employees AS emp ON sl."SalesPersonID" = emp."EmployeeID"
WHERE
    emp."EmployeeID" IS NULL;

-- sales and customers table
SELECT
    sl."CustomerID",
    cs."CustomerID"
FROM sales AS sl
    LEFT JOIN customers AS cs ON sl."CustomerID" = cs."CustomerID"
WHERE
    cs."CustomerID" IS NULL;

-- sales and products table
SELECT
    sl."ProductID",
    pd."ProductID"
FROM sales AS sl
    LEFT JOIN products AS pd ON sl."ProductID" = pd."ProductID"
WHERE
    pd."ProductID" IS NULL;

-- employees and cities table
SELECT
    emp."CityID",
    ct."CityID"
FROM employees AS emp
    LEFT JOIN cities AS ct ON emp."CityID" = ct."CityID"
WHERE
    ct."CityID" IS NULL;

-- customers and cities table
SELECT
    cs."CityID",
    ct."CityID"
FROM customers AS cs
    LEFT JOIN cities AS ct ON cs."CityID" = ct."CityID"
WHERE
    ct."CityID" IS NULL;

-- cities and countries table
SELECT
    ct."CountryID",
    cr."CountryID"
FROM cities AS ct
    LEFT JOIN countries AS cr ON ct."CountryID" = cr."CountryID"
WHERE
    cr."CountryID" IS NULL;

-- products and categories table
SELECT
    pd."CategoryID",
    cat."CategoryID"
FROM products AS pd
    LEFT JOIN categories AS cat ON pd."CategoryID" = cat."CategoryID"
WHERE
    cat."CategoryID" IS NULL;


/* After running all queries, I found that there are no duplicates or null values.
Based on these queries, there are only blank values in the SalesDate column; the blank values will be 
filtered out using the TRIM function.
In addition, the relational integrity between all tables is correctly maintained.

The next step is to join the necessary columns into one table. */
