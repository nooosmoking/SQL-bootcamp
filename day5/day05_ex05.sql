CREATE INDEX idx_person_order_order_date
ON person_order(person_id, menu_id, order_date);

SET enable_seqscan = OFF;
explain analyze
SELECT * 
FROM person_order
WHERE order_date = '2022-01-01'