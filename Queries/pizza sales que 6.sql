-- Joins the necessary tabels to find the total quantity of each pizza category ordered

select pt.category, sum(od.quantity) as total_quantity
from pizza_types as pt
join pizzas as p on pt.pizza_type_id=p.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.category
order by total_quantity desc