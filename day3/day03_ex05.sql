WITH an_id AS (SELECT id
    FROM person
    WHERE name = 'Andrey')
SELECT pi.name AS pizzeria_name
FROM pizzeria pi
WHERE pi.id IN
    (SELECT pizzeria_id
    FROM person_visits pv INNER JOIN an_id ON pv.person_id = an_id.id
    EXCEPT
    SELECT pizzeria_id
    FROM person_order po 
        INNER JOIN an_id ON po.person_id = an_id.id
        INNER JOIN menu m ON m.id = po.menu_id)