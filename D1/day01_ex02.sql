SELECT pizza_name
FROM (
	SELECT pizza_name, ROW_NUMBER() OVER (PARTITION BY pizza_name ORDER BY pizza_name) AS row_num
	FROM menu
	) subquery
WHERE row_num = 1
ORDER BY pizza_name DESC;