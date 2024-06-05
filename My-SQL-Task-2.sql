CREATE DATABASE SQL02;
USE SQL02;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    createdAt DATETIME
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    address VARCHAR(100),
    phone_number VARCHAR(10),
    qualification TEXT,
    work_experience TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE mentors (
    mentor_id INT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    address VARCHAR(100),
    phone_number VARCHAR(10),
    qualification TEXT,
    work_experience TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE topics (
    topic_id INT PRIMARY KEY,
    topic_name VARCHAR(100),
    description TEXT,
    sessions INT,
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);

CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    topic_id INT,
    task_name VARCHAR(100),
    description TEXT,
    deadline DATE,
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    user_id INT,
    topic_id INT,
    session_date DATE,
    status VARCHAR(255),
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
