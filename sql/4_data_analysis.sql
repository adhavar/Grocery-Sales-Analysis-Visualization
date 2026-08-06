/* In this section, I will analyze the data to meet the Business Objectives
established on the README.md file of this repository. */

-- 01. Sales Performance
-- Days with the higher Sales
SELECT
    SalesDate,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
WHERE
    TRIM(SalesDate) <> ''
GROUP BY SalesDate
ORDER BY TotalSales DESC
LIMIT 5;

-- Days with the lowest Sales
SELECT
    SalesDate,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
WHERE
    TRIM(SalesDate) <> ''
GROUP BY SalesDate
ORDER BY TotalSales ASC
LIMIT 5;

-- 02. Product Analysis
-- Top 5 Sales by Product
SELECT
    ProductName,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 5;

-- Top 5 Sales by Category
SELECT
    CategoryName,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
GROUP BY CategoryName
ORDER BY TotalSales DESC
LIMIT 5;


-- 03. Employee Performance
SELECT
    EmployeeName,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
GROUP BY EmployeeName
ORDER BY TotalSales DESC
LIMIT 5;


-- 04. Geographical Analysis
-- Cities with the highest sales
SELECT 
    CityName,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
GROUP BY CityName
ORDER BY TotalSales DESC
LIMIT 5;

-- Cities with the lowest sales
SELECT 
    CityName,
    SUM(TotalPrice) AS TotalSales
FROM table_analysis
GROUP BY CityName
ORDER BY TotalSales ASC
LIMIT 5;