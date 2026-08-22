# Write your MySQL query statement below
WITH activity_start as (
    SELECT machine_id, AVG(timestamp) as time
    FROM Activity 
    WHERE activity_type = 'start'
    GROUP BY machine_id
),
activity_end as (
    SELECT machine_id, AVG(timestamp) as time
    FROM Activity 
    WHERE activity_type = 'end'
    GROUP BY machine_id
)

SELECT s.machine_id, CAST((e.time - s.time) as DECIMAL(10,3)) as processing_time
FROM activity_start s
JOIN activity_end e ON s.machine_id = e.machine_id