SELECT COALESCE(u.name, 'not defined') AS name, COALESCE(u.lastname, 'not defined') AS lastname, c.name AS currency_name, b.money * COALESCE((SELECT rate_to_usd
    FROM currency c
    WHERE b.currency_id = c.id AND b.updated > c.updated
    ORDER BY c.updated DESC
    LIMIT 1
 ),
 (SELECT rate_to_usd
    FROM currency c
    WHERE b.currency_id = c.id AND b.updated <= c.updated
    ORDER BY c.updated
    LIMIT 1
 )
 ) AS currency_in_usd
FROM "user" u
    RIGHT JOIN balance b ON u.id = b.user_id
    INNER JOIN currency c ON c.id = b.currency_id
GROUP BY b.user_id, b.money, b.updated, u.name, u.lastname, b.currency_id, c.name
ORDER BY 1 DESC, 2, 3