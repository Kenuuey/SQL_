select pi.name as pizzeria_name
from pizzeria pi
where exists (
	select 1
	from person_visits pv
	join person pe on pv.person_id = pe.id
	where pe.name = 'Andrey' and pv.pizzeria_id = pi.id
)
and not exists (
	select 1
	from person_order po
	join person pe on po.person_id = pe.id
	where pe.name = 'Andrey' and po.menu_id IN (
		select m.id
		from menu m
		where m.pizzeria_id = pi.id
	) 
)
order by pizzeria_name;