SELECT DATE(all_days.day) AS missing_date
FROM 
    (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS day) all_days 
        LEFT JOIN  (SELECT visit_date, person_id  FROM person_visits WHERE person_id = 1 OR person_id = 2) pv 
        ON all_days.day = pv.visit_date
WHERE pv.person_id IS NULL;
