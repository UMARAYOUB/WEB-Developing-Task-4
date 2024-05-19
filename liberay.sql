-- Create Database
CREATE DATABASE IF NOT EXISTS library_management_system;
USE library_management_system;

-- Create Users Table
CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student', 'teacher') NOT NULL,
    status ENUM('active', 'suspended') NOT NULL DEFAULT 'active'
);

-- Create Books Table
CREATE TABLE IF NOT EXISTS Books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    pages INT NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    edition VARCHAR(50) NOT NULL
);

-- Create BorrowedBooks Table
CREATE TABLE IF NOT EXISTS BorrowedBooks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Sample Data for Users
INSERT INTO Users (username, password, role, status) VALUES
('admin', 'adminpassword', 'admin', 'active'),
('student1', 'studentpassword', 'student', 'active'),
('teacher1', 'teacherpassword', 'teacher', 'active');

-- Sample Data for Books
INSERT INTO Books (title, pages, publisher, author, edition) VALUES
('Introduction to Algorithms', 1312, 'MIT Press', 'Thomas H. Cormen', '3rd'),
('Clean Code', 464, 'Prentice Hall', 'Robert C. Martin', '1st'),
('Design Patterns', 395, 'Addison-Wesley', 'Erich Gamma', '1st');

-- Sample Data for BorrowedBooks
INSERT INTO BorrowedBooks (book_id, user_id, borrow_date, return_date) VALUES
(1, 2, '2023-05-01', '2023-05-10'),
(2, 3, '2023-05-02', '2023-05-12');
