create or replace view v_price_with_discount as
select 
	pe.name, 
	m.pizza_name, 
	m.price, 
	CAST(m.price * 0.9 AS INT) as discount_price
from person pe
join person_order po on pe.id = po.person_id
join menu m on menu_id = m.id
order by 1, 2;

select * from v_price_with_discount