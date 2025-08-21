SELECT m.pizza_name, m.price, pi.name AS pizzeria_name
FROM menu m
JOIN pizzeria pi ON pi.id = m.pizzeria_id
WHERE NOT EXISTS (
	SELECT 1
	FROM person_order po
	WHERE po.menu_id = m.id
)
ORDER BY 1, 2;