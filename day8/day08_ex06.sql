--1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--1
BEGIN;
--2
BEGIN;
--1
SELECT SUM(rating) FROM pizzeria;
--2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;
--1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
--2
SELECT SUM(rating) FROM pizzeria;