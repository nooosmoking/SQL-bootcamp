SELECT DISTINCT p.name 
FROM person p 
    INNER JOIN person_order po ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' AND m.pizza_name IN ('pepperoni pizza', 'cheese pizza')
ORDER BY 1;
