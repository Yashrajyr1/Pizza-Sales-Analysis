-- Analyze the cumulative revenue generated over time

With date_revenue as 
(select o.date, sum(price*quantity) as revenue 
from orders as o 
join order_details as od on o.order_id=od.order_id
join pizzas as p on p.pizza_id=od.pizza_id
group by o.date 
)
select date_revenue.date, date_revenue.revenue,
sum(date_revenue.revenue) over (order by date_revenue.date) as cumulative_revenue
from date_revenue
