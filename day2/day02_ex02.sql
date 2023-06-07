WITH pv AS (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
SELECT CASE WHEN p.name IS NULL THEN '-'
            ELSE p.name
       END AS person_name, pv.visit_date AS visit_date, CASE WHEN pi.name IS NULL THEN '-'
            ELSE pi.name
       END AS pizzeria_name
FROM pv
    FULL OUTER JOIN person p ON pv.person_id = p.id
    FULL OUTER JOIN pizzeria pi ON pv.pizzeria_id = pi.id

ORDER BY 1, 2, 3
