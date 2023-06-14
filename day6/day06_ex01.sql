INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
WITH person_amount AS (SELECT person_id, COUNT(*) AS amount FROM person_order
GROUP BY person_id)
SELECT  row_number() over () as id, po.person_id, m.pizzeria_id, CASE WHEN pa.amount = 1 THEN 10.5
            WHEN pa.amount = 2 THEN 22
            ELSE 30
       END AS discount
FROM person_order po 
    INNER JOIN person_amount pa ON po.person_id = pa.person_id
    INNER JOIN menu m ON po.menu_id = m.id