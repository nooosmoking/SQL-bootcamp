WITH float AS (
    SELECT id, CAST(age AS numeric (7,2)) AS age
    FROM person
)
SELECT address,
       ROUND((MAX(float.age)-(min(float.age)/max(float.age))), 2) AS formula,
       ROUND(AVG(float.age), 2) AS average,
       ROUND((MAX(float.age)-(min(float.age)/max(float.age))), 2) > round(avg(float.age), 2) AS comparison
FROM person
    INNER JOIN float  ON float.id = person.id
GROUP BY address
ORDER BY 1;