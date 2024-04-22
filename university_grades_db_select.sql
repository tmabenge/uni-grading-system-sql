SELECT u.first_name, u.last_name, c.course_code, a.title, a.due_date
FROM users u
JOIN enrollments e ON u.id = e.student_id
JOIN courses c ON e.course_id = c.id
JOIN assignments a ON c.id = a.course_id
LEFT JOIN grades g ON a.id = g.assignment_id AND u.id = g.student_id
WHERE a.due_date < GETDATE() AND g.id IS NULL; 

SELECT c.course_code, c.course_name, AVG(g.points_earned * 1.0 / a.max_points) AS average_grade, COUNT(DISTINCT e.student_id) AS num_students
FROM courses c
LEFT JOIN assignments a ON c.id = a.course_id
LEFT JOIN grades g ON a.id = g.assignment_id
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.course_code, c.course_name;