WITH summed_money AS (SELECT user_id, type, SUM(money) AS result
                      FROM balance
                      WHERE user_id = balance.user_id
                        AND type = balance.type
                      GROUP BY user_id, type),
     last_rate_to_usd AS (SELECT currency_id, rate_to_usd
                          FROM currency
                                   JOIN balance b ON currency.id = b.currency_id
                          WHERE id = b.currency_id
                            AND currency.updated = (SELECT MAX(updated) FROM currency WHERE id = b.currency_id))

SELECT COALESCE(u.name, 'not defined')           AS name,
       COALESCE(u.lastname, 'not defined')       AS lastname,
       balance.type,
       sm.result                                 AS volume,
       COALESCE(c.name, 'not defined')           AS currency_name,
       COALESCE(lrtu.rate_to_usd, 1)             AS last_rate_to_usd,
       sm.result * COALESCE(lrtu.rate_to_usd, 1) AS total_volume_in_usd
FROM balance
         FULL JOIN "user" u ON u.id = balance.user_id
         FULL JOIN currency c ON balance.currency_id = c.id
         FULL JOIN summed_money sm ON balance.user_id = sm.user_id AND balance.type = sm.type
         FULL JOIN last_rate_to_usd lrtu ON balance.currency_id = lrtu.currency_id
GROUP BY u.name, u.lastname, balance.type, balance.currency_id, c.name, sm.result, lrtu.rate_to_usd
ORDER BY NAME DESC, lastname, balance.type;