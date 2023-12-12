# Pizza_sales

![Pizza_sales Dashboard](https://github.com/AhlGalz28/Pizza_sales/assets/153435542/367dd668-c512-40d0-9712-17f80927785f)

### Project Overview

This project highlights the patterns in weekly and monthly pizza sales and provides insight into the sales performance of pizza over the years. Make a data-driven recommendation and learn about the company's performance by examining various areas of sales data.

### Data Source

Sales Data: The primary dataset used for this analysis is the "pizza_sales.csv" file, contianing detailed information about each sale made by the company.

### Tools
- MS Excel- Data Cleaning [Download Here](https://www.microsoft.com/en/microsoft-365/excel)
- Sql Server- Data analysis [Download Here](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms)
- PowerBI- Data report [Download Here](https://powerbi.microsoft.com/en-us/downloads/)

### Data Cleaning/Preparation
For the initial preparation phase, I performed the following Task:

1. Data loading and transformation
2. Handling Missing data 
3. Data cleaning and formatting - removes the duplicates data and do an appropriate format in order dates and order time.

### Exploratory Data Analysis

This is the key questions involved in EDA, such as:

- What is the total revenue trend?
- What is the Average Order value?
- How many total orders?
- Which top/Bottom 5 pizzas in terms of sales?
- what is the average pizza per orders?
- what is the sale percentage per pizza category?

### Data Analysis

Include some interesting Codes/Features worked with

```Sql
SELECT pizza_size , CAST(SUM(total_price) as DECIMAL(10,2)) as total_revenue, CAST(SUM(total_price) / 
	(SELECT SUM(total_price) FROM pizza_db.dbo.pizza_sales)*100 as DECIMAL(10,2)) AS PCT
FROM pizza_db.dbo.pizza_sales
GROUP by  pizza_size
order by pizza_size asc;
```
![Sql_query1](https://github.com/AhlGalz28/Pizza_sales/assets/153435542/783525c6-8b23-43ec-b9f2-b53d50fe5d3e)

```Sql
SELECT TOP 5 pizza_name , CAST(SUM(total_price) as DECIMAL(10,2)) as revenue
FROM pizza_db.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC;
```
![sql_query2](https://github.com/AhlGalz28/Pizza_sales/assets/153435542/f83ddc2e-d1d0-4d9a-9d5e-a1c0a2fcfd59)

```sql
SELECT DATENAME(MONTH,order_date) as month_name , COUNT(DISTINCT(order_id)) as total_orders
FROM pizza_db.dbo.pizza_sales
GROUP BY DATENAME(MONTH,order_date);
```
![slq_query3](https://github.com/AhlGalz28/Pizza_sales/assets/153435542/936a58ec-8401-4ec1-b63f-4c72b7b66306)

```sql
SELECT DATENAME(DW,order_date) AS order_Day, COUNT(DISTINCT(order_id)) AS total_order
FROM pizza_db.dbo.pizza_sales
GROUP BY DATENAME(DW,order_date);
```
![sql_query4](https://github.com/AhlGalz28/Pizza_sales/assets/153435542/30f41ac2-cae9-4140-b60d-279c8d99cd41)

### Results/findings

The analysis results are outlined below:

- The largest revenue was acquired in July, however revenue was decreased in the middle of third quarter of the year.
- The Classic Pizza got the highest-performance in terms of revenue in overall pizza category.
- The busiest days for pizza orders were Friday and Saturday.
- Large size pizza contributed to 45.89% of sales.

### Recommendation

On the analysis, I recommend the following:

- In the third quarter of the year, continue to invest in promotion and marketing of pizza.
- Keep focus on promote the Top 5 pizza during peak sales season to maximize the sales.
- Keep up your productivity to fulfill all orders throughout the busiest days.



