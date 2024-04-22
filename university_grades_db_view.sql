CREATE VIEW StudentGradebook AS
SELECT c.course_code, c.course_name, a.title, a.due_date, g.points_earned, a.max_points, g.feedback
FROM users u
JOIN enrollments e ON u.id = e.student_id
JOIN courses c ON e.course_id = c.id
JOIN assignments a ON c.id = a.course_id
LEFT JOIN grades g ON a.id = g.assignment_id AND u.id = g.student_id
WHERE u.id = USER_ID();

GO

CREATE VIEW FacultyCourseRoster AS
SELECT c.course_code, c.course_name, u.first_name, u.last_name, u.email, e.enrollment_date
FROM courses c
JOIN enrollments e ON c.id = e.course_id
JOIN users u ON e.student_id = u.id
WHERE c.faculty_id = USER_ID();














