WITH all_days AS (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS day),
    pv AS (SELECT visit_date, person_id  FROM person_visits WHERE person_id = 1 OR person_id = 2)
SELECT DATE(all_days.day) AS missing_date
FROM  all_days LEFT JOIN pv 
        ON all_days.day = pv.visit_date
WHERE pv.person_id IS NULL;
