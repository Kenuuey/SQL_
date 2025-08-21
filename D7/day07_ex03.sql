with visits as (
	select pz.name, count(*) as count, 'visits' as action_type
	from person_visits pv
	join pizzeria pz on pv.pizzeria_id = pz.id
	group by pz.name
),
orders as (
	select pz.name, count(*) as count, 'order' as action_type
    from person_order po
    join menu m on po.menu_id = m.id
    join pizzeria pz on m.pizzeria_id = pz.id
	group by pz.name
)

select name, sum(count) as total_count 
from (
	select * from visits    
    UNION ALL
  	select * from orders
  ) as combined_data
group by name
order by 2 desc, 1 asc;