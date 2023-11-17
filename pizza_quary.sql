create database pizza_DB;
use pizza_DB;
show tables;
select*from pizza_sales;
select sum(total_price) as total_revenue from pizza_sales;
select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales;
select sum(quantity) as total_pizza_sold from pizza_sales;
select count(distinct order_id) as total_order from pizza_sales;
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order FROM pizza_sales;
SELECT HOUR(order_time) as order_hours, SUM(quantity) as total_pizzas_sold
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);
SELECT WEEK(STR_TO_DATE(order_date, '%m-%d-%y'), 3) AS WeekNumber,YEAR(STR_TO_DATE(order_date, '%m-%d-%y')) AS Year,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales WHERE order_date IS NOT NULL AND STR_TO_DATE(order_date, '%m-%d-%y') IS NOT NULL
GROUP BY WeekNumber,Year
ORDER BY Year, WeekNumber;
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
order by PCT desc;
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
select pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5 ;
select pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc
limit 5 ;













