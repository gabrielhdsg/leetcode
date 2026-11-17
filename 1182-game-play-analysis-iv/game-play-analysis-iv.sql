# Write your MySQL query statement below
SELECT ROUND(COUNT(la.player_id)/(SELECT COUNT( distinct player_id) FROM Activity), 2) as fraction
FROM Activity la
INNER JOIN Activity la_after ON 
la.player_id = la_after.player_id AND
DATEDIFF(la_after.event_date, la.event_date) = 1
WHERE la.event_date = (SELECT MIN(a.event_date) FROM Activity a WHERE la.player_id = a.player_id)