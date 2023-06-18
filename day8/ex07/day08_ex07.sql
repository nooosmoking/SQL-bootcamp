--1
BEGIN;
--2
BEGIN;
--1
UPDATE pizzeria SET rating = 0 WHERE name = 'Best Pizza';
--2
UPDATE pizzeria SET rating = 0 WHERE name = 'Dominos';
--1
UPDATE pizzeria SET rating = 5 WHERE name = 'Dominos';
--2
UPDATE pizzeria SET rating = 5 WHERE name = 'Best Pizza';
--1
COMMIT;
--1
COMMIT;
