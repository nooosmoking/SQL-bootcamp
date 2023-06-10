CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 
    SELECT pi.name
    FROM pizzeria pi INNER JOIN menu m ON pi.id = m.pizzeria_id
    WHERE pi.id IN (SELECT pv.pizzeria_id
    FROM person p INNER JOIN person_visits pv ON p.id = pv.person_id
    WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
    ) AND m.price < 800;

