SELECT
    name AS object_name,
	1 AS priority
FROM
    person
UNION ALL
SELECT
    pizza_name AS object_name,
	2 AS priority
FROM
    menu
ORDER BY
	priority,
    object_name;