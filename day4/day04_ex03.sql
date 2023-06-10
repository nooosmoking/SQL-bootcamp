SELECT generated_date AS missing_date
FROM v_generated_dates gd LEFT JOIN person_visits po 
ON gd.generated_date = po.visit_date
WHERE po.person_id IS NULL
ORDER BY 1