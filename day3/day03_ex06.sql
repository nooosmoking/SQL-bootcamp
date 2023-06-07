WITH pizza AS (SELECT pi.name, m.pizza_name, m.price
    FROM pizzeria pi INNER JOIN menu m ON pi.id = m.pizzeria_id),
    pizza1 AS (SELECT * FROM pizza),
    pizza2 AS (SELECT * FROM pizza)

SELECT *
FROM pizzeria p1
    INNER JOIN pizzeria p2 ON p1. = m.
    INNER JOIN 