-- Create the database
CREATE DATABASE university_grades_db;
USE university_grades_db;

CREATE TABLE roles (
    id INT IDENTITY PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE users (
    id INT IDENTITY PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    is_active BIT DEFAULT 1,
    created_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    updated_at DATETIME2
);


CREATE TABLE user_roles (
    user_id INT NOT NULL REFERENCES users(id),
    role_id INT NOT NULL REFERENCES roles(id),
    PRIMARY KEY (user_id, role_id)
);


CREATE UNIQUE INDEX IX_users_username ON users (username);
CREATE INDEX IX_users_email ON users (email);


CREATE TABLE courses (
    id INT IDENTITY PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    faculty_id INT REFERENCES users(id),
    semester VARCHAR(20),
    start_date DATE,
    end_date DATE,
    created_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    updated_at DATETIME2
);


CREATE TABLE course_deletion_log (
    id INT IDENTITY PRIMARY KEY,
    course_id INT,
    course_code VARCHAR(20),
    deleted_at DATETIME2 DEFAULT GETDATE()
);


CREATE UNIQUE INDEX IX_courses_course_code ON courses (course_code);
CREATE INDEX IX_courses_faculty_id ON courses (faculty_id);


CREATE TABLE enrollments (
    id INT IDENTITY PRIMARY KEY,
    student_id INT NOT NULL REFERENCES users(id),
    course_id INT NOT NULL REFERENCES courses(id),
    enrollment_date DATE NOT NULL,
    CONSTRAINT FK_enrollments_student_course UNIQUE (student_id, course_id) 
);

CREATE INDEX IX_enrollments_student_id ON enrollments (student_id);
CREATE INDEX IX_enrollments_course_id ON enrollments (course_id);


CREATE TABLE assignments (
    id INT IDENTITY PRIMARY KEY,
    course_id INT NOT NULL REFERENCES courses(id),
    title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATE NOT NULL,
    max_points INT DEFAULT 100, 
    created_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    updated_at DATETIME2
);

CREATE INDEX IX_assignments_course_id ON assignments (course_id);


CREATE TABLE grades (
    id INT IDENTITY PRIMARY KEY,
    student_id INT NOT NULL REFERENCES users(id),
    assignment_id INT NOT NULL REFERENCES assignments(id),
    points_earned INT,
    graded_at DATETIME2,
    feedback TEXT,
    CONSTRAINT FK_grades_student_assignment UNIQUE (student_id, assignment_id) 
);


CREATE INDEX IX_grades_student_id ON grades (student_id);
CREATE INDEX IX_grades_assignment_id ON grades (assignment_id);


