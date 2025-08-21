create or replace function fnc_person_visits_and_eats_on_date(
	pperson varchar default 'Dmitriy',
	pprice int default 500,
	pdate date default '2022-01-08'
)
returns table (
	pizzeria_name varchar
) as $$
begin
	return query
	select pz.name
	from person_visits pv
	join pizzeria pz on pv.pizzeria_id = pz.id
	join menu m on m.pizzeria_id = pz.id
	join person p on pv.person_id = p.id
	where p.name = pperson
	and m.price < pprice
	and pv.visit_date = pdate;
end;
$$ language plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);

select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');