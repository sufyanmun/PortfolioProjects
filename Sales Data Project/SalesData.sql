-- Understanding the data

SELECT * FROM [PortfolioDB].[dbo].[Sales_Data]

-- Checking unique values 
SELECT DISTINCT status from [PortfolioDB].[dbo].[Sales_Data]

-- Data Analysis
-- Seeing which product has the most revenue 
SELECT PRODUCTLINE, ROUND(SUM(SALES),2) AS Revenue 
FROM [PortfolioDB].[dbo].[Sales_Data] GROUP BY PRODUCTLINE ORDER BY 2 DESC

-- Seeing which year had the highest revenue
SELECT YEAR_ID, ROUND(SUM(SALES), 2) AS Revenue 
FROM [PortfolioDB].[dbo].[Sales_Data] GROUP BY YEAR_ID ORDER BY 2 DESC;

-- Which dealsize brought in the most revenue 
SELECT DEALSIZE, ROUND(SUM(SALES), 2) AS Revenue 
FROM [PortfolioDB].[dbo].[Sales_Data] GROUP BY DEALSIZE ORDER BY 2 DESC;

-- Which month brought in the most revenue
SELECT MONTH_ID, YEAR_ID, ROUND(SUM(SALES), 2) AS Revenue, COUNT(ORDERNUMBER) AS Number_of_ORDERs 
FROM [PortfolioDB].[dbo].[Sales_Data] GROUP BY MONTH_ID, YEAR_ID ORDER BY 3 DESC;

-- Novemeber, 2004 is the best month out of all the years. Let's see which product sold the best that month
SELECT PRODUCTLINE, MONTH_ID, ROUND(SUM(SALES), 2) AS Revenue, COUNT(ORDERNUMBER) AS Number_of_ORDERs
FROM [PortfolioDB].[dbo].[Sales_Data] WHERE YEAR_ID= 2004 AND MONTH_ID = 11 
GROUP BY MONTH_ID, PRODUCTLINE
ORDER BY 3 DESC;

-- RFM Analysis (Recency, Frequency, Monetary)
SELECT
    CUSTOMERNAME,
    ROUND(SUM(SALES), 2) AS Total_Sales,
    ROUND(AVG(SALES), 2) AS Average_Sales,
    COUNT(ORDERNUMBER) AS Number_of_ORDERs,
    MAX(ORDERDATE) AS Last_ORDER_Date
FROM [PortfolioDB].[dbo].[Sales_Data]
GROUP BY CUSTOMERNAME;
