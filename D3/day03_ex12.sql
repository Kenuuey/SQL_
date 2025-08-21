delete from person_order
where order_date = '2022-02-25';

insert into person_order(id, person_id, menu_id, order_date)
select
	(select max(id) from person_order) + gener_id,
	pe.id,
	(select id from menu where pizza_name = 'greek pizza'),
	'2022-02-25'::date
from person pe
join generate_series(1, (select count(*) from person)) as gener_id ON pe.id = gener_id;

select *
from person_order 
order by order_date desc;