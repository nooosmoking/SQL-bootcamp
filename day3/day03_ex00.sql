SELECT m.pizza_name AS pizza_name, m.price, pi.name AS pizzeria_name, pv.visit_date
FROM person_visits pv 
    INNER JOIN pizzeria pi ON pv.pizzeria_id = pi.id
    INNER JOIN menu m ON m.pizzeria_id = pi.id
WHERE pv.person_id IN (SELECT p.id
    FROM person p
    WHERE p.name = 'Kate')
    AND m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3