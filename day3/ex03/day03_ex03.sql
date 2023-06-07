WITH visits_gendered AS (SELECT pizzeria.name AS pizzeria_name, gender
                         FROM person_visits
                                  JOIN person ON person_id = person.id
                                  JOIN pizzeria ON pizzeria_id = pizzeria.id),
     male_visited AS (SELECT pizzeria_name FROM visits_gendered WHERE gender = 'male'),
     female_visited AS (SELECT pizzeria_name FROM visits_gendered WHERE gender = 'female')
SELECT *
FROM ((SELECT *
       FROM female_visited
       EXCEPT ALL
       SELECT *
       FROM male_visited)
      UNION ALL
      (SELECT *
       FROM male_visited
       EXCEPT ALL
       SELECT *
       FROM female_visited)) AS gender_pizzerias
ORDER BY pizzeria_name;