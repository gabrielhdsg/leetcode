# Write your MySQL query statement below
SELECT w.id
FROM Weather w
JOIN Weather c ON DATEDIFF(w.recordDate, c.recordDate) = 1
WHERE w.temperature > c.temperature