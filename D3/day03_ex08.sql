-- delete from person_order
-- where menu_id = (select id from menu where pizza_name = 'sicilian pizza' limit 1);

delete from menu
where pizza_name = 'sicilian pizza';

insert into menu(id, pizzeria_id, pizza_name, price)
values (
	(select max(id) + 1 from menu), 
	(select id from pizzeria where name = 'Dominos'), 	
	'sicilian pizza', 
	900
);

select * from menu