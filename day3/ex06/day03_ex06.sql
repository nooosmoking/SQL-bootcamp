WITH pizza_info1 AS (SELECT pizza_name, pizzeria_id, pizzeria.name AS pizzeria_name, price
                     FROM menu
                              JOIN pizzeria ON menu.pizzeria_id = pizzeria.id),
     pizza_info2 AS (SELECT * FROM pizza_info1)
SELECT pizza_info1.pizza_name    AS pizza_name,
       pizza_info1.pizzeria_name AS pizzeria_name1,
       pizza_info2.pizzeria_name AS pizzeria_name2,
       pizza_info1.price         AS price
FROM pizza_info1
         JOIN pizza_info2 ON pizza_info1.pizza_name = pizza_info2.pizza_name
WHERE pizza_info1.pizzeria_id > pizza_info2.pizzeria_id
  AND pizza_info1.price = pizza_info2.price;
