# Write your MySQL query statement below
with school as (
    SELECT student_id, subject_name, student_name 
    FROM Students 
    LEFT JOIN Subjects ON 1
),
total_examinations as (
    SELECT student_id, subject_name, count(*) as repeated_subjects
    FROM Examinations 
    GROUP BY student_id, subject_name
)

SELECT 
    s.student_id,
    s.student_name,
    s.subject_name,
    CASE 
        WHEN t.repeated_subjects IS NULL THEN 0
        ELSE t.repeated_subjects
    END AS attended_exams 
FROM school s
LEFT JOIN total_examinations t ON t.student_id = s.student_id AND t.subject_name = s.subject_name
WHERE s.subject_name is not null
ORDER BY s.student_id, s.subject_name

