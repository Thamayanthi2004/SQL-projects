-- College Management System Database

create schema College_data;

use College_data;

-- List of Tables

-- 1. Department
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL,
    HOD VARCHAR(100),
    Establishment_date DATE
);

-- 2. Course
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_name VARCHAR(100) NOT NULL,
    Duration INT,
    Credits INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

-- 3. Hostel
CREATE TABLE Hostel (
    Hostel_ID INT PRIMARY KEY,
    Hostel_name VARCHAR(100) NOT NULL,
    Capacity INT,
    Warden_name VARCHAR(100)
);

-- 4. Student
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Address VARCHAR(255),
    Phone_no VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Enrollment_date DATE,
    Department_ID INT,
    Hostel_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Hostel_ID) REFERENCES Hostel(Hostel_ID)
);

-- 5. Faculty
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Qualification VARCHAR(100),
    Specialization VARCHAR(100),
    Salary DECIMAL(10, 2),
    Phone_no VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

-- 6. Subject
CREATE TABLE Subject (
    Subject_ID INT PRIMARY KEY,
    Subject_name VARCHAR(100) NOT NULL,
    Credits INT,
    Semester INT,
    Course_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- 7. Exam
CREATE TABLE Exam (
    Exam_ID INT PRIMARY KEY,
    Exam_name VARCHAR(100) NOT NULL,
    Date DATE,
    Time TIME,
    Duration INT,
    Subject_ID INT,
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)
);

-- 8. Classroom
CREATE TABLE Classroom (
    Room_no VARCHAR(10) PRIMARY KEY,
    Capacity INT,
    Type VARCHAR(20)
);

-- 9. Library
CREATE TABLE Library (
    Library_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Capacity INT,
    No_of_books INT,
    Librarian_name VARCHAR(100)
);

-- 10. Book
CREATE TABLE Book (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100),
    ISBN VARCHAR(13) UNIQUE,
    Publication_year INT,
    Library_ID INT,
    FOREIGN KEY (Library_ID) REFERENCES Library(Library_ID)
);

