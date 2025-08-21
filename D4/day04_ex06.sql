drop materialized view if exists mv_dmitriy_visits_and_eats;

create materialized view mv_dmitriy_visits_and_eats as
select pizzeria.name as pizzeria_name, menu.pizza_name, menu.price
from person
JOIN person_visits ON person.id = person_visits.person_id
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy'
    AND person_visits.visit_date = '2022-01-08'
    AND menu.price < 800
ORDER BY 1, 2;

SELECT * FROM mv_dmitriy_visits_and_eats;
