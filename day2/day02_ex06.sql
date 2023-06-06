SELECT m.pizza_name, pi.name AS pizzeria_name 
FROM menu m INNER JOIN pizzeria pi ON m.pizzeria_id = pi.id
WHERE m.id IN (SELECT po.menu_id
    FROM person_order po INNER JOIN person p ON po.person_id = p.id
    WHERE p.name IN ('Denis', 'Anna'))
ORDER BY 1, 2