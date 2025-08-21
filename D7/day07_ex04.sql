select p.name, count(pv.id) as count_of_visits
from person p
join person_visits pv on pv.person_id = p.id
group by name
having count (pv.id) > 3