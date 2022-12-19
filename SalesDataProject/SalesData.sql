-- Understanding the data

SELECT * FROM Sales_Data

-- Checking unique values 
SELECT DISTINCT status from Sales_Data

-- Data Analysis
-- Seeing which product has the most revenue 
SELECT PRODUCTLINE, ROUND(SUM(SALES),2) AS Revenue FROM Sales_Data GROUP BY PRODUCTLINE ORDER BY 2 DESC

-- Seeing which year had the highest revenue
SELECT YEAR_ID, ROUND(SUM(SALES), 2) AS Revenue FROM Sales_Data GROUP BY YEAR_ID ORDER BY 2 DESC;

-- Which dealsize brought in the most revenue 
SELECT DEALSIZE, ROUND(SUM(SALES), 2) AS Revenue FROM Sales_Data GROUP BY DEALSIZE ORDER BY 2 DESC;

-- Which month brought in the most revenue
SELECT MONTH_ID, YEAR_ID, ROUND(SUM(SALES), 2) AS Revenue, COUNT(ORDERNUMBER) AS Number_of_Orders FROM Sales_Data GROUP BY MONTH_ID, YEAR_ID ORDER BY 3 DESC;
