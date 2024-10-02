create database d5;
use d5;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    Name_f VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10, 2),
    Ranking VARCHAR(20),
    age INT,
    address VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO employees (emp_id, Name_f, dept, salary, Ranking, age, address, city)
VALUES 
(1, 'John Doe', 'Engineering', 70000.00, 'Senior Engineer', 30, '123 Maple St.', 'New York'),
(2, 'Jane Smith', 'Marketing', 55000.00, 'Marketing Manager', 28, '456 Oak St.', 'Chicago'),
(3, 'Robert Brown', 'Sales', 62000.00, 'Sales Executive', 35, '789 Pine St.', 'Los Angeles'),
(4, 'Emily Davis', 'HR', 50000.00, 'HR Specialist', 32, '321 Cedar St.', 'Houston'),
(5, 'Michael Johnson', 'Engineering', 80000.00, 'Lead Engineer', 40, '654 Elm St.', 'San Francisco'),
(6, 'Chris White', 'Finance', 75000.00, 'Financial Analyst', 29, '987 Birch St.', 'Boston');

select * from employees;

create table departments(
dept_id int primary key,
dept_name varchar(100),
dept_location varchar(100)
);
INSERT INTO departments (dept_id, dept_name, dept_location)
VALUES
(1, 'Engineering', 'New York'),
(2, 'Marketing', 'Chicago'),
(3, 'Sales', 'Los Angeles'),
(4, 'HR', 'Houston'),
(5, 'Finance', 'Boston');


#Group by
select dept ,sum(salary ) as total_salary
from employees
group by dept;

#exists
select Name_f 
from employees e
where exists(
	select 22
    from departments d
    where e.dept = d.dept_name
);
select * from employees;
select * from departments;

#ANY
select Name_f
from employees
where salary > any (select salary from employees where dept  = 'Finance');

#all
select Name_f
from employees
where salary > ALL (select salary from employees where dept  = 'finance');

#INSERT INTO
create table engineering_dept(
	emp_id INT PRIMARY KEY,
    Name_f VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10, 2)
);
insert into engineering_dept(emp_id, Name_f, dept, salary)
select emp_id, Name_f, dept, salary
from employees
where dept = 'engineering';
select * from engineering_dept;

# CASE-Conditional
select Name_f,
	case
		when salary > 70000 then 'high'
		when salary between 50000 and 70000 then 'mediuum'
		else 'low'
	end as salary_category
FROM employees;

