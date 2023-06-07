
WITH p_id AS(SELECT po.person_id AS id
    FROM person_order po INNER JOIN menu m ON  m.id = po.menu_id
    WHERE m.pizza_name = 'pepperoni pizza'
    INTERSECT
    SELECT po.person_id
    FROM person_order po INNER JOIN menu m ON  m.id = po.menu_id
    WHERE m.pizza_name = 'cheese pizza')
SELECT p.name
FROM person p INNER JOIN p_id USING(id)
WHERE p.gender = 'female'
ORDER BY 1;
