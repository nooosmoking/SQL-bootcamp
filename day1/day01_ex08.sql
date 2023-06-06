SELECT order_date, CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order po(primary_id, id, menu_id, order_date) NATURAL INNER JOIN person p
ORDER BY order_date, person_information