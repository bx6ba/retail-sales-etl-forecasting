USE superstore_db;

SELECT 
    `Customer ID`, 
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS Frequency,
    SUM(`Sales`) AS Monetary,
    MAX(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS LastOrderDate
FROM `superstore_sales`
GROUP BY `Customer ID`, `Customer Name`;

SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d/%m/%Y'), '%Y-%m') AS MonthYear,
    SUM(`Sales`) AS MonthlySales
FROM `superstore_sales`
GROUP BY MonthYear
ORDER BY MonthYear;

SELECT SUM(`Sales`) AS TotalSales FROM `superstore_sales`;

SELECT COUNT(DISTINCT `Order ID`) AS TotalOrders FROM `superstore_sales`;

SELECT SUM(`Sales`) / COUNT(DISTINCT `Order ID`) AS AverageOrderValue FROM `superstore_sales`;

SELECT COUNT(DISTINCT `Customer ID`) AS TotalCustomers FROM `superstore_sales`;


SELECT 
    `State`, 
    SUM(`Sales`) AS TotalSales
FROM `superstore_sales`
GROUP BY `State`
ORDER BY TotalSales DESC;

SELECT 
    `City`, 
    SUM(`Sales`) AS TotalSales
FROM `superstore_sales`
GROUP BY `City`
ORDER BY TotalSales DESC
LIMIT 10;

SELECT 
    `Region`, `Category`, 
    SUM(`Sales`) AS SalesByRegionCategory
FROM `superstore_sales`
GROUP BY `Region`, `Category`
ORDER BY SalesByRegionCategory DESC;

SELECT 
    `State`,
    AVG(DATEDIFF(
        STR_TO_DATE(`Ship Date`, '%d/%m/%Y'),
        STR_TO_DATE(`Order Date`, '%d/%m/%Y')
    )) AS AvgShippingDays
FROM `superstore_sales`
GROUP BY `State`
ORDER BY AvgShippingDays DESC;

