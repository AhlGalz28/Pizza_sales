--- KPIs---
---calculate the Total_revenue---
SELECT SUM(total_price) AS Total_revenue 
FROM pizza_db.dbo.pizza_sales;

---calculate the average Order Value---
SELECT SUM(total_price)/ COUNT(DISTINCT(order_id)) AS Average_Order_Value
FROM pizza_db.dbo.pizza_sales;

--- calculate Total Pizzas Sold---
SELECT SUM(quantity) as Total_pizza_Sold
FROM pizza_db.dbo.pizza_sales;

---calculate Total Orders---
SELECT COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_db.dbo.pizza_sales;

---calculate Avg. pizzas per Order---
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT (order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_order
FROM pizza_db.dbo.pizza_sales;


---Daily Trends for Total orders---
SELECT DATENAME(DW,order_date) AS order_Day, COUNT(DISTINCT(order_id)) AS total_order
FROM pizza_db.dbo.pizza_sales
GROUP BY DATENAME(DW,order_date);

---Monthly Trends for Total orders---
SELECT DATENAME(MONTH,order_date) as month_name , COUNT(DISTINCT(order_id)) as total_orders
FROM pizza_db.dbo.pizza_sales
GROUP BY DATENAME(MONTH,order_date);

---% of sales by pizza category---
SELECT pizza_category , CAST(SUM(total_price) as DECIMAL(10,2)) as total_revenue, CAST(SUM(total_price) / 
	(SELECT SUM(total_price) FROM pizza_db.dbo.pizza_sales)*100 as DECIMAL(10,2)) AS PCT
FROM pizza_db.dbo.pizza_sales
GROUP by  pizza_category
order by pizza_category asc;

---% of sales by pizza size---
SELECT pizza_size , CAST(SUM(total_price) as DECIMAL(10,2)) as total_revenue, CAST(SUM(total_price) / 
	(SELECT SUM(total_price) FROM pizza_db.dbo.pizza_sales)*100 as DECIMAL(10,2)) AS PCT
FROM pizza_db.dbo.pizza_sales
GROUP by  pizza_size
order by pizza_size asc;

---Total pizzas sold(total quantity sold) by pizza category---
SELECT pizza_category, SUM(quantity) as total_quantities_sold
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_category
ORDER BY total_quantities_sold DESC;

---top5 Pizzas by revenue---
SELECT TOP 5 pizza_name , CAST(SUM(total_price) as DECIMAL(10,2)) as revenue
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC;

---Bottom 5 pizzas by revenue---
SELECT TOP 5 pizza_name , CAST(SUM(total_price) as DECIMAL(10,2)) as revenue
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY revenue asc;

--- Top5 pizzas by Quantity---
SELECT TOP 5 pizza_name, SUM(quantity) as total_quantitieas_sold
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantitieas_sold DESC;

---Bottom 5 pizzas by Quantity---
SELECT TOP 5 pizza_name, SUM(quantity) as total_quantitieas_sold
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantitieas_sold ASC;

---Top 5 pizzas by orders---
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) as total_orders
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC;

---Bottom 5 pizzas by orders---
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) as total_orders
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC;
