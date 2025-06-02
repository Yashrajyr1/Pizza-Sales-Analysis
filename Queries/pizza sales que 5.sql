--List the top 5 most ordered pizza types along with their quantities

select pt.pizza_type_id, pt.name, sum(od.quantity) as total_quantity
from pizza_types as pt
join pizzas as p on pt.pizza_type_id=p.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.pizza_type_id, pt.name
order by total_quantity desc
limit 5