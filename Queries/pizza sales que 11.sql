--Calculate the percentage contribution of each pizza type to total revenue.


With revenue as 
(select pt.category, sum(od.quantity*p.price) as individual_revenue
from pizza_types as pt
join pizzas as p on p.pizza_type_id=pt.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.category
)
select revenue.category, round(((individual_revenue/total_revenue)*100)::numeric,2) as percentage_contribution
from revenue, (select sum(individual_revenue) as total_revenue from revenue) as total_revenue 
order by percentage_contribution desc