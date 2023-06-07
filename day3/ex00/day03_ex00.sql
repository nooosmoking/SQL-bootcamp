WITH kate_ids AS (SELECT id FROM person WHERE name = 'Kate'),
     kate_visits AS (SELECT * FROM person_visits WHERE person_id IN (SELECT * FROM kate_ids))
SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM kate_visits
         JOIN pizzeria ON pizzeria_id = pizzeria.id
         JOIN menu ON kate_visits.pizzeria_id = menu.pizzeria_id
WHERE price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;