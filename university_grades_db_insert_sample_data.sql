
INSERT INTO users (username, password_hash, first_name, last_name, email)
VALUES
    ('alice123', 'hashed_password', 'Alice', 'Johnson', 'alice.johnson@student.edu'),
    ('bob456', 'hashed_password', 'Bob', 'Williams', 'bob.williams@student.edu'),
    ('charlie789', 'hashed_password', 'Charlie', 'Brown', 'charlie.brown@student.edu');

INSERT INTO users (username, password_hash, first_name, last_name, email)
VALUES
    ('profsmith', 'hashed_password', 'Jane', 'Smith', 'jane.smith@faculty.edu'),
    ('profjones', 'hashed_password', 'David', 'Jones', 'david.jones@faculty.edu');


INSERT INTO users (username, password_hash, first_name, last_name, email)
VALUES ('admin', 'hashed_password', 'Admin', 'User', 'admin@university.edu');

INSERT INTO user_roles (user_id, role_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 3);

INSERT INTO courses (course_code, course_name, description, faculty_id, semester, start_date, end_date)
VALUES
    ('CS101', 'Introduction to Computer Science', '...', 4, 'Fall 2023', '2023-08-28', '2023-12-15'),
    ('MATH202', 'Calculus II', '...', 5, 'Fall 2023', '2023-08-28', '2023-12-15'),
    ('HIST105', 'World History', '...', 4, 'Fall 2023', '2023-08-28', '2023-12-15');

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
    (1, 1, GETDATE()),
    (2, 1, GETDATE()),
    (3, 2, GETDATE()),
    (1, 3, GETDATE());


INSERT INTO assignments (course_id, title, description, due_date, max_points)
VALUES
    (1, 'First Programming Assignment', '...', '2023-09-15', 100),
    (1, 'Midterm Exam', '...', '2023-10-20', 150),
    (2, 'Calculus Quiz 1', '...', '2023-09-08', 50),
    (3, 'Historical Analysis Essay', '...', '2023-11-01', 200);

INSERT INTO grades (student_id, assignment_id, points_earned, graded_at, feedback)
VALUES
    (1, 1, 88, GETDATE(), 'Good work!'), 
    (2, 1, 92, GETDATE(), 'Excellent!'),
    (1, 3, 45, GETDATE(), 'Needs improvement.'),
    (1, 4, 180, GETDATE(), 'Well-written and insightful.'); 
