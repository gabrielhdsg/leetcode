# Write your MySQL query statement below
WITH total_count AS (
    SELECT user_id, count(action) as total_count
    FROM Confirmations 
    GROUP BY user_id
),
confirmation_count AS (
    SELECT user_id, count(action) as confirmation_count
    FROM Confirmations
    WHERE action = 'confirmed' 
    GROUP BY user_id 
)

SELECT s.user_id,
CASE WHEN (c.user_id IS NULL) THEN 0.00
ELSE ROUND(c.confirmation_count/t.total_count,2)
END AS confirmation_rate
FROM Signups s
LEFT JOIN confirmation_count c ON s.user_id = c.user_id
LEFT JOIN total_count t ON s.user_id = t.user_id