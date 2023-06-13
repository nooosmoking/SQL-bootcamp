CREATE INDEX IF NOT EXISTS idx_person_name
ON person(UPPER(name));

SET enable_seqscan = OFF;
explain analyze
SELECT
FROM person
WHERE UPPER(name) = 'ANNA'