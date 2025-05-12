CREATE DATABASE IF NOT EXISTS studentrecordsdb;
USE student_records_db;

CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    enrollment_date DATE NOT NULL
);

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL
);

CREATE TABLE Instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course_Instructor (
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    PRIMARY KEY (course_id, instructor_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id) ON DELETE CASCADE
);

CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);