-- 11. Event
CREATE TABLE Event (
    Event_ID INT PRIMARY KEY,
    Event_name VARCHAR(100) NOT NULL,
    Date DATE,
    Venue VARCHAR(100),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

-- 12. Fees
CREATE TABLE Fees (
    Fee_ID INT PRIMARY KEY,
    Student_ID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Fee_type VARCHAR(50) NOT NULL,
    Due_date DATE,
    Payment_status VARCHAR(20),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

-- 13. Student_Course (Enrollment)
CREATE TABLE Student_Course (
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    PRIMARY KEY (Student_ID, Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- 14. Student_Exam
CREATE TABLE Student_Exam (
    Student_ID INT,
    Exam_ID INT,
    Score DECIMAL(5, 2),
    PRIMARY KEY (Student_ID, Exam_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID)
);

-- 15. Faculty_Subject
CREATE TABLE Faculty_Subject (
    Faculty_ID INT,
    Subject_ID INT,
    PRIMARY KEY (Faculty_ID, Subject_ID),
    FOREIGN KEY (Faculty_ID) REFERENCES Faculty(Faculty_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subject(Subject_ID)
);

-- 16. Student_Event
CREATE TABLE Student_Event (
    Student_ID INT,
    Event_ID INT,
    PRIMARY KEY (Student_ID, Event_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

-- 17. Book_Taken
CREATE TABLE Book_Taken (
    Taken_ID INT PRIMARY KEY,
    Student_ID INT,
    Book_ID INT,
    Borrow_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

-- Departments
INSERT INTO Department (Department_ID, Department_name, HOD, Establishment_date) VALUES
(1, 'Computer Science', 'Dr. Alan Turing', '2000-09-01'),
(2, 'Electrical Engineering', 'Dr. Nikola Tesla', '2001-09-01'),
(3, 'Mechanical Engineering', 'Dr. Isaac Newton', '2002-09-01'),
(4, 'Civil Engineering', 'Dr. Leonardo da Vinci', '2003-09-01'),
(5, 'Physics', 'Dr. Albert Einstein', '2004-09-01'),
(6, 'Mathematics', 'Dr. Srinivasa Ramanujan', '2005-09-01'),
(7, 'Chemistry', 'Dr. Marie Curie', '2006-09-01'),
(8, 'Biology', 'Dr. Charles Darwin', '2007-09-01'),
(9, 'Economics', 'Dr. Adam Smith', '2008-09-01'),
(10, 'Psychology', 'Dr. Sigmund Freud', '2009-09-01');

-- Courses
INSERT INTO Course (Course_ID, Course_name, Duration, Credits, Department_ID) VALUES
(1, 'Bachelor of Computer Science', 8, 120, 1),
(2, 'Bachelor of Electrical Engineering', 8, 130, 2),
(3, 'Bachelor of Mechanical Engineering', 8, 128, 3),
(4, 'Bachelor of Civil Engineering', 8, 126, 4),
(5, 'Bachelor of Physics', 6, 110, 5),
(6, 'Bachelor of Mathematics', 6, 112, 6),
(7, 'Bachelor of Chemistry', 6, 114, 7),
(8, 'Bachelor of Biology', 6, 116, 8),
(9, 'Bachelor of Economics', 6, 108, 9),
(10, 'Bachelor of Psychology', 6, 106, 10);

-- Hostels
INSERT INTO Hostel (Hostel_ID, Hostel_name, Capacity, Warden_name) VALUES
(1, 'Tesla', 200, 'Mr. John Nash'),
(2, 'Rolls-Royce', 150, 'Ms. Marie Curie'),
(3, 'Lamborghini', 180, 'Mr. Stephen Hawking'),
(4, 'Tesla', 160, 'Mr. John Nash'),          
(5, 'Rolls-Royce', 190, 'Ms. Marie Curie'),   
(6, 'Lamborghini', 170, 'Mr. Stephen Hawking'), 
(7, 'Tesla', 140, 'Mr. John Nash'),     
(8, 'Rolls-Royce', 130, 'Ms. Marie Curie'),   
(9, 'Lamborghini', 120, 'Mr. Stephen Hawking'), 
(10, 'Tesla', 110, 'Mr. John Nash');       

-- Students
INSERT INTO Student (Student_ID, Name, DOB, Address, Phone_no, Email, Enrollment_date, Department_ID, Hostel_ID) VALUES
(1, 'Alice Johnson', '2000-05-15', '123 Main St, Techville', '555-1234', 'alice@email.com', '2020-09-01', 1, 1),
(2, 'Bob Smith', '2001-07-20', '456 Oak Rd, Engineeringtown', '555-5678', 'bob@email.com', '2020-09-01', 2, 2),
(3, 'Charlie Brown', '2000-03-10', '789 Pine Ave, Mechanicsville', '555-9012', 'charlie@email.com', '2020-09-01', 3, 3),
(4, 'Diana Prince', '2001-11-30', '321 Elm St, Constructionville', '555-3456', 'diana@email.com', '2020-09-01', 4, 4),
(5, 'Ethan Hunt', '2000-09-05', '654 Birch Ln, Physicsburgh', '555-7890', 'ethan@email.com', '2020-09-01', 5, 5),
(6, 'Fiona Gallagher', '2001-02-15', '987 Maple Dr, Mathtown', '555-2345', 'fiona@email.com', '2020-09-01', 6, 6),
(7, 'George Jetson', '2000-12-20', '147 Spruce Rd, Chemville', '555-6789', 'george@email.com', '2020-09-01', 7, 7),
(8, 'Hannah Montana', '2001-08-25', '258 Cedar Ave, Biotown', '555-0123', 'hannah@email.com', '2020-09-01', 8, 8),
(9, 'Ian Malcolm', '2000-06-30', '369 Walnut St, Econoville', '555-4567', 'ian@email.com', '2020-09-01', 9, 9),
(10, 'Julia Child', '2001-04-05', '741 Chestnut Ln, Psych City', '555-8901', 'julia@email.com', '2020-09-01', 10, 10);

-- Faculty
INSERT INTO Faculty (Faculty_ID, Name, Qualification, Specialization, Salary, Phone_no, Email, Department_ID) VALUES
(1, 'Dr. Grace Hopper', 'PhD', 'Computer Programming', 90000.00, '555-2468', 'grace@college.edu', 1),
(2, 'Prof. James Maxwell', 'PhD', 'Electromagnetic Theory', 85000.00, '555-1357', 'maxwell@college.edu', 2),
(3, 'Dr. Robert Hook', 'PhD', 'Mechanical Systems', 88000.00, '555-3690', 'hook@college.edu', 3),
(4, 'Prof. Isambard Brunel', 'PhD', 'Structural Engineering', 87000.00, '555-1470', 'brunel@college.edu', 4),
(5, 'Dr. Erwin Schrödinger', 'PhD', 'Quantum Mechanics', 92000.00, '555-2580', 'schrodinger@college.edu', 5),
(6, 'Prof. Ada Lovelace', 'PhD', 'Algorithmic Theory', 89000.00, '555-3692', 'lovelace@college.edu', 6),
(7, 'Dr. Linus Pauling', 'PhD', 'Chemical Bonding', 86000.00, '555-4703', 'pauling@college.edu', 7),
(8, 'Prof. Rosalind Franklin', 'PhD', 'Molecular Biology', 88000.00, '555-5814', 'franklin@college.edu', 8),
(9, 'Dr. Paul Samuelson', 'PhD', 'Microeconomics', 84000.00, '555-6925', 'samuelson@college.edu', 9),
(10, 'Prof. Carl Jung', 'PhD', 'Analytical Psychology', 83000.00, '555-7036', 'jung@college.edu', 10);

-- Subjects
INSERT INTO Subject (Subject_ID, Subject_name, Credits, Semester, Course_ID) VALUES
(1, 'Introduction to Programming', 4, 1, 1),
(2, 'Circuit Theory', 4, 1, 2),
(3, 'Thermodynamics', 4, 2, 3),
(4, 'Structural Analysis', 4, 2, 4),
(5, 'Quantum Physics', 4, 3, 5),
(6, 'Linear Algebra', 4, 1, 6),
(7, 'Organic Chemistry', 4, 2, 7),
(8, 'Genetics', 4, 3, 8),
(9, 'Microeconomics', 4, 1, 9),
(10, 'Cognitive Psychology', 4, 2, 10);

-- Exams
INSERT INTO Exam (Exam_ID, Exam_name, Date, Time, Duration, Subject_ID) VALUES
(1, 'Programming Midterm', '2024-10-15', '09:00:00', 120, 1),
(2, 'Circuit Theory Final', '2024-12-20', '14:00:00', 180, 2),
(3, 'Thermodynamics Quiz', '2024-11-05', '10:30:00', 60, 3),
(4, 'Structural Analysis Practical', '2024-11-25', '13:00:00', 240, 4),
(5, 'Quantum Physics Midterm', '2024-10-30', '09:00:00', 120, 5),
(6, 'Linear Algebra Final', '2024-12-10', '14:00:00', 180, 6),
(7, 'Organic Chemistry Lab Test', '2024-11-15', '10:00:00', 180, 7),
(8, 'Genetics Midterm', '2024-10-25', '09:00:00', 120, 8),
(9, 'Microeconomics Quiz', '2024-11-10', '11:00:00', 60, 9),
(10, 'Cognitive Psychology Final', '2024-12-15', '14:00:00', 180, 10);

-- Classrooms
INSERT INTO Classroom (Room_no, Capacity, Type) VALUES
('CS101', 50, 'Lecture'),
('EE201', 40, 'Lab'),
('ME301', 45, 'Lecture'),
('CE401', 35, 'Lab'),
('PH501', 60, 'Lecture'),
('MA601', 55, 'Lecture'),
('CH701', 30, 'Lab'),
('BI801', 40, 'Lab'),
('EC901', 70, 'Lecture'),
('PS001', 65, 'Lecture');

-- Library
INSERT INTO Library (Library_ID, Name, Capacity, No_of_books, Librarian_name) VALUES
(1, 'Central Library', 500, 50000, 'Ms. Marian Librarian'),
(2, 'Science Library', 300, 30000, 'Mr. Dewey Decimal'),
(3, 'Engineering Library', 400, 40000, 'Ms. Bookworm Smith'),
(4, 'Arts Library', 250, 25000, 'Mr. Page Turner'),
(5, 'Medical Library', 200, 20000, 'Dr. Reading Goodfellow'),
(6, 'Law Library', 150, 15000, 'Ms. Justice Books'),
(7, 'Business Library', 180, 18000, 'Mr. Money Reads'),
(8, 'Music Library', 100, 10000, 'Ms. Melody Notes'),
(9, 'Architecture Library', 120, 12000, 'Mr. Blueprint Reader'),
(10, 'Digital Library', 1000, 100000, 'Dr. Online Bookman');

-- Books
INSERT INTO Book (Book_ID, Title, Author, ISBN, Publication_year, Library_ID) VALUES
(1, 'Introduction to Algorithms', 'Cormen et al.', '9780262033848', 2009, 1),
(2, 'Electric Circuits', 'Nilsson & Riedel', '9780133760033', 2014, 1),
(3, 'Fundamentals of Physics', 'Halliday & Resnick', '9781118230718', 2013, 2),
(4, 'Organic Chemistry', 'Clayden et al.', '9780199270293', 2012, 2),
(5, 'Calculus', 'James Stewart', '9781285740621', 2015, 3),
(6, 'Principles of Economics', 'N. Gregory Mankiw', '9781285165875', 2014, 3),
(7, 'Introduction to Psychology', 'James W. Kalat', '9781305271555', 2016, 4),
(8, 'Campbell Biology', 'Lisa A. Urry et al.', '9780134093413', 2016, 4),
(9, 'Engineering Mechanics', 'Russell C. Hibbeler', '9780133918922', 2015, 5),
(10, 'Data Structures and Algorithms in Java', 'Robert Lafore', '9780672324536', 2002, 5);

-- Events
INSERT INTO Event (Event_ID, Event_name, Date, Venue, Department_ID) VALUES
(1, 'Tech Symposium', '2024-11-10', 'Main Auditorium', 1),
(2, 'Engineering Fair', '2024-11-15', 'College Grounds', 2),
(3, 'Physics Colloquium', '2024-11-20', 'Physics Seminar Hall', 5),
(4, 'Math Olympiad', '2024-11-25', 'Mathematics Building', 6),
(5, 'Chemistry Expo', '2024-11-30', 'Chemistry Labs', 7),
(6, 'Biology Research Day', '2024-12-05', 'Biology Conference Room', 8),
(7, 'Economic Forum', '2024-12-10', 'Economics Lecture Hall', 9),
(8, 'Psychology Workshop', '2024-12-15', 'Psychology Department', 10),
(9, 'Hackathon', '2024-12-20', 'Computer Science Labs', 1),
(10, 'Robotics Competition', '2024-12-25', 'Engineering Workshop', 2);

-- Fees
INSERT INTO Fees (Fee_ID, Student_ID, Amount, Fee_type, Due_date, Payment_status) VALUES
(1, 1, 5000.00, 'Tuition', '2024-09-30', 'Paid'),
(2, 2, 5000.00, 'Tuition', '2024-09-30', 'Pending'),
(3, 3, 5000.00, 'Tuition', '2024-09-30', 'Paid'),
(4, 4, 5000.00, 'Tuition', '2024-09-30', 'Paid'),
(5, 5, 4500.00, 'Tuition', '2024-09-30', 'Pending'),
(6, 6, 4500.00, 'Tuition', '2024-09-30', 'Paid'),
(7, 7, 4500.00, 'Tuition', '2024-09-30', 'Paid'),
(8, 8, 4500.00, 'Tuition', '2024-09-30', 'Pending'),
(9, 9, 4000.00, 'Tuition', '2024-09-30', 'Paid'),
(10, 10, 4000.00, 'Tuition', '2024-09-30', 'Paid');

-- Student_Course (Enrollments)
INSERT INTO Student_Course (Student_ID, Course_ID, Enrollment_Date) VALUES
(1, 1, '2020-09-01'),
(2, 2, '2020-09-01'),
(3, 3, '2020-09-02'),
(4, 4, '2020-09-03'),
(5, 5, '2020-09-04'),
(6, 6, '2020-09-05'),
(7, 7, '2020-09-06'),
(8, 8, '2020-09-07'),
(9, 9, '2020-09-08'),
(10, 10, '2020-09-09');

-- Student_Exam
INSERT INTO Student_Exam (Student_ID, Exam_ID, Score) VALUES
(1, 1, 85.5),
(2, 2, 78.0),
(3, 3, 92.0),
(4, 4, 88.5),
(5, 5, 75.0),
(6, 6, 83.0),
(7, 7, 90.5),
(8, 8, 79.0),
(9, 9, 88.0),
(10, 10, 95.0);

-- Faculty_Subject
INSERT INTO Faculty_Subject (Faculty_ID, Subject_ID) VALUES
(1, 1),
(1, 2), 
(2, 2),
(2, 3), 
(3, 3),
(3, 4), 
(4, 4),
(4, 5),
(5, 5),
(5, 6),  
(6, 6),
(6, 7),  
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(10, 1);

-- Student_Event
INSERT INTO Student_Event (Student_ID, Event_ID) VALUES
(1, 1),
(1, 2),  
(2, 2),
(2, 3), 
(3, 3),
(3, 4), 
(4, 4),
(5, 5),
(6, 6),
(6, 7), 
(7, 7),
(8, 8),
(9, 9),
(9, 10), 
(10, 10);

-- Book_Taken
INSERT INTO Book_Taken (Taken_ID, Student_ID, Book_ID, Borrow_Date, Due_Date, Return_Date) VALUES
(1, 1, 1, '2024-09-10', '2024-09-24', NULL),
(2, 2, 2, '2024-09-12', '2024-09-26', '2024-09-25'),
(3, 3, 3, '2024-09-15', '2024-09-29', NULL),
(4, 4, 4, '2024-09-16', '2024-09-30', '2024-09-28'),
(5, 5, 5, '2024-09-18', '2024-10-02', '2024-10-01'),
(6, 6, 6, '2024-09-19', '2024-10-03', NULL),
(7, 7, 7, '2024-09-20', '2024-10-04', '2024-10-03'),
(8, 8, 8, '2024-09-21', '2024-10-05', NULL),
(9, 9, 9, '2024-09-22', '2024-10-06', '2024-10-05'),
(10, 10, 10, '2024-09-23', '2024-10-07', NULL);

-- 1. List all the students with their department and hostel information
SELECT s.Student_ID, s.Name, d.Department_name, h.Hostel_name
FROM Student s
JOIN Department d ON s.Department_ID = d.Department_ID
JOIN Hostel h ON s.Hostel_ID = h.Hostel_ID;

-- 2. Show all the courses with their respective department
SELECT c.Course_ID, c.Course_name, d.Department_name
FROM Course c
JOIN Department d ON c.Department_ID = d.Department_ID;

-- 3. List all the faculty members with their department and subjects they teach
SELECT f.Name AS Faculty_Name, d.Department_name, s.Subject_name
FROM Faculty f
JOIN Department d ON f.Department_ID = d.Department_ID
JOIN Faculty_Subject fs ON f.Faculty_ID = fs.Faculty_ID
JOIN Subject s ON fs.Subject_ID = s.Subject_ID;

-- 4. Show all the students enrolled in a specific course
SELECT s.Name AS Student_Name, c.Course_name
FROM Student s
JOIN Student_Course sc ON s.Student_ID = sc.Student_ID
JOIN Course c ON sc.Course_ID = c.Course_ID
WHERE c.Course_name = 'Bachelor of Computer Science';

-- 5. Display the exam results for all students
SELECT s.Name AS Student_Name, e.Exam_name, se.Score
FROM Student s
JOIN Student_Exam se ON s.Student_ID = se.Student_ID
JOIN Exam e ON se.Exam_ID = e.Exam_ID;

-- 6. List all the books borrowed by students
SELECT s.Name AS Student_Name, b.Title AS Book_Title, bl.Borrow_Date, bl.Due_Date, bl.Return_Date
FROM Student s
JOIN Book_Taken bl ON s.Student_ID = bl.Student_ID
JOIN Book b ON bl.Book_ID = b.Book_ID;

-- 7. Show all the events and the departments organizing them
SELECT e.Event_name, d.Department_name
FROM Event e
JOIN Department d ON e.Department_ID = d.Department_ID;

-- 8. Display the fee information for all students
SELECT s.Name AS Student_Name, f.Amount, f.Fee_type, f.Due_date, f.Payment_status
FROM Student s
JOIN Fees f ON s.Student_ID = f.Student_ID;
