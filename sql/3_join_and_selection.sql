/* In this step, I select the columns needed to meet the Business Objectives. */

CREATE TABLE table_analysis AS
SELECT
    pd."ProductName", 
    cat."CategoryName",
    /* In the original sales table, the TotalPrice column only has the value of 0.
    Because of the incorrect values, I created a new column. */
    CAST(
        (sl."Quantity" * pd."Price") - sl."Discount" 
        AS DECIMAL(10,2)) AS TotalPrice, 
    /* The SalesDate column contains both date and time values.
    To only return the date, I use the DATE function. */
    DATE(sl."SalesDate") AS SalesDate,
    /* To easily identify and present the top employees, a full name column needs to be created. 
    It can also be done using || */
    CONCAT(emp."FirstName", 
        ' ', 
        SUBSTR(emp."MiddleInitial", 1, 1),
        '. ', 
        emp."LastName") AS EmployeeName,
    ct."CityName", 
    cr."CountryName"

FROM sales AS sl 
    LEFT JOIN employees AS emp ON sl."SalesPersonID" = emp."EmployeeID" 
    LEFT JOIN customers AS cs ON sl."CustomerID" = cs."CustomerID" 
    LEFT JOIN cities AS ct ON cs."CityID" = ct."CityID" 
    LEFT JOIN countries AS cr ON ct."CountryID" = cr."CountryID" 
    LEFT JOIN products AS pd ON sl."ProductID" = pd."ProductID" 
    LEFT JOIN categories AS cat ON pd."CategoryID" = cat."CategoryID"

WHERE
    TRIM(sl."SalesDate") <> '';
