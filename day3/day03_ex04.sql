WITH m_pi AS (SELECT pi.name AS pizzeria_name
    FROM pizzeria pi 
        INNER JOIN menu m ON m.pizzeria_id = pi.id
        INNER JOIN person_order po ON po.menu_id = m.id
        INNER JOIN person p ON p.id = po.person_id
        
    WHERE gender = 'male'), 
    f_pi AS (SELECT pi.name AS pizzeria_name
    FROM pizzeria pi 
        INNER JOIN menu m ON m.pizzeria_id = pi.id
        INNER JOIN person_order po ON po.menu_id = m.id
        INNER JOIN person p ON p.id = po.person_id
    WHERE gender = 'female')

    (SELECT *
    FROM m_pi
    EXCEPT 
    SELECT *
    FROM f_pi)
UNION
    (SELECT *
    FROM f_pi
    EXCEPT
    SELECT *
    FROM m_pi)
ORDER BY pizzeria_name