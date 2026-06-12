use Superstore
select Top 10 * FROM Superstore_Sales_Data;
SELECT COUNT(*) AS TotalRows  FROM Superstore_Sales_Data;
SELECT OrderID,ProductName,COUNT(*) AS Duplicatecount FROM Superstore_Sales_Data GROUP BY OrderID,ProductName HAVING COUNT(*) >1;
WITH CTE AS (SELECT *,ROW_NUMBER() OVER( PARTITION BY OrderID,ProductName Order by OrderID ) AS rn FROM Superstore_Sales_Data) DELETE FROM CTE WHERE RN >1;
SELECT* FROM Superstore_Sales_Data WHERE Customer IS NULL;
UPDATE Superstore_Sales_Data SET Customer='Unknown' WHERE Customer IS NULL;
SELECT CAST(OrderDATE AS DATE) FROM Superstore_Sales_Data;
SELECT SUM(Sales) AS TotalSales FROM Superstore_Sales_Data;
SELECT SUM(Profit) AS TotalProfit FROM Superstore_Sales_Data;
SELECT Region, SUM(sales) AS TotalSales FROM Superstore_Sales_Data GROUP BY Region ORDER BY TotalSales DESC;
SELECT Category, SUM(Profit) AS TotalProfit FROM Superstore_Sales_Data GROUP BY Category ORDER BY TotalProfit DESC;
SELECT Region, SUM(Profit)as TotalProfit FROM Superstore_Sales_Data GROUP BY Region ORDER BY TotalProfit DESC;
SELECT TOP 10 ProductName,SUM(Sales) AS TotalSales FROM Superstore_Sales_Data GROUP BY ProductName ORDER BY TotalSales DESC;
SELECT YEAR(OrderDate) AS SalesYear,MONTH(OrderDate) AS SalesMonth,SUM(Sales) as Monthlysales from Superstore_Sales_Data WHERE OrderDate IS NOT NULL GROUP BY YEAR(OrderDate),MONTH(OrderDate) ORDER BY SalesYear,SalesMonth;
SELECT Discount,AVG(Profit) AS AvgProfit FROM Superstore_Sales_Data GROUP BY Discount ORDER BY Discount;