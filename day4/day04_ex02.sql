CREATE VIEW v_generated_dates AS
SELECT DISTINCT DATE(generate_series('2022-01-01'::DATE, '2022-01-31'::DATE, '1 day'::interval)) AS generated_date
FROM person
ORDER BY 1;