					.........DML-Operations.........
****1.INSERT command****

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    designation VARCHAR(30),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    experience INT,
    bonus DECIMAL(10,2)
);
desc employees;
insert into employees(emp_id,emp_name,designation,department,salary,city,experience,bonus)
VALUES
(101, 'Raju',   'Manager',    'Loan',      65000, 'Hyderabad', 6, 5000),
(102, 'Sham',   'Cashier',    'Cash',      35000, 'Warangal',  2, 2000),
(103, 'Paul',   'Associate',  'Loan',      40000, 'Karimnagar',3, 3000),
(104, 'Alex',   'Accountant', 'Accounts',  55000, 'Hyderabad', 5, 4000),
(105, 'Victor', 'Associate',  'Deposit',   38000, 'Nizamabad', 1, 1500),
(106, 'John',   'Developer',  'IT',        70000, 'Hyderabad', 7, 6000),
(107, 'David',  'Developer',  'IT',        45000, 'Warangal',  4, 3500),
(108, 'Rani',   'HR',         'HR',        50000, 'Karimnagar',5, 3000),
(109, 'Priya',  'Manager',    'Sales',     80000, 'Hyderabad', 8, 7000),
(110, 'Kiran',  'Sales Exec', 'Sales',     42000, 'Warangal',  2, 2500);

select * from employees;

****2.UPDATE command****
-- 1.Update Raju's salary to 70000.
UPDATE employees
SET salary=70000
WHERE emp_id=101;
-- 2.Change Sham's department to Finance.
update employees
SET department='Finance'
WHERE emp_id=102;
-- 3.Update Paul's designation to Senior Associate.
UPDATE employees
SET designation='Senior Assosiate'
where emp_name='Paul';
-- 4.Increase Alex's salary by 5000.
UPDATE employees
set salary=5000
where emp_name='Alex';
-- 5.Change Victor's city to Hyderabad.
UPDATE employees
SET city='Hyderabad'
WHERE emp_name='Victor';
-- 6.Increase the salary of all employees in the Sales department by 10%.
update employees
SET salary=salary*1.10
where department='Sales';
-- 7.Change all employees in the Loan department to Finance.
UPDATE employees
SET department='Finance'
WHERE department='Loan';
-- 8.Update all Associate designations to Senior Associate.
UPDATE employees
SET designation='Senior Associate'
WHERE designation='Associate';
-- 9.Set the bonus to 10000 for employees whose salary is greater than 60000.
UPDATE employees
SET bonus=10000
WHERE salary >60000;
-- 10.Increase salary by 15% for employees with more than 5 years of experience.
update employees
SET salary=salary*(1+(15/100))
WHERE experience >5;
-- 11.Change the department to Development for all Developer employees.
UPDATE employees
SET department='Development'
WHERE designation='Developer';
-- 12.Update both salary (75000) and designation (Team Lead) for employee 106.
UPDATE employees
SET salary=75000,designation='Team Lead'
WHERE emp_id=106;
-- 13.Reduce the salary by 5% for employees earning more than 75000.
UPDATE employees
SET salary=salary*(1-(5/100))
WHERE salary >75000;
-- 14.Change the city of all employees in the HR department to Warangal.
UPDATE employees
set city='Warangal'
WHERE department='HR';
-- 15.Set the bonus to 5000 for employees whose experience is between 3 and 5 years.
UPDATE employees
set bonus=5000
WHERE experience>=3 AND experience<=5;

****3.DELETE command****

