INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1, 
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT pi.id
    FROM pizzeria pi INNER JOIN menu m ON pi.id = m.pizzeria_id
    WHERE price < 800
    LIMIT 1
    ),
    '2022-01-08'
    );

