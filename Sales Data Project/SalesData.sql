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

-- RFM Table Creation 
DROP TABLE IF EXISTS #rfm
;WITH rfm AS 
(
	SELECT 
		CUSTOMERNAME, 
		ROUND(SUM(sales), 2) MonetaryValue,
		ROUND(AVG(sales), 2) AvgMonetaryValue,
		COUNT(ORDERNUMBER) Frequency,
		MAX(ORDERDATE) last_ORDER_date,
		(SELECT MAX(ORDERDATE) FROM [PortfolioDB].[dbo].[Sales_Data]) max_ORDER_date,
		DATEDIFF(DD, MAX(ORDERDATE), (SELECT MAX(ORDERDATE) FROM [PortfolioDB].[dbo].[Sales_Data])) Recency_of_Order
	FROM [PortfolioDB].[dbo].[Sales_Data]
	GROUP BY CUSTOMERNAME
),
RFM_Calculation AS
(

	select r.*,
		NTILE(4) OVER (ORDER BY Recency_of_Order desc) RFM_Recency,
		NTILE(4) OVER (ORDER BY Frequency) RFM_Frequency,
		NTILE(4) OVER (ORDER BY MonetaryValue) RFM_Monetary
	from rfm r
)
select 
	s.*, RFM_Recency+ RFM_Frequency+ RFM_Monetary AS rfm_cell,
	CAST(RFM_Recency AS varchar) + CAST(RFM_Frequency AS varchar) + CAST(RFM_Monetary  AS varchar)rfm_cell_string
INTO #rfm
FROM RFM_Calculation s
