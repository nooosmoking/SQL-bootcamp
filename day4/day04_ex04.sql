CREATE VIEW v_symmetric_union AS
    WITH R AS (
        SELECT * FROM person_visits
        WHERE visit_date = '2022-01-02'
    ),
    S AS (
        SELECT * FROM person_visits
        WHERE visit_date = '2022-01-06'
    ),
    q1 AS (SELECT * FROM R
    EXCEPT 
    SELECT * FROM S),
    q2 AS (SELECT * FROM S
    EXCEPT 
    SELECT * FROM R)
    SELECT person_id FROM q1
    UNION 
    SELECT person_id FROM q2
    ORDER BY 1
