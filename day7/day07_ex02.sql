(SELECT pi.name, COUNT(*) AS count, 'order' AS action_type 
FROM pizzeria pi
    INNER JOIN menu m ON pi.id = m.pizzeria_id
    INNER JOIN person_order po ON m.id = po.menu_id
GROUP BY pi.name
ORDER BY 3, 2 DESC
LIMIT 3)
    UNION ALL
(SELECT pi.name, COUNT(*) AS count, 'visit' AS action_type 
FROM pizzeria pi
    INNER JOIN person_visits pv ON pi.id = pv.pizzeria_id
GROUP BY pi.name
ORDER BY 3, 2 DESC
LIMIT 3)
ORDER BY action_type;
