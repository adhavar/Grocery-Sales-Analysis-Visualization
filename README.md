# Grocery Sales Analysis and Visualization 
This analysis evaluates the transactional performance of a fictional Grocery Store between **January 1, 2018** and **May 9, 2018**. The primary objective of the analysis is to present actionable insights and data-informed sales strategies for the remainder of the fiscal year.

## Table of Contents
- [Business Objectives](#business-objectives)
- [Dataset Information](#dataset-information)
- [Tools and Environment](#tools-and-environment)
- [Data Analysis Process](#data-analysis-process)
- [Data Visualization Dashboard](#data-visualization-dashboard)
- [Business Insights](#business-insights)

## Business Objectives
- **Sales Performance:** Evaluate revenue trends over time and identify periods of high and low sales activity.
- **Product Analysis:** Determine which products and categories contribute the most to total revenue and sales volume.
- **Employee Performance:** Measure salesperson contributions and identify the top-performing employees based on sales performance.
- **Geographic Analysis:** Explore sales distribution across cities to identify regional performance differences.

## Dataset Information
The dataset is publicly available on Kaggle under the CC0: Public Domain License.

Dataset source: https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset?select=customers.csv

### 01. Dataset Structure:

| File | Description |
|------|-------------|
| categories.csv | Category by Product ID. |
| cities.csv | City Name, Zipcode and Country by City ID. |
| countries.csv | Country Name and Code by Country ID. |
| customers.csv | Name, City ID and Address by Customer ID. |
| employees.csv | Employee descriptive information by Employee ID. |
| products.csv | Product details, including pricing and classification. |
| sales.csv | Transaction records, including Employee ID, Customer ID and Total Price.|

### 02. Dataset Schema:
<img width="1200" height="629" src="https://github.com/user-attachments/assets/13b4d475-1fdd-4814-a794-db5b81924784" />

## Tools and Environment
- **SQLite:** Used for data loading, data validation, cleaning, transformation, and analytical table creation.
- **VS Code:** Used as the main IDE environment to develop and run all SQL query scripts.
- **Tableau:** Used to design and build key charts and the overall dashboard.

## Data Analysis Process
The SQL queries used to analyze the data can be found in the `sql` folder in this repository. The folder contains the four main steps of the analysis process.
- `1_create_tables.sql`: Once the CSV files were imported using the VS Code Terminal, the tables for categories, cities, countries, customers, employees, products, and sales were created. In addition, the relationships between the primary and foreign keys were established.
- `2_data_validation.sql`: Before working with the data, it was important to validate its quality and consistency. The data validation process included checking for duplicate values in identification columns (CategoryID, EmployeeID, CustomerID, CityID, CountryID, and ProductID), checking for NULL values in relevant columns (including Quantity, Price, Discount, SalesDate, and identification columns), checking for blank values in string and date fields (using the `TRIM` function), and verifying the relationships between tables to ensure referential integrity. No duplicate or NULL values were found, while blank values were only identified in the SalesDate column.
- `3_join_and_selection.sql`: To create the `table_analysis` table, all the tables were joined using `LEFT JOIN`. The required columns were selected based on the business objectives. During this step, the `TotalPrice` column was recalculated, the `SalesDate` column was converted to a date format, and the `EmployeeName` column was created by combining the employee's first name, middle initial, and last name. The blank values were excluded from the final analytical table.
- `4_data_analysis.sql`: The `table_analysis` table was used to address the business objectives through SQL aggregation and ranking queries. The analysis identified the days with the highest and lowest sales, the top 5 products, categories and employees by total sales, and the cities with the highest and lowest total sales. These results were used to both validate the visualizations in Tableau and compare top performances.

## Data Visualization Dashboard

## Business Insights
