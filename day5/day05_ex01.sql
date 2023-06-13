SET enable_seqscan = OFF;
explain analyze
SELECT m.pizza_name, pi.name AS pizzeria_name
FROM menu m INNER JOIN pizzeria pi ON m.pizzeria_id = pi.id;