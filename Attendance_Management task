-- Attendance Management System Database

create schema Attendance_System;

use Attendance_System;

-- List of Tables

-- 1. Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    enrollment_number VARCHAR(20) UNIQUE,
    department VARCHAR(10),
    year VARCHAR(5),
    gender VARCHAR(10)
);

-- 2. Biometric device Table
CREATE TABLE BiometricDevices (
    device_id INT PRIMARY KEY,
    device_name VARCHAR(50),
    location VARCHAR(100)
);

-- 3. Attendance record Table
CREATE TABLE AttendanceRecords (
    record_id INT PRIMARY KEY,
    student_id INT,
    device_id INT,
    attendance_date DATE,
    attendance_time TIME,
    status VARCHAR(10), -- 'Present' or 'Absent'
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (device_id) REFERENCES BiometricDevices(device_id)
);

-- 4. StudentAttendanceTracking
CREATE TABLE StudentAttendanceTrends (
    trend_id INT PRIMARY KEY,
    student_id INT,
    in_time Time,
    out_time Time,
    total_classes INT,
    present_count INT,
    absent_count INT,
    attendance_percentage DECIMAL(5,2),
    trend_type VARCHAR(10), -- 'Weekly' or 'Monthly'
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 5. Academic years Table
CREATE TABLE AcademicYear (
    academic_year_id INT PRIMARY KEY,
    year_start DATE,
    year_end DATE,
    description VARCHAR(100)
);

-- 6. Year wise Attendance Table
CREATE TABLE YearWiseAttendance (
    yearwise_id INT PRIMARY KEY,
    student_id INT,
    academic_year_id INT,
    total_student INT,
    present_days INT,
    absent_days INT,
    attendance_percentage DECIMAL(5,2),
    present_percentage DECIMAL(5,2),
    absent_percentage DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (academic_year_id) REFERENCES AcademicYear(academic_year_id)
);

-- 7. Department wise Attendance Table
CREATE TABLE DepartmentWiseAttendance (
    departmentwise_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    student_id INT,
    total_student INT,
    present_days INT,
    absent_days INT,
    attendance_percentage DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 8. Month wise Attendance Table
CREATE TABLE MonthWiseAttendance (
    monthwise_id INT PRIMARY KEY,
    student_id INT,
    month INT,
    year INT,
    total_classes INT,
    present_count INT,
    absent_count INT,
    attendance_percentage DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 9. Monthly Attendance Calculation Table
CREATE TABLE MonthlyAttendanceCalculation (
    monthly_calculation_id INT PRIMARY KEY,
    student_id INT,
    month INT,
    year INT,
    total_classes INT,
    present_count INT,
    absent_count INT,
    attendance_percentage DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 10. User roles Table
CREATE TABLE UserRoles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(20),
    description VARCHAR(100)
);

-- List the sample data into Students table
INSERT INTO Students (student_id, first_name, last_name, enrollment_number, department, year, gender)
VALUES
(1, 'John', 'Doe', 'ENR001', 'CS', '2024', 'Male'),
(2, 'Jane', 'Smith', 'ENR002', 'IT', '2024', 'Female'),
(3, 'Michael', 'Johnson', 'ENR003', 'CS', '2023', 'Male'),
(4, 'Emily', 'Davis', 'ENR004', 'EE', '2024', 'Female'),
(5, 'Chris', 'Brown', 'ENR005', 'ME', '2022', 'Male');

-- List the sample data into BiometricDevices table
INSERT INTO BiometricDevices (device_id, device_name, location)
VALUES
(1, 'Device_A', 'Main Entrance'),
(2, 'Device_B', 'Library Entrance'),
(3, 'Device_C', 'Gym Entrance'),
(4, 'Device_D', 'Cafeteria Entrance'),
(5, 'Device_E', 'Admin Block');

-- List the sample data into AttendanceRecords table
INSERT INTO AttendanceRecords (record_id, student_id, device_id, attendance_date, attendance_time, status)
VALUES
(1, 1, 1, '2024-08-01', '08:00:00', 'Present'),
(2, 2, 2, '2024-08-01', '08:05:00', 'Absent'),
(3, 3, 3, '2024-08-01', '08:10:00', 'Present'),
(4, 4, 4, '2024-08-01', '08:15:00', 'Present'),
(5, 5, 5, '2024-08-01', '08:20:00', 'Absent');

-- List the sample data into StudentAttendanceTracking table
INSERT INTO StudentAttendanceTrends (trend_id, student_id, in_time, out_time, total_classes, present_count, absent_count, attendance_percentage, trend_type)
VALUES
(101, 1, '08:00:00', '03:00:00', 5, 4, 1, 80.00, 'Weekly'),
(102, 2, '09:00:00', '04:30:00', 5, 5, 0, 100.00, 'Weekly'),
(103, 3, '08:30:00', '05:00:00', 5, 3, 2, 60.00, 'Weekly'),
(104, 4, '08:50:00', '06:00:00', 20, 18, 2, 90.00, 'Monthly'),
(105, 5, '09:15:00', '05:30:00', 20, 20, 0, 100.00, 'Monthly');

-- List the sample data into AcademicYear table
INSERT INTO AcademicYear (academic_year_id, year_start, year_end, description)
VALUES
(1, '2023-09-01', '2024-06-30', '2023-2024 Academic Year'),
(2, '2024-09-01', '2025-06-30', '2024-2025 Academic Year'),
(3, '2022-09-01', '2023-06-30', '2022-2023 Academic Year'),
(4, '2021-09-01', '2022-06-30', '2021-2022 Academic Year'),
(5, '2020-09-01', '2021-06-30', '2020-2021 Academic Year');

-- List the sample data into YearWiseAttendance table
INSERT INTO YearWiseAttendance (yearwise_id, student_id, academic_year_id, total_student, present_days, absent_days, attendance_percentage, present_percentage, absent_percentage)
VALUES
(1, 1, 1, 30, 22, 8, (22.0 / 30.0) * 100, (22.0 / 30.0) * 100, (8.0 / 30.0) * 100),
(2, 2, 1, 30, 18, 12, (18.0 / 30.0) * 100, (18.0 / 30.0) * 100, (12.0 / 30.0) * 100),
(3, 3, 1, 30, 25, 5, (25.0 / 30.0) * 100, (25.0 / 30.0) * 100, (5.0 / 30.0) * 100),
(4, 4, 1, 30, 20, 10, (20.0 / 30.0) * 100, (20.0 / 30.0) * 100, (10.0 / 30.0) * 100),
(5, 5, 1, 30, 15, 15, (15.0 / 30.0) * 100, (15.0 / 30.0) * 100, (15.0 / 30.0) * 100);

-- List the sample data into DepartmentWiseAttendance table
INSERT INTO DepartmentWiseAttendance (departmentwise_id, department_name, student_id, total_student, present_days, absent_days, attendance_percentage)
VALUES
(1, 'CS', 1, 30, 22, 8, (22.0 / 30.0) * 100),
(2, 'IT', 2, 30, 18, 12, (18.0 / 30.0) * 100),
(3, 'CS', 3, 30, 25, 5, (25.0 / 30.0) * 100),
(4, 'EE', 4, 30, 20, 10, (20.0 / 30.0) * 100),
(5, 'ME', 5, 30, 15, 15, (15.0 / 30.0) * 100);

-- List the sample data into MonthWiseAttendance table
INSERT INTO MonthWiseAttendance (monthwise_id, student_id, month, year, total_classes, present_count, absent_count, attendance_percentage)
VALUES
(1, 1, 8, 2024, 20, 15, 5, (15.0 / 20.0) * 100),
(2, 2, 8, 2024, 20, 10, 10, (10.0 / 20.0) * 100),
(3, 3, 8, 2024, 20, 18, 2, (18.0 / 20.0) * 100),
(4, 4, 8, 2024, 20, 12, 8, (12.0 / 20.0) * 100),
(5, 5, 8, 2024, 20, 8, 12, (8.0 / 20.0) * 100);

-- List the sample data into MonthlyAttendanceCalculation table
INSERT INTO MonthlyAttendanceCalculation (monthly_calculation_id, student_id, month, year, total_classes, present_count, absent_count, attendance_percentage)
VALUES
(1, 1, 8, 2024, 20, 15, 5, (15.0 / 20.0) * 100),
(2, 2, 8, 2024, 20, 10, 10, (10.0 / 20.0) * 100),
(3, 3, 8, 2024, 20, 18, 2, (18.0 / 20.0) * 100),
(4, 4, 8, 2024, 20, 12, 8, (12.0 / 20.0) * 100),
(5, 5, 8, 2024, 20, 8, 12, (8.0 / 20.0) * 100);

-- List the sample data into UserRoles table
INSERT INTO UserRoles (role_id, role_name, description)
VALUES
(1, 'Admin', 'System administrator with full access'),
(2, 'Teacher', 'Instructor with access to teaching materials and student data'),
(3, 'Student', 'Access to personal and academic information'),
(4, 'Registrar', 'Responsible for managing student records and registrations'),
(5, 'IT Support', 'Technical support for system issues');

-- 1. Join Students with Their Attendance Records
SELECT s.first_name, s.last_name, a.attendance_date, a.attendance_time, a.status
FROM Students s
JOIN AttendanceRecords a ON s.student_id = a.student_id;

-- 2. Join Students with Their Biometric Devices
SELECT s.first_name, s.last_name, b.device_name, b.location, a.attendance_date, a.attendance_time, a.status
FROM Students s
JOIN AttendanceRecords a ON s.student_id = a.student_id
JOIN BiometricDevices b ON a.device_id = b.device_id;

-- 3. Join Students with Year-Wise Attendance Details
SELECT s.first_name, s.last_name, ay.description, ywa.total_student, ywa.present_days, ywa.absent_days, ywa.attendance_percentage
FROM Students s
JOIN YearWiseAttendance ywa ON s.student_id = ywa.student_id
JOIN AcademicYear ay ON ywa.academic_year_id = ay.academic_year_id;
