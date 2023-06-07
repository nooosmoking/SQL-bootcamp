WITH m_pi AS (SELECT pi.name AS pizzeria_name
    FROM pizzeria pi 
        INNER JOIN person_visits pv ON pi.id = pv.pizzeria_id
        INNER JOIN person p ON p.id = pv.person_id
    WHERE gender = 'male'), 
    f_pi AS (SELECT pi.name AS pizzeria_name
    FROM pizzeria pi 
        INNER JOIN person_visits pv ON pi.id = pv.pizzeria_id
        INNER JOIN person p ON p.id = pv.person_id
    WHERE gender = 'female')

    (SELECT *
    FROM m_pi
    EXCEPT ALL
    SELECT *
    FROM f_pi)
UNION ALL
    (SELECT *
    FROM f_pi
    EXCEPT ALL
    SELECT *
    FROM m_pi)
ORDER BY pizzeria_name