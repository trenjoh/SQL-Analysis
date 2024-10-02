create database db10;
use db10;

drop table if exists departments;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
    
);

-- Insert departments
INSERT INTO departments (dept_id, dept_name)
VALUES
(101, 'Engineering'),
(102, 'Marketing'),
(103, 'Sales'),
(104, 'HR'),
(105, 'Finance');

drop table if exists employees;

create table employees (
	emp_id int primary key,
    emp_name varchar(50)not null,
    email varchar (100) unique,
    age int check(age>=18),
    dept_id int,
    hire_date date default '2024-09-01',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
	);

INSERT INTO employees (emp_id, emp_name, email, age, dept_id, hire_date)
VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 30, 101, '2023-01-15'),
(2, 'Bob Williams', 'bob.williams@example.com', 25, 102, '2023-02-20'),
(3, 'Charlie Brown', 'charlie.brown@example.com', 40, 103, '2022-11-01'),
(4, 'Diana Evans', 'diana.evans@example.com', 29, 104, '2023-03-10'),
(5, 'Evan Wright', 'evan.wright@example.com', 35, 105, '2023-04-05');


select * from employees;
select * from departments;

