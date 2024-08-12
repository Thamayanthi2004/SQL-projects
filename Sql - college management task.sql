CREATE DATABASE StudentManageSystem;

USE StudentManageSystem;              

CREATE TABLE StudentsDetails (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    Firstname VARCHAR(100),
    Lastname VARCHAR(100),
    gender ENUM('Male', 'Female'),
    age INT,
    course VARCHAR(50),
    year_of_study INT,
    hostel_id INT
);


INSERT INTO StudentsDetails (Firstname, Lastname, Gender, Age, Course, Year_of_study) 
VALUES 
('Arjun','Aadhitya', 'male', 21, 'Information Technology', 4),
('Kiara','Advani', 'Female', 20, 'Information Technology', 3),
('Kaviraj','Mani', 'Male', 20, 'Computer Science', 3),
('MadhanRaj','Sekar', 'Male', 21, 'Computer Science', 4),
('Dharanisri','Raman', 'Female', 19, 'Computer Science', 2),
('Jayasri','Seenu', 'Female', 20, 'Information Technology', 3),
('Thamayanthi','Jayaprakash', 'Female', 19, 'Information Technology', 2),
('Devisri','Sadhasivam', 'Female', 19, 'Information Technology', 2),
('Viji','Subhramani', 'Female', 18, 'AI&DS', 1),
('Deepa','Selvakumar', 'Female', 18, 'AI&DS', 1),
('Saiarun','Kavin', 'Male', 20, 'AI&DS',3),
('Aarumugam','Pandi', 'Male', 20, 'AI&DS', 3),
('Bharath','Jayaprakash', 'Male', 19, 'AI&DS', 2),
('sakthivel','Govindh', 'Male', 18, 'ECE', 1),
('Harith','Raja', 'Male', 20, 'Agriculture', 3),
('Kavitha','Krishnan', 'Female', 20, 'Agriculture', 3),
('Aaliyasamira','Hussain', 'Female', 19, 'Agriculture', 2),
('Agalya','Naveen', 'Female', 19, 'Agriculture', 2),
('Anitha','Palaniyappan', 'Female', 19, 'ECE', 2),
('Saran','Thangarajan', 'male', 21, 'BioMedical', 4),
('Thanya','Arjun', 'Female', 20, 'Biomedical', 3),
('Abisheik','Karthik', 'Male', 20, 'Information Technology', 3);

CREATE TABLE Fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES StudentsDetails(student_id)
);

INSERT INTO Fees (student_id, amount, due_date, status, payment_date) VALUES
(1, 500.00, '2024-09-01', 'Paid', '2024-08-15'),
(2, 650.00, '2024-09-05', 'Unpaid', NULL),
(3, 700.00, '2024-09-10', 'Paid', '2024-08-20'),
(4, 450.00, '2024-09-15', 'Unpaid', NULL),
(5, 500.00, '2024-09-20', 'Paid', '2024-08-25'),
(6, 300.00, '2024-09-25', 'Overdue', NULL),
(7, 550.00, '2024-09-01', 'Paid', '2024-08-28'),
(8, 600.00, '2024-09-05', 'Unpaid', NULL),
(9, 700.00, '2024-09-10', 'Paid', '2024-08-30'),
(10, 800.00, '2024-09-15', 'Paid', '2024-09-01'),
(11, 350.00, '2024-09-20', 'Unpaid', NULL),
(12, 400.00, '2024-09-25', 'Overdue', NULL),
(13, 500.00, '2024-09-01', 'Paid', '2024-08-10'),
(14, 750.00, '2024-09-05', 'Paid', '2024-08-15'),
(15, 650.00, '2024-09-10', 'Unpaid', NULL),
(16, 600.00, '2024-09-15', 'Paid', '2024-09-02'),
(17, 850.00, '2024-09-20', 'Unpaid', NULL),
(18, 950.00, '2024-09-25', 'Overdue', NULL),
(19, 850.00, '2024-09-01', 'Paid', '2024-08-12'),
(20, 700.00, '2024-09-05', 'Paid', '2024-08-22'),
(21, 450.00, '2024-09-10', 'Unpaid', NULL),
(22, 500.00, '2024-09-25', 'Paid', '2024-09-06');

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    instructor VARCHAR(100) NOT NULL
);

