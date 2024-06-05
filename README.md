# Design DB Model for Guvi Zen Class

This project involves designing a database model for the Guvi Zen class. The database consists of tables for users, students, mentors, topics, tasks, and attendance, with relationships defined using foreign keys.

## Database Structure

### Relationships

## users:

One-to-many relationship with students (one user can be a student).
One-to-many relationship with mentors (one user can be a mentor).
One-to-many relationship with attendance (one user can have multiple attendance records).

## students:

Each student is associated with one user.

## mentors:

Each mentor is associated with one user.
One-to-many relationship with topics (one mentor can have multiple topics).

## topics:

Each topic is associated with one mentor.
One-to-many relationship with tasks (one topic can have multiple tasks).
One-to-many relationship with attendance (one topic can have multiple attendance records).

## tasks:

Each task is associated with one topic.

## attendance:

Each attendance record is associated with one user.
Each attendance record is associated with one topic.
This EER diagram accurately represents the structure and relationships defined in your SQL code. If there are any specific aspects you are concerned about or if you need further details, please let me know!

## Usage

To use this database model, run the SQL script provided to create the database and its tables. Make sure you have the necessary permissions to create and modify databases.

### Tables

```sql
CREATE DATABASE SQL02;
USE SQL02;

-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    createdAt DATETIME
);

-- Students Table
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

-- Mentors Table
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

-- Topics Table
CREATE TABLE topics (
    topic_id INT PRIMARY KEY,
    topic_name VARCHAR(100),
    description TEXT,
    sessions INT,
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);

-- Tasks Table
CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    topic_id INT,
    task_name VARCHAR(100),
    description TEXT,
    deadline DATE,
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id)
);

-- Attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    user_id INT,
    topic_id INT,
    session_date DATE,
    status VARCHAR(255),
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```
