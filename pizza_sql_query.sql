--sum of total price of all pizza orders
select sum(total_price) as sum_total from pizza_sales

--average order value
select sum(total_price)/count(distinct order_id) as average_order_value from pizza_sales

--quantity of total pizzas sold
select sum(quantity) as total_pizzas_sold from pizza_sales

--total orders placed
select count(distinct order_id) as total_orders from pizza_sales
--alternate solution
select max(order_id) as total_orders from pizza_sales

--average pizzas per order
select sum(quantity)/count(distinct order_id) as average_pizzas from pizza_sales

--CHART REQUIREMENTS
--daily trend of total orders
select datename(dw, order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by datename(dw, order_date)

--monthly trend of total orders
select datename(month, order_date) as month_name, count(distinct order_id) as total_orders from pizza_sales
group by datename(month, order_date)

--hourly trend of total orders
select datename(HOUR, order_time) as time, count(distinct order_id) as total_orders from pizza_sales
group by datename(hour, order_time)

--percentage of sales by pizza category
select pizza_category,sum(quantity) as total_sales, sum(quantity)*100/ (select sum(quantity) from pizza_sales) as percentage_sales from pizza_sales group by pizza_category
order by 2 desc

--percentage of pizza sales of a particular month (JANUARY)
select pizza_category, sum(quantity) as total_sales, sum(quantity)*100/ (select sum(quantity) from pizza_sales where month(order_date)=1) as percentage_sales from pizza_sales
where month(order_date)=1
group by pizza_category
order by 2 desc
