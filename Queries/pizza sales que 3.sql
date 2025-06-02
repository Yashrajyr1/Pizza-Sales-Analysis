--Identify the highest priced pizza
select p.pizza_id, p.pizza_type_id, pt.name, pt.category, p.price
from pizzas as p
join pizza_types as pt
on p.pizza_type_id=pt.pizza_type_id
order by p.price desc limit 1

