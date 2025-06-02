-- Determine the distribution of orders by hour of the day
select * from orders

select extract(hour from time) as hour , count(order_id) as total_orders
from orders
group by hour
order by total_orders desc