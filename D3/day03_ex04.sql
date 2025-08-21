with info_ordered_table AS (
	select distinct pi.name as pizzeria_name, pe.gender
	from person_order po
	join menu m on m.id = po.menu_id 
	join pizzeria pi on pi.id = m.pizzeria_id 
	join person pe on pe.id = po.person_id
),
gender_counts as (
	select pizzeria_name, gender, count(*) as gender_count
	from info_ordered_table
	group by pizzeria_name, gender
),
gender_summary as (
	select pizzeria_name,
		MAX(case when gender = 'male' then gender_count else 0 end) as male_count,
		MAX(case when gender = 'female' then gender_count else 0 end) as female_count
	from gender_counts
	group by pizzeria_name
)

select pizzeria_name
from gender_summary
where (male_count = 0 and female_count > 0) or (female_count = 0 and male_count > 0)
order by pizzeria_name;