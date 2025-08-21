select pizzeria_name
from (
	select p.name as pizzeria_name,
		SUM(CASE WHEN pe.gender = 'female' then 1 else 0 END) as female_visits,
		SUM(CASE WHEN pe.gender = 'male' then 1 else 0 end) as male_visits
	from pizzeria p
	join person_visits pv on p.id = pv.pizzeria_id
	join person pe on pe.id = pv.person_id
	group by p.name
) subquery
where female_visits > male_visits or male_visits > female_visits
order by pizzeria_name;