INSERT INTO Course (course_name, course_code, department, credits, instructor)
VALUES
('Introduction to Computer Science', 'CS101', 'Computer Science', 3, 'Dr. A. Shalina'),
('Data Structures', 'CS201', 'Computer Science', 4, 'Dr. M. Aarav'),
('Operating Systems', 'CS401', 'Computer Science', 3, 'Dr. S. Ramio'),
('Database Systems', 'CS501', 'Computer Science', 3, 'Dr. N. Siva'),
('Artificial Intelligence', 'CS601', 'Computer Science', 4, 'Dr. A. Velu'),
('Machine Learning', 'CS701', 'Computer Science', 4, 'Dr. V. Reddy'),
('Discrete Mathematics', 'CS102', 'Mathematics', 3, 'Dr. P. Chandravel'),
('Linear Algebra', 'MTH201', 'Mathematics', 3, 'Dr. T. Belly'),
('Calculus', 'MTH101', 'Mathematics', 3, 'Dr. J. Petter'),
('Physics I', 'PHY101', 'Physics', 4, 'Dr. S. Ranvirkapoor'),
('Physics II', 'PHY102', 'Physics', 4, 'Dr. D. Menon'),
('Chemistry I', 'CHE101', 'Chemistry', 3, 'Dr. R. Iyer'),
('Chemistry II', 'CHE102', 'Chemistry', 3, 'Dr. K. Sneha'),
('Organic Chemistry', 'CHE201', 'Chemistry', 4, 'Dr. N. Yadav'),
('Physical Chemistry', 'CHE301', 'Chemistry', 4, 'Dr. S. Dravid'),
('Introduction to Economics', 'ECO101', 'Economics', 3, 'Dr. M. Mukeshjee'),
('Microeconomics', 'ECO201', 'Economics', 3, 'Dr. L. Rolex'),
('Macroeconomics', 'ECO301', 'Economics', 3, 'Dr. S. Bose'),
('Financial Accounting', 'ACC101', 'Accounting', 4, 'Dr. P. Rao'),
('Introduction to Psychology', 'PSY101', 'Psychology', 3, 'Dr. R. Joshi'),
('Developmental Psychology', 'PSY201', 'Psychology', 3, 'Dr. D. Gupta');

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    publisher VARCHAR(255),
    year_of_publication INT,
    available_copies INT
);

