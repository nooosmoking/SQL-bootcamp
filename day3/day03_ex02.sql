SELECT m.pizza_name , m.price, pi.name AS pizzeria_name
FROM pizzeria pi INNER JOIN menu m ON pi.id = m.pizzeria_id
WHERE m.id IN (SELECT id AS menu_id 
    FROM menu
    EXCEPT
    SELECT menu_id 
    FROM person_order
)
ORDER BY m.pizza_name, m.price