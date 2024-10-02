create database ma_company;
use ma_company;
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

#insert into statement
insert into Employees (emp_id, Name_f, dept, salary, RankING, age, address, city)
VALUES (23, 'wilson jacobs', 'Sales', 62000.00, 'Sales Executive', 35, '789 Pine St.', 'Los Angeles');

#update statement
UPDATE Employees
SET salary  = 312000
WHERE emp_id = 23;

#delete statement
DELETE FROM Employees
WHERE age = 35 OR Ranking = 'Senior Engineer';

rollback; #undo dellete.

#linit statement	
select * from Employees
LIMIT 6;

#maximum
select max(salary) as highest_salary
from employees;

#minimum
select min(salary) as lowest_salary
from employees