insert into ship_mode 
select 100+row_number() over(), ship_mode from (select distinct ship_mode from orders) as n


INSERT INTO product
SELECT DISTINCT product_id, category, subcategory, product_name
FROM dl.orders;


insert into customer 
select distinct customer_id, customer_name, segment
from dl.orders;


--Замена нулевого значения 

UPDATE orders
SET postal_code = '12345'
WHERE country = 'United States' AND
	city = 'Burlington' AND state = 'Vermont';


insert into geography  
select 10+row_number() over(), country, city, state, region, postal_code from (select distinct country, city, state, region, postal_code from orders) as n;

insert into sales_fact 
(
order_id, 
sales, 
quantity, 
discount, 
profit,
geography_id,
ship_mode_id,
order_date, 
ship_date,
customer_id,
product_id 
)
select distinct
o.order_id, 
o.sales, 
o.quantity, 
o.discount, 
o.profit,
ge.geography_id,
sm.ship_mode_id,
o.order_date, 
o.ship_date,
c.customer_id,
p.product_id 
from dl.orders o
join geography ge
on o.country  = ge.country  
and 
o.city = ge.city 
and 
o.state  = ge.state  
and 
o.region = ge.region 
and 
o.postal_code = ge.postal_code 
join ship_mode sm
on o.ship_mode = sm.ship_mode 
join customer c
on o.customer_name = c.customer_name 
and 
o.segment = c.segment 
join product p
on o.product_name = p.product_name 
and 
o.category = p.category 
and 
o.subcategory = p.subcategory; 


