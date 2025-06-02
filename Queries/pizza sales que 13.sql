-- Determine thr top 3 most ordered pizza types based on revenue for each pizza category

With rank_table as 
(With cat_rev as 
(select pt.category, pt.name, sum(p.price*od.quantity) as revenue
from pizza_types as pt
join pizzas as p on p.pizza_type_id=pt.pizza_type_id
join order_details as od on od.pizza_id=p.pizza_id
group by pt.category, pt.name
)
select category, name, revenue, rank() over (partition by category order by revenue desc) as top_ranks
from cat_rev
)
select category, name, revenue, top_ranks
from rank_table
where top_ranks<=3

