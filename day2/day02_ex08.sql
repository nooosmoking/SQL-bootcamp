SELECT p.name 
FROM person p 
    INNER JOIN person_order po ON p.id = po.person_id
    INNER JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'male' AND p.address IN ('Moscow', 'Samara') AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC;
