SELECT p.address, pi.name, COUNT(*) AS count_of_orders
FROM person p
    JOIN person_order po ON p.id = po.person_id
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
GROUP BY pi.name, p.address
ORDER BY 1, 2;