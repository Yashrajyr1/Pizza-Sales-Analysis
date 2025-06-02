-- Determine the top 3 most ordered pizza types based on revenue

select pt.name, sum(p.price*od.quantity) as revenue
from pizza_types as pt
join pizzas as p on p.pizza_type_id=pt.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.name
order by revenue desc limit 3