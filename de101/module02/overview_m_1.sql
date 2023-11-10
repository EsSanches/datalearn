--общим объемом продаж

SELECT 
round(SUM(sales + quantity), 2) as total_sales
FROM dl.orders;

--общая прибыль

SELECT 
round(SUM(profit), 2) as total_profit
FROM dl.orders;

--коэффициент прибыли

SELECT 
round(SUM(profit) / SUM(sales), 2)
FROM orders;

--прибыль по заказу

select 
order_id,
profit
from dl.orders 
order by 2

--продажи по клиентам

select 
customer_name,
quantity,
sum(quantity) as total_quantity
from dl.orders 
group by 1, 2

--ежемесячные продажи по сегментам

SELECT 
segment,
DATE_TRUNC('month', order_date)::date as group_month, 
sum(sales) as sum_sales
from orders
group by 2, 1
order by 2, 1

--ежемесячные продажи по категориям продуктов

select 
category,
DATE_TRUNC('month', order_date)::date as group_month,
sum(sales) as sum_sales
from dl.orders 
group by 2, 1
order by 2, 1

--продажи и прибыль по клиентам

SELECT 
customer_name,
round(SUM(sales + quantity), 2) as total_sales,
round(sum(profit + quantity), 2) as total_profit
FROM dl.orders
group by 1
order by 2

--рейтинг клиентов

select *,
RANK() OVER(ORDER BY total_sales desc) as rank_customers
from (
select 
customer_id,
customer_name,
round(SUM(Sales + quantity), 2) as total_sales
from dl.orders 
group by 1, 2
) as rank

--продажи по регионам

SELECT state, SUM(sales), COUNT(sales)
FROM orders
GROUP BY state

--продажи по регионам (продажи по менеджерам)

select 
p.person,
round(sum(sales + quantity), 2) as total_sales,
count(sales) as quantity_sales
from dl.orders o
left join dl.people p 
on o.region = p.region 
group by 1
order by 2


select 
region,
round(sum(sales + quantity), 2) as total_sales,
count(sales) as quantity_sales
from dl.orders 
group by 1
order by 2

