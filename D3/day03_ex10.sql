delete from person_order where order_date ='2022-02-24';

insert into person_order (id, person_id, menu_id, order_date)
values (
	(select max(id) + 1 from person_order),
	(select p.id from person p where p.name = 'Denis'),
	(select m.id from menu m where m.pizza_name = 'sicilian pizza'
		and pizzeria_id = (select id from pizzeria where name = 'Dominos')),
	'2022-02-24'
);

insert into person_order(id, person_id, menu_id, order_date)
values (
	(select max(id) + 1 from person_order),
	(select id from person where name = 'Irina'),
	(select id from menu where pizza_name = 'sicilian pizza'
		and pizzeria_id = (select id from pizzeria where name = 'Dominos')),
	'2022-02-24'
);

select *
from person_order
order by order_date desc;