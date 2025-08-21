WITH full_table AS (SELECT * , "user".name AS user_name
FROM balance
FULL JOIN "user" ON balance.user_id = "user".id
LEFT JOIN (SELECT *
FROM
(SELECT MAX (updated), name AS currency_name, id AS id_tmp
FROM currency
GROUP BY name,id) tmp
JOIN currency ON tmp.id_tmp = currency.id AND tmp.max = currency.updated
) tmp_2
ON balance.currency_id = tmp_2.id_tmp
ORDER BY balance.user_id)

SELECT 
	COALESCE(full_table.user_name, 'not defined') AS name,
	COALESCE(full_table.lastname, 'not defined') AS lastname,
	full_table.type,
	SUM(full_table.money) AS volume,
	COALESCE(full_table.currency_name, 'not defined') , 
	COALESCE(full_table.rate_to_usd, 1) AS last_rate_to_usd,
	SUM(full_table.money)*COALESCE(full_table.rate_to_usd, 1) AS total_volume_in_usd
FROM full_table
GROUP BY 
	full_table.user_name,
	full_table.lastname,
	full_table.type,
	full_table.currency_name , 
	full_table.rate_to_usd
ORDER BY name DESC, lastname ASC, full_table.type ASC



