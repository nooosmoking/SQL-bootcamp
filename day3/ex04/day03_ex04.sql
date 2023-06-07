WITH orders_gendered AS (SELECT pizzeria.name, gender
                         FROM person_order
                                  JOIN person ON person_id = person.id
                                  JOIN menu ON menu_id = menu.id
                                  JOIN pizzeria ON pizzeria_id = pizzeria.id),
     male_ordered AS (SELECT name FROM orders_gendered WHERE gender = 'male'),
     female_ordered AS (SELECT name FROM orders_gendered WHERE gender = 'female')
SELECT *
FROM ((SELECT *
       FROM female_ordered
       EXCEPT
       SELECT *
       FROM male_ordered)
      UNION
      (SELECT *
       FROM male_ordered
       EXCEPT
       SELECT *
       FROM female_ordered)) AS gender_pizzerias
ORDER BY name;