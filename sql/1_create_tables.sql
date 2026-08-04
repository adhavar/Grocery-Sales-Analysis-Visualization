/* The database was created using the SQLite terminal in VS Code.
The CSV files were imported into their corresponding tables. 

In this section, I document the database structure and their corresponding primary
and foreign key relationships.*/

-- categories
CREATE TABLE categories (
    CategoryID INTEGER PRIMARY KEY,
    CategoryName TEXT NOT NULL);

-- countries
CREATE TABLE countries (
    CountryID INTEGER PRIMARY KEY,
    CountryName TEXT NOT NULL,
    CountryCode TEXT);

-- cities
CREATE TABLE cities (
    CityID INTEGER PRIMARY KEY,
    CityName TEXT NOT NULL,
    Zipcode INTEGER,
    CountryID INTEGER,
    FOREIGN KEY (CountryID) REFERENCES countries(CountryID));

-- products
CREATE TABLE products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT NOT NULL,
    Price DECIMAL(10,2),
    CategoryID INTEGER,
    Class TEXT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID));

--customers
CREATE TABLE customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    MiddleInitial TEXT,
    LastName TEXT,
    CityID INTEGER,
    Address TEXT,
    FOREIGN KEY (CityID) REFERENCES cities(CityID));

-- employees
CREATE TABLE employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName TEXT,
    MiddleInitial TEXT,
    LastName TEXT,
    BirthDate DATE,
    Gender TEXT,
    CityID INTEGER,
    HireDate DATE,
    FOREIGN KEY (CityID) REFERENCES cities(CityID));

-- sales
CREATE TABLE sales (
    SalesID INTEGER PRIMARY KEY,
    SalesPersonID INTEGER,
    CustomerID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    Discount DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    SalesDate DATETIME,
    TransactionNumber TEXT,
    FOREIGN KEY (SalesPersonID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID));
