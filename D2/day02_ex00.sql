SELECT p.id AS pizzeria_id, p.name AS pizzeria_name, p.rating
FROM pizzeria p
LEFT JOIN person_visits v
ON p.id = v.pizzeria_id
WHERE v.pizzeria_id IS NULL;