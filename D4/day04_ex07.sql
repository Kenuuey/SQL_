insert into person_visits (id, person_id, pizzeria_id, visit_date)
select
	(select COALESCE(max(id), 0) + 1 from person_visits),
	(select id from person where name = 'Dmitriy'),
	(select pizzeria_id from menu m
	 join pizzeria pz on m.pizzeria_id = pz.id
	 where price < 800 and pz.name != 'Papa Johns' limit 1),
	 '2022-01-08'
where not exists (
    select 1 from person_visits
	where person_id = (select id from person where name = 'Dmitriy')
		and pizzeria_id = (
			select pizzeria_id from menu m
			join pizzeria pz on m.pizzeria_id = pz.id
			where m.price < 800 and pz.name != 'Papa Johns' limit 1)
		and visit_date = '2022-01-08'
);

refresh materialized view mv_dmitriy_visits_and_eats;
select * from mv_dmitriy_visits_and_eats;