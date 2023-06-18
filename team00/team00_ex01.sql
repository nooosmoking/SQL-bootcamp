WITH RECURSIVE TSP(one, two, price_sum) AS (
	SELECT * FROM nodes WHERE point1 = 'A'
	
	UNION ALL
	
	SELECT CONCAT(one, nodes.point1) AS one, point2 AS two, price_sum + price AS price_sum
	FROM TSP, nodes
	WHERE (
		CASE 
			WHEN LENGTH(one) < (SELECT count(DISTINCT point1) - 1 FROM nodes) 
				THEN point1 = two AND POSITION(point2 IN one) = 0
			WHEN LENGTH(one) = (SELECT count(DISTINCT point1) - 1 FROM nodes)
				THEN point1 = two AND point2 = 'A'
		END
	)
)

SELECT price_sum AS total_cost, regexp_split_to_array(LOWER(CONCAT(one, two)), '') AS tour FROM TSP
WHERE LENGTH(one) = (SELECT count(DISTINCT point1) FROM nodes)
ORDER BY 1 ASC, 2 ASC;
