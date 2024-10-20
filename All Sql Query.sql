## SQL Queries

/* 1. Create Database
The following query is used to create the database:*/

CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;
------------------------------------------------------------------------------
# 2. Create Tables

# Departments Table:
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

# Employees Table:
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

# Salaries Table:
CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(10, 2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

# Attendance Table:
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Leave') NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
------------------------------------------------------------------------------

#3. Insert Data

INSERT INTO Departments (department_name)
VALUES ('HR'), ('Engineering'), ('Sales'), ('Finance');

INSERT INTO Employees (first_name, last_name, email, phone_number, hire_date, department_id, salary)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '2020-01-15', 2, 75000),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2021-03-20', 1, 60000),
('Emily', 'Johnson', 'emily.johnson@example.com', '1112223333', '2019-08-10', 3, 55000);

INSERT INTO Salaries (employee_id, salary_amount, effective_date)
VALUES
(1, 75000, '2020-01-15'),
(2, 60000, '2021-03-20'),
(3, 55000, '2019-08-10');

INSERT INTO Attendance (employee_id, date, status)
VALUES
(1, '2024-10-01', 'Present'),
(2, '2024-10-01', 'Absent'),
(3, '2024-10-01', 'Present');

------------------------------------------------------------------------------
# 4. Retrieve All Employees:

SELECT * FROM Employees;
------------------------------------------------------------------------------
# 5. Find Employees in a Specific Department

SELECT first_name, last_name, department_name 
FROM Employees 
JOIN Departments ON Employees.department_id = Departments.department_id
WHERE department_name = 'Engineering';
------------------------------------------------------------------------------
# 6. Calculate Total Salary Paid by Department

SELECT Departments.department_name, SUM(Employees.salary) AS total_salary
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
GROUP BY Departments.department_name;
------------------------------------------------------------------------------
# 7. Retrieve Attendance of Employees for a Specific Date

SELECT Employees.first_name, Employees.last_name, Attendance.status 
FROM Attendance
JOIN Employees ON Attendance.employee_id = Employees.employee_id
WHERE Attendance.date = '2024-10-01';
------------------------------------------------------------------------------
# 8. Update an Employee's Salary
 
UPDATE Employees
SET salary = 80000
WHERE employee_id = 1;






