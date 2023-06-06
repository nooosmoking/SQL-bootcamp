SELECT a.action_date, p.name AS person_name
FROM (SELECT order_date AS action_date, person_id 
    FROM person_order
    INTERSECT
    SELECT visit_date AS action_date, person_id 
    FROM person_visits) a INNER JOIN person p 
ON a.person_id = p.id
ORDER BY a.action_date, person_name DESC