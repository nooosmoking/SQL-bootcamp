CREATE INDEX IF NOT EXISTS idx_menu_unique
ON menu(pizzeria_id, pizza_name );

SET enable_seqscan = OFF;
explain analyze
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizza_name = 'greek pizza'