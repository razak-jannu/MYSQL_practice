-- MySQL Subquery – 20 Practice Questions
-- 1.Basic Subquery
-- Q1. Display employees whose salary is greater than the average salary of all employees.
SELECT emp_name,salary
FROM employees
WHERE salary >(SELECT AVG(salary) FROM employees);
-- Q2. Display employees whose salary is less than the average salary of all employees.
SELECT emp_name,salary
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);
-- Q3. Display the employee(s) who have the highest salary.
SELECT emp_name,salary
FROM employees
WHERE salary =(SELECT max(salary) FROM employees);
-- Q4. Display the employee(s) who have the lowest salary.
SELECT emp_name,salary
FROM employees
WHERE salary=(SELECT MIN(salary) FROM employees);
-- Q5. Display employees whose salary is equal to the average salary of all employees.
SELECT emp_name,salary
FROM employees 
WHERE salary =(SELECT AVG(salary) FROM employees);

-- MySQL IN with Subquery 
-- -- 6. Display employees who work in the same department as employees
-- --    whose salary is greater than 50000.
SELECT emp_name,salary,department
FROM employees
WHERE department  IN (SELECT department FROM employees WHERE salary > 50000);
-- -- 7. Display employees who work in the same city as employees
-- --    whose salary is greater than 40000.
SELECT emp_name,salary,city
FROM employees
WHERE city IN (SELECT city FROM employees WHERE salary > 40000);
-- -- 8. Display employees who have the same designation as employees
-- --    whose experience is greater than 5 years.
SELECT * FROM employees
WHERE designation IN (SELECT designation FROM employees WHERE experience > 5 );
-- -- 9. Display employees who work in departments where at least one
-- --    employee has a bonus greater than 5000.
SELECT * FROM employees
WHERE department IN(SELECT department FROM employees WHERE bonus >5000);
-- -- 10. Display employees who work in cities where at least one employee
-- --    has experience greater than 7 years.
SELECT * FROM employees
WHERE city IN(SELECT city FROM employees WHERE experience >7);

-- MySQL Subquery – ANY,ALL,NOT IN Practice Questions
-- 11. Display employees whose salary is greater than the
--    highest salary of employees from the 'HR' department using ALL.
select emp_name,department,salary
FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department='HR');
-- 12. Display employees whose salary is greater than at least
--    one salary of employees from the 'IT' department using ANY.
select emp_name,department,salary
FROM employees WHERE salary >ANY(SELECT salary FROM employees WHERE department='IT');
-- 13. Display employees who do not work in departments where
--    any employee has a salary greater than 60000 using NOT IN.
select emp_name,department,salary
FROM employees WHERE department NOT IN(SELECT department FROM employees WHERE salary > 60000);
-- 14. Display the department and average salary for departments
--    whose average salary is greater than the overall average salary.
--    Use a subquery in the FROM clause.
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg ;
-- 15. Display employees whose salary is equal to the maximum salary
--    of employees from the 'Sales' department using a subquery.
SELECT emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary) 
    FROM employees 
    WHERE department = 'Sales'
);
