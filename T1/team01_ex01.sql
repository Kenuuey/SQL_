SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    COALESCE(
        (SELECT rate_to_usd FROM currency c2
        WHERE b.updated > c2.updated AND c2.name = c.name
        ORDER BY c2.updated DESC LIMIT 1),
        (SELECT rate_to_usd FROM currency c2
        WHERE b.updated < c2.updated AND c2.name = c.name
        ORDER BY c2.updated LIMIT 1)
    ) * b.money AS currency_in_usd
FROM 
    balance b
FULL JOIN 
    "user" u ON u.id = b.user_id
JOIN 
(
    SELECT DISTINCT ON (name) * FROM 
    (SELECT * FROM currency ORDER BY name,id, updated)
    AS tmp
) c ON c.id = b.currency_id
ORDER BY 
    1 DESC, 2, 3;