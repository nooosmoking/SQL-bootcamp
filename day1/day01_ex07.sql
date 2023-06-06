SELECT order_date, CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order po INNER JOIN person p ON po.person_id = p.id
ORDER BY order_date, person_information