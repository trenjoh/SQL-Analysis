create database d9;
use d9;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    Name_f VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10, 2),
    Ranking VARCHAR(20),
    age INT,
    address VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO Employees (emp_id, Name_f, dept, salary, Ranking, age, address, city)
VALUES 
(1, 'John Doe', 'Engineering', 70000.00, 'Senior Engineer', 30, '123 Maple St.', 'New York'),
(2, 'Jane Smith', 'Marketing', 55000.00, 'Marketing Manager', 28, '456 Oak St.', 'Chicago'),
(3, 'Robert Brown', 'Sales', 62000.00, 'Sales Executive', 35, '789 Pine St.', 'Los Angeles'),
(4, 'Emily Davis', 'HR', 50000.00, 'HR Specialist', 32, '321 Cedar St.', 'Houston'),
(5, 'Michael Johnson', 'Engineering', 80000.00, 'Lead Engineer', 40, '654 Elm St.', 'San Francisco'),
(6, 'Chris White', 'Finance', 75000.00, 'Financial Analyst', 29, '987 Birch St.', 'Boston');

select * from Employees;

create table departmentss(
dept_id int primary key,
dept_name varchar(100),
dept_location varchar(100)
);
INSERT INTO departmentss (dept_id, dept_name, dept_location)
VALUES
(1, 'Engineering', 'New York'),
(2, 'Marketing', 'Chicago'),
(3, 'Analyst', 'Los Angeles'),
(4, 'HR', 'Houston'),
(5, 'Quality Enginner', 'Boston');

select * from departmentss;

#joins
#inner join.
select employees.Name_f,departments.dept_location
from employees
inner join departments
on employees.city = departments.dept_location;

select employees.Name_f,departmentss.dept_name
from employees
inner join departmentss
on employees.dept = departmentss.dept_name;

#left join
select employees.Name_f,departmentss.dept_name
from employees
left join departmentss
on employees.dept = departmentss.dept_name;

select employees.Name_f,departmentss.dept_name
from employees
right join departmentss
on employees.dept = departmentss.dept_name;

#cross join
select employees.Name_f,departments.dept_name
from employees
cross join departments;


select * from employees;
select * from departments;
select * from departments;
select * from departmentss;

