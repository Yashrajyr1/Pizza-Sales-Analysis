--Group the orders by date and calculate the average number of pizzas ordered per day.
With date_quantity as 
(select o.date, sum(od.quantity) as total_quantity
from orders as o 
join order_details as od
on o.order_id=od.order_id
group by date
order by date asc
)
select round(avg(total_quantity),0) as avg_num_of_pizzas_per_day 
from date_quantity