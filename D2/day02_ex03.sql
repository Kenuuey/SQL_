WITH date_series AS (
    SELECT day::date AS missing_date 
	FROM generate_series(timestamp '2022-01-01', '2022-01-10', '1 day') AS day
),
visited_dates AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)

SELECT ds.missing_date
FROM date_series AS ds
LEFT JOIN visited_dates AS vd
ON ds.missing_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY 1;