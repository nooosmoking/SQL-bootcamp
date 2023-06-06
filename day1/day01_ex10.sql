SELECT p.name AS person_name, m.pizza_name AS pizza_name, pi.name AS pizzeria_name
FROM person AS p
    JOIN person_order AS po ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
ORDER BY person_name, pizza_name, pizzeria_name