WITH pv AS (SELECT person_id, COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1
LIMIT 4)
SELECT p.name, pv.count_of_visits
FROM pv INNER JOIN person p ON pv.person_id = p.id
ORDER BY 2 DESC, 1