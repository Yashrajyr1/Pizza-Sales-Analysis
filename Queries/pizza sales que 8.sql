-- Join relevant tabels to find the category wise distribution of pizzas

select category, count(name) as total
from pizza_types
group by category
order by total desc

/* select category, name
from pizza_types