delete from person_visits where visit_date = '2022-02-24';

insert into person_visits(id, person_id, pizzeria_id, visit_date)
values (
	(select max(id) + 1 from person_visits),
	(select id from person where name = 'Denis'),
	(select id from pizzeria where name = 'Dominos'),
	'2022-02-24'
);

insert into person_visits(id, person_id, pizzeria_id, visit_date)
values (	
	(select max(id) + 1 from person_visits),
	(select id from person where name = 'Irina'),
	(select id from pizzeria where name = 'Dominos'),
	'2022-02-24'
);

-- select * from person_visits

select pv.person_id, pe.name, pv.visit_date, pi.name as pizzeria_name
from person_visits pv
join person pe on pv.person_id = pe.id
join pizzeria pi on pi.id = pv.pizzeria_id
order by visit_date desc;