WITH pizza1 AS (SELECT pi.name AS pizzeria_name_1, m.pizza_name, m.price, pizzeria_id
    FROM pizzeria pi INNER JOIN menu m ON pi.id = m.pizzeria_id),
    pizza2 AS (SELECT pi.name AS pizzeria_name_2, m.pizza_name, m.price, pizzeria_id
    FROM pizzeria pi INNER JOIN menu m ON pi.id = m.pizzeria_id)

SELECT p1.pizza_name, pizzeria_name_1,pizzeria_name_2, p1.price
FROM pizza1 p1
    INNER JOIN pizza2 p2 ON p1.pizza_name = p2.pizza_name AND p1.pizzeria_id > p2.pizzeria_id
WHERE p1.price = p2.price
ORDER BY 1