-- 1.Delete the employee whose emp_id is 110.
DELETE FROM employees
WHERE emp_id=110;
-- 2.Delete the employee named Victor.
DELETE FROM employees
WHERE emp_name='Victor';
-- 3.Delete all employees from the Finance department.
DELETE FROM employees
WHERE department='Finance';
-- 4.Delete all employees whose salary is less than 40000.
DELETE FROM employees
WHERE salary < 40000;
-- 5.Delete all employees whose experience is less than 3 years.
DELETE FROM employees
WHERE experience <3;
-- 6.Delete all employees from Hyderabad.
DELETE FROM employees
WHERE city='Hyderabad';
-- 7.Delete employees whose designation is Developer.
DELETE from employees
where designation='developer';
-- 8.Delete employees whose bonus is 5000.
delete from employees
where bonus=5000;
-- 9.Delete employees whose salary is greater than 75000.
DELETE FROM employees
where salary>75000;
-- 10.Delete employees whose department is Sales.
DELETE FROM employees
where department ='Sales';
SELECT * from employees;
-- 11.Delete employees with experience between 1 and 2 years.
DELETE FROM employees
where experience BETWEEN 1 and 2;
-- 12.Delete employees whose names start with 'R'.
DELETE FROM employees
where emp_name LIKE 'R%';
-- 13.Delete employees whose city is Warangal.
DELETE from employees
where city='warangal';
-- 14.Delete employees whose designation is Manager.
DELETE from employees
WHERE designation='manager';
-- 15.Delete employees with emp_id 101 and 102.
DELETE from employees
WHERE emp_id IN (101,102);
-- 16.Delete employees whose salary is between 45000 and 60000.
delete from employees
where salary BETWEEN 45000 AND 60000;
-- 17.Delete employees whose bonus is less than 3000.
DELETE from employees
WHERE bonus<3000;
-- 18.Delete employees whose department is IT or HR.
DELETE from employees
where department IN ('it','hr');
-- 19.Delete employees whose names end with 'n'.
DELETE from employees
WHERE emp_name LIKE '%n';
-- 20.Delete all records from the employees table.
DELETE FROM employees;

****4.SELECT command****

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    designation VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT,
    bonus INT
);
INSERT INTO employees
(emp_id, emp_name, designation, department, salary, city, experience, bonus)
VALUES
(101, 'Raju',   'Manager',          'HR',      75000, 'Hyderabad', 8, 10000),
(102, 'Sham',   'Developer',        'IT',      55000, 'Chennai',   3, 5000),
(103, 'Paul',   'Senior Associate', 'Finance', 60000, 'Bangalore', 5, 7000),
(104, 'Alex',   'Tester',           'IT',      45000, 'Hyderabad', 2, 3000),
(105, 'Victor', 'Manager',          'Sales',   80000, 'Mumbai',    10, 12000),
(106, 'John',   'Developer',        'IT',      50000, 'Pune',      4, 4000),
(107, 'Sara',   'HR Executive',     'HR',      40000, 'Chennai',   2, 2000),
(108, 'David',  'Accountant',       'Finance', 52000, 'Hyderabad', 6, 6000),
(109, 'Priya',  'Developer',        'IT',      65000, 'Bangalore', 7, 9000),
(110, 'Anil',   'Sales Executive',  'Sales',   48000, 'Delhi',     3, 3500);
-- 1.Display all employee records.
SELECT * FROM employees;
-- 2.Display only employee names and salaries.
SELECT emp_name,salary
FROM employees;
-- 3.Show employees who work in the IT department.
SELECT * FROM employees
WHERE department='it';
-- 4.Show employees whose salary is greater than 50000.
SELECT * from employees
WHERE salary >50000;
-- 5.Display employees from Hyderabad.
SELECT * FROM employees
WHERE city="hyderabad";
-- 6.Show employees with more than 5 years of experience.
select * from employees
where experience >5;
-- 7.Display employees whose designation is "Manager".
SELECT * from employees
WHERE designation='manager';
-- 8.Show employees whose salary is between 40000 and 70000.
select* from employees
WHERE salary BETWEEN 40000 AND 70000;
-- 9.Display employees whose city is Hyderabad or Chennai.
SELECT * from employees
WHERE city IN('hyderabad','chennai');
-- 10.Show employees who are not in the HR department.
SELECT * from employees
WHERE department !='HR';
SELECT * from employees;
-- 11.Display employee names in ascending order.
SELECT emp_name
FROM employees
ORDER BY emp_name ASC;
-- 12.Display employees by salary in descending order.
SELECT emp_name,salary
from employees
ORDER BY salary DESC;
-- 13.Show the first 5 employee records.
SELECT * from employees LIMIT 5;
-- 14.Display distinct department names.
SELECT DISTINCT department FROM employees;
-- 15.Count the total number of employees.
SELECT COUNT(*) FROM employees; 
-- 16.Find the highest salary.
SELECT MAX(salary) as 'max_salary' FROM employees;
-- 17.Find the lowest salary.
SELECT MIN(salary) as 'min_salary'FROM employees;
-- 18.Calculate the average salary.
SELECT AVG(salary) as 'avg_salary' FROM employees;
-- 19.Calculate the total salary of all employees.
SELECT SUM(salary) as 'tot_salary' from employees;
-- 20.Count the number of employees in each department.
SELECT department,count(*) FROM employees
GROUP BY department;
