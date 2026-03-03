-- Creating Database
CREATE DATABASE superstore_db;
USE superstore_db;

-- Creating Table 
CREATE TABLE superstore_sales (
    Row_ID INT,
    Order_ID VARCHAR(25),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(30),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(50),
    Segment VARCHAR(20),
    Country VARCHAR(30),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(10),
    Region VARCHAR(20),
    Product_ID VARCHAR(30),
    Category VARCHAR(30),
    Sub_Category VARCHAR(30),
    Product_Name VARCHAR(150),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Year INT,
    Month INT,
    Month_Name VARCHAR(15),
    Profit_Margin DECIMAL(10,4)
);

-- Total Revenue & Profit
SELECT 
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore_sales;

-- Sales Trend Over Time
SELECT 
    Year,
    Month,
    ROUND(SUM(Sales),2) AS Monthly_Sales
FROM superstore_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Category Performance
SELECT 
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 10 Products by Revenue
SELECT 
    Product_Name,
    ROUND(SUM(Sales),2) AS Product_Sales
FROM superstore_sales
GROUP BY Product_Name
ORDER BY Product_Sales DESC
LIMIT 10;

-- Regional Profitability
SELECT 
    Region,
    ROUND(SUM(Sales),2) AS Sales,
    ROUND(SUM(Profit),2) AS Profit
FROM superstore_sales
GROUP BY Region
ORDER BY Profit DESC;

-- Low Profit Margin Products
SELECT 
    Product_Name,
    ROUND(AVG(Profit_Margin),2) AS Avg_Margin
FROM superstore_sales
GROUP BY Product_Name
HAVING Avg_Margin < 0
ORDER BY Avg_Margin;

