SELECT pi.name, COUNT(*) AS count_of_orders, ROUND(AVG(m.price)) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM pizzeria pi
    INNER JOIN menu m ON pi.id = m.pizzeria_id
    INNER JOIN person_order po ON m.id = po.menu_id
GROUP BY pi.name
ORDER BY 1;