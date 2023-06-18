DROP TABLE IF EXISTS nodes;

CREATE TABLE IF NOT EXISTS nodes 
( 
	point1 VARCHAR NOT NULL,
	point2 VARCHAR NOT NULL,
	price NUMERIC NOT NULL
);

INSERT INTO nodes (point1, point2, price)
VALUES ('A', 'B', 10),
('B', 'A', 10),
('A', 'C', 15),
('C', 'A', 15),
('A', 'D', 20),
('D', 'A', 20),
('B', 'D', 25),
('D', 'B', 25),
('B', 'C', 35),
('C', 'B', 35),
('D', 'C', 30),
('C', 'D', 30);

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
), CTE AS (
	SELECT price_sum, regexp_split_to_array(LOWER(CONCAT(one, two)), '') AS tour FROM TSP
	WHERE LENGTH(one) = (SELECT count(DISTINCT point1) FROM nodes) --AND price_sum = (SELECT MIN(price_sum) FROM TSP)
	ORDER BY 1 ASC, 2 ASC 
)

SELECT * FROM CTE
WHERE price_sum = (SELECT MIN(price_sum) FROM CTE)
