# Write your MySQL query statement below
SELECT i.name
FROM Employee m
JOIN Employee i ON m.managerId = i.id
GROUP BY m.managerId,i.name
HAVING COUNT(*) >= 5