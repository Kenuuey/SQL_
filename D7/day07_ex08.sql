select p.address, pz.name, count(po.id) as count_of_orders 
from person p
join person_order po on po.person_id = p.id
join menu m on m.id = po.menu_id 
join pizzeria pz on pz.id = m.pizzeria_id
group by p.address, pz.name
order by 1, 2;