INSERT INTO Books (title, author, publisher, year_of_publication, available_copies)
VALUES
('Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', 2009, 5),
('Clean Code', 'Robert C. Martin', 'Prentice Hall', 2008, 10),
('The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', 1999, 7),
('Design Patterns', 'Erich Gamma', 'Addison-Wesley', 1994, 3),
('Code Complete', 'Steve McConnell', 'Microsoft Press', 2004, 8),
('Refactoring', 'Martin Fowler', 'Addison-Wesley', 1999, 4),
('The Art of Computer Programming', 'Donald Knuth', 'Addison-Wesley', 1968, 2),
('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 'CareerCup', 2015, 12),
('Head First Design Patterns', 'Eric Freeman', 'O\'Reilly Media', 2004, 6),
('Effective Java', 'Joshua Bloch', 'Addison-Wesley', 2008, 9),
('You Don\'t Know JS', 'Kyle Simpson', 'O\'Reilly Media', 2015, 11),
('JavaScript: The Good Parts', 'Douglas Crockford', 'O\'Reilly Media', 2008, 5),
('Eloquent JavaScript', 'Marijn Haverbeke', 'No Starch Press', 2014, 10),
('Python Crash Course', 'Eric Matthes', 'No Starch Press', 2016, 7),
('Automate the Boring Stuff with Python', 'Al Sweigart', 'No Starch Press', 2015, 8),
('Fluent Python', 'Luciano Ramalho', 'O\'Reilly Media', 2015, 4),
('Learning Python', 'Mark Lutz', 'O\'Reilly Media', 2013, 6),
('Python Cookbook', 'David Beazley', 'O\'Reilly Media', 2013, 5),
('Compilers: Principles, Techniques, and Tools', 'Alfred V. Aho', 'Pearson', 2006, 4);

CREATE TABLE Library (
    Issue_ID VARCHAR(100) PRIMARY KEY,
    student_id INT,
    book_ID INT,
    Issue_date DATE,
    Return_date DATE
);

INSERT INTO Library (Issue_ID, Student_id, Book_ID, Issue_date, Return_date)
VALUES
('1A2B', 1, 1, '2024-08-01', '2024-08-15'),
('1B2C', 2, 2, '2024-08-02', '2024-08-16'),
('1E3F',3, 3, '2024-08-05', '2024-08-19'),
('1G2G',4, 4, '2024-08-06', '2024-08-20'),
('1G2H',5, 5, '2024-08-07', '2024-08-21'),
('1H2I',6, 6, '2024-08-08', '2024-08-22'),
('1I2J',7, 7, '2024-08-09', '2024-08-23'),
('1J2K',8, 8, '2024-08-10', '2024-08-24'),
('1K2L',9, 9, '2024-08-11', '2024-08-25'),
('1L2M',12, 12, '2024-08-12', '2024-08-26'),
('1M2N',13, 13, '2024-08-13', '2024-08-27'),
('1N2O',14, 14, '2024-08-14', '2024-08-28'),
('1O2P',15, 15, '2024-08-15', '2024-08-29'),
('1P2Q',16, 16, '2024-08-16', '2024-08-30'),
('1Q2R',17, 17, '2024-08-17', '2024-08-31'),
('1R2S',18, 18, '2024-08-18', '2024-09-01'),
('1S2T',19, 19, '2024-08-19', '2024-09-02'),
('1T2U',20, 20, '2024-08-20', '2024-09-03'),
('1U2V',21, 21, '2024-08-21', '2024-09-04'),
('1V2W',22, 22, '2024-08-22', '2024-09-05'),
('1W2X',23, 23, '2024-08-23', '2024-09-06'),
('1X2Y',24, 24, '2024-08-24', '2024-09-07'),
('1Y2Z',25, 25, '2024-08-25', '2024-09-08'),
('1Z2A',26, 26, '2024-08-26', '2024-09-09'),
('2DCE', 27, 27, '2024-08-30', '2024-09-13');

CREATE TABLE Hostel (
    hostel_id INT AUTO_INCREMENT PRIMARY KEY,
    hostel_name VARCHAR(100),
    hostel_type ENUM('Boys', 'Girls')
);

INSERT INTO Hostel (hostel_name, hostel_type)
VALUES
('Boys Hostel 1', 'Boys'),
('Girls Hostel 1', 'Girls'),
('Boys Hostel 2', 'Boys'),
( 'Girls Hostel 2', 'Girls'),
('Boys Hostel 3', 'Boys'),
('Girls Hostel 3', 'Girls'),
( 'Boys Hostel 4', 'Boys'),
( 'Girls Hostel 4', 'Girls'),
('Boys Hostel 5', 'Boys'),
( 'Girls Hostel 5', 'Girls'),
( 'Boys Hostel 6', 'Boys'),
( 'Girls Hostel 6', 'Girls'),
( 'Boys Hostel 7', 'Boys'),
( 'Girls Hostel 7', 'Girls'),
( 'Boys Hostel 8', 'Boys'),
( 'Girls Hostel 8', 'Girls'),
( 'Boys Hostel 9', 'Boys'),
( 'Girls Hostel 9', 'Girls'),
( 'Boys Hostel 10', 'Boys'),
('Girls Hostel 10', 'Girls'),
('Girls Hostel 15', 'Girls');


ALTER TABLE StudentsDetails
ADD FOREIGN KEY (hostel_id) REFERENCES Hostel(hostel_id);


 -- Student Fee Status
SELECT 
    sd.student_id,
    sd.Firstname,
    sd.Lastname,
    sd.course,
    sd.year_of_study,
    f.amount,
    f.due_date,
    f.status
FROM 
    StudentsDetails sd
JOIN 
    Fees f ON sd.student_id = f.student_id
WHERE 
    f.status IN ('Unpaid', 'Overdue')
ORDER BY 
    f.due_date;





    --  Department-wise Student Count
    SELECT 
    course AS Department,
    COUNT(*) AS StudentCount
FROM 
    StudentsDetails
GROUP BY 
    course
ORDER BY 
    StudentCount DESC, Department;
