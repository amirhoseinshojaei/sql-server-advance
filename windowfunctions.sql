SELECT *
FROM Sales.Orders;


-- find the total sales across all orders
SELECT 
	SUM(Sales) TotalSales
FROM Sales.Orders;



-- find the total sales for each product
SELECT 
	ProductID,
	SUM(Sales) AS TotalSales	
FROM Sales.Orders
GROUP BY ProductID;

-- find the total sales across all orders, additionally provide details such order id and order date
SELECT 
	OrderID,
	OrderDate,
	SUM(Sales) OVER() TotalSales
FROM Sales.Orders;

-- find the total sales for each product, additionally provide details such order id and order date

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID ) TotalSales
FROM Sales.Orders;

-- find the total sales for each combination of product and order date
SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER (PARTITION BY ProductID, OrderDate) TotalSales
FROM Sales.Orders
;

/* Rank each order base ontheir sales from highest to lowest,
additionally provide details such order id and order date */

SELECT 
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders
;