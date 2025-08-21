select 
	p.name, 
	m.pizza_name, 
	m.price, 
	round(m.price * (1 - pd.discount/100), 0) as discount_price,
	pz.name as pizzeria_name
from person_order po
join menu m on po.menu_id = m.id
join pizzeria pz on m.pizzeria_id =  pz.id
join person p on po.person_id = p.id
join person_discounts pd on po.person_id = pd.person_id and m.pizzeria_id = pd.pizzeria_id
order by 1, 2;