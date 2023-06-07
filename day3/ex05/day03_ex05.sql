WITH andrey_ids AS (SELECT id FROM person WHERE name = 'Andrey')
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
         LEFT JOIN person_order ON person_visits.visit_date = person_order.order_date
         JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE person_visits.person_id IN (SELECT * FROM andrey_ids)
  AND person_order.person_id IS NULL
ORDER BY pizzeria_name;
