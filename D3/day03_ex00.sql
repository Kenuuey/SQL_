SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
FROM person pe
JOIN person_visits pv ON pe.id = pv.person_id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN menu m ON pz.id = m.pizzeria_id
WHERE pe.name = 'Kate'
	AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;