create database my_company;
use my_company;
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
INSERT INTO Employees (emp_id, Name_f, dept, salary, RankING, age, address, city)
VALUES 
(1, 'John Doe', 'Engineering', 70000.00, 'Senior Engineer', 30, '123 Maple St.', 'New York'),
(2, 'Jane Smith', 'Marketing', 55000.00, 'Marketing Manager', 28, '456 Oak St.', 'Chicago'),
(3, 'Robert Brown', 'Sales', 62000.00, 'Sales Executive', 35, '789 Pine St.', 'Los Angeles'),
(4, 'Emily Davis', 'HR', 50000.00, 'HR Specialist', 32, '321 Cedar St.', 'Houston'),
(5, 'Michael Johnson', 'Engineering', 80000.00, 'Lead Engineer', 40, '654 Elm St.', 'San Francisco'),
(6, 'Chris White', 'Finance', 75000.00, 'Financial Analyst', 29, '987 Birch St.', 'Boston');

#like statement
select * from employees
where Name_f like '%John%';

select * from employees
where Name_f like '%j%'; # Michal johnson

select * from employees
where Name_f like '%_a%';

#count,AVG,SUM.
select count(*) as total_emp
from employees
where age = 35;

select avg(salary) as average_salary
from employees;

select sum(salary) as sum_of_all_salary
from employees;

SELECT dept, COUNT(*) AS total_employees, 
       AVG(salary) AS average_salary, 
       SUM(salary) AS total_salary
FROM Employees
group by dept;

#1N
select Name_f,emp_id
from employees
where emp_id in (1,4,5,67,23);

select Name_f,dept
from employees
where dept in ('Engineering', 'Marketing');

#BETWEEEN
select Name_f,salary
from employees
where salary between 50000 and 71000;

#Aliases
select Name_f as EmployeeName,emp_id AS EmployeeID, dept as Department
from employees;

select * from employees



