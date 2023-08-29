select*
from portfolioproject.pizza_sales;

-- Find out Total Revenue i.e The sum total price of all pizza orders
select sum(total_price) as 'total_price'
from portfolioproject.pizza_sales;

-- Find out Average Order Value i.e The total revenue divided by total count of orders
select sum(total_price)/ count(distinct order_id) as Avg_order
from portfolioproject.pizza_sales;

-- find out Total number of pizzas sold
select sum(quantity) as total_pizza_sold
from portfolioproject.pizza_sales;

-- Find out Total count of orders placed
select count(distinct order_id) as total_orders
from portfolioproject.pizza_sales;

-- Find out Average pizzas per order
select cast( cast( sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal (10,2))
as avg_pizzas_per_order
from portfolioproject.pizza_sales;

-- Daily trend for total orders
select dayname(order_date) as  order_day, count(distinct order_id) as total_orders
from portfolioproject.pizza_sales
group by dayname(order_date)
order by total_orders desc;

-- This brings an error because the data type of the order_date is a text not date so it has to be modified
alter table pizza_sales
modify column order_date date;

-- Monthly trend for total orders
select monthname(order_date) as  order_month, count(distinct order_id) as total_orders
from portfolioproject.pizza_sales
group by monthname(order_date)
order by total_orders desc;

-- % Of sales by pizza category
select pizza_category, sum(total_price) as total_sales, sum(total_price)*100/ (select sum(total_price) from pizza_sales) 
as percentage_of_sales
from portfolioproject.pizza_sales
group by pizza_category;

-- % Of sales by pizza size
select pizza_size, sum(total_price) as total_sales, sum(total_price)*100/ (select sum(total_price) from pizza_sales) 
as percentage_of_sales
from portfolioproject.pizza_sales
group by pizza_size;

-- Total pizzas sold by pizza category
select pizza_category, sum(total_price) as total_sales
from portfolioproject.pizza_sales
group by pizza_category;

-- Top 5 Best Seller by total pizzas sold
select pizza_name, sum(total_price) as total_revenue
from portfolioproject.pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

-- Bottom 5 Worst Seller by total pizzas sold
select pizza_name, sum(total_price) as total_revenue
from portfolioproject.pizza_sales
group by pizza_name
order by total_revenue 
limit 5;

-- Top 5 Best Seller by total pizzas quantity
select pizza_name, sum(quantity) as total_quantity
from portfolioproject.pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;

-- Bottom 5 Worst Seller by total pizzas quantity
select pizza_name, sum(quantity) as total_quantity
from portfolioproject.pizza_sales
group by pizza_name
order by total_quantity 
limit 5;









