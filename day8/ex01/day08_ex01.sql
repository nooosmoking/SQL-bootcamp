--1
BEGIN;
--2
BEGIN;
--1
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';
--2
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';
--1
UPDATE pizzeria SET rating = 4 WHERE NAME = 'Pizza Hut';
--2
UPDATE pizzeria SET rating = 3.6 WHERE NAME = 'Pizza Hut';
--1
COMMIT;
--2
COMMIT;
--1
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';
--2
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';