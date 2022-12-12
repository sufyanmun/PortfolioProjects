-- Creates the database
CREATE DATABASE school;

-- Connect to the database
USE school;

-- Create the students table
CREATE TABLE students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL);

-- Create the courses table
CREATE TABLE courses (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL);

-- Create the enrollments table
CREATE TABLE enrollments (
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_id) REFERENCES courses(id));


-- Inserts student name & email to the students table
INSERT INTO students (id, name, email) 
VALUES (1, 'Sufyan Mun', 'sufyanmun@outlook.com');


-- Inserts course name & description to the course table
INSERT INTO courses (id, name, description) 
VALUES (1, 'Data Science', 'Understanding the foundations of Data Science');


-- Enrolls a student in a course:
INSERT INTO enrollments (student_id, course_id) VALUES (1, 1);

--Lists all courses that a given student is enrolled in
SELECT name
FROM courses 
JOIN enrollments ON courses.id = enrollments.course_id
WHERE enrollments.student_id = 1;

-- List all students who are enrolled in a given course
SELECT students.name
FROM students
JOIN enrollments
ON students.id = enrollments.student_id
WHERE enrollments.course_id = 1;
