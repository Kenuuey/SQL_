SELECT
    (SELECT name
    FROM person P
    WHERE P.id = O.person_id
    LIMIT 1) AS person_name
FROM person_order O
WHERE menu_id IN (13, 14, 18)
    AND order_date = '2022-01-07';