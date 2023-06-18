--1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE 'Pizza Hut';
--2
select * from pizzeria where name  = 'Pizza Hut';
--1
COMMIT;
--2
select * from pizzeria where name  = 'Pizza Hut';