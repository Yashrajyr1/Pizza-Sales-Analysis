--Identify the most common pizza size ordered

select p.size, count(od.order_id) as total_orders
from order_details as od
join pizzas as p 
on od.pizza_id=p.pizza_id
group by size
order by total_orders desc
limit 1