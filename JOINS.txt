___INNER AND LEFT JOIN____


-- 1. Display employee name and department name
--    using INNER JOIN.
SELECT employees.emp_name,departments.department
FROM employees INNER JOIN departments
ON employees.department = departments.department;


-- 2. Display employee name, salary, and manager name
--    using INNER JOIN.
SELECT employees.emp_name,employees.salary,departments.manager
FROM employees INNER JOIN departments
ON employees.department = departments.department;
-- 3. Find employees who work in the IT department
--    and display their manager name.
SELECT employees.emp_name,departments.manager
FROM employees INNER JOIN departments
ON employees.department = departments.department
WHERE employees.department="IT";

-- 4. Find employees whose salary is greater than 50000
--    and display their department and manager.
SELECT employees.department,departments.manager,employees.salary
FROM employees INNER JOIN departments
ON employees.department=departments.department
WHERE employees.salary > 50000;

-- 5. Display all employees and their manager names
--    using LEFT JOIN.
SELECT employees.emp_name,departments.manager
FROM employees LEFT JOIN departments
ON employees.department = departments.department;

-- 6. Display employee name, city, and manager name
--    for employees who work in Hyderabad.
SELECT employees.emp_name,employees.city,departments.manager
FROM employees LEFT join departments
ON employees.department = departments.department
WHERE employees.city="Hyderabad";

-- 7. Display employee name, department, and manager,
--    sorted by salary from highest to lowest.
SELECT employees.emp_name,employees.department,departments.manager
FROM employees LEFT JOIN departments
ON employees.department = departments.department
ORDER BY employees.salary DESC;

-- 8. Find the number of employees in each department
--    using JOIN and GROUP BY.
SELECT employees.department,COUNT(*) as num_of_emp
FROM employees JOIN departments
ON employees.department=departments.department
GROUP BY employees.department;

-- 9. Find the total salary of employees in each department
--    using JOIN and GROUP BY.
SELECT employees.department,SUM(employees.salary) as total_salary
FROM employees INNER JOIN departments
ON employees.department = departments.department
GROUP BY employees.department;

-- 10. Find departments having more than 2 employees,
--     displaying department name and employee count.
SELECT employees.department,COUNT(*) as num_of_emp
FROM employees JOIN departments
ON employees.department=departments.department
GROUP BY employees.department
HAVING COUNT(*) >2;

___LEFT JOIN____

-- 1. Display the employee name and department name using LEFT JOIN.
select employees.emp_name,departments.department
FROM employees left JOIN departments
ON employees.department = departments.department;
-- 2. Display employee name, salary, and manager name using LEFT JOIN.
SELECT e.emp_name,e.salary,d.manager
FROM employees e LEFT JOIN departments d
ON e.department = d.department;
-- 3. Display all employees along with their department manager.
select employees.emp_name,departments.manager
FROM employees LEFT JOIN departments
ON employees.department = departments.department;
-- 4. Display employee name, designation, and department using LEFT JOIN.
SELECT e.emp_name,e.designation,d.department
FROM employees e LEFT JOIN departments d
ON e.department = d.department;
-- 5. Display employees who do not have a matching department.
SELECT employees.emp_name,departments.department
FROM employees LEFT JOIN departments
ON employees.department = departments.department
WHERE departments.department IS NULL;
-- 6. Display employees whose salary is greater than 30000, along with their department manager.
select e.emp_name,e.salary,d.manager
FROM employees e LEFT JOIN departments d
ON e.department = d.department
WHERE e.salary > 30000;
-- 7. Display employees from the IT department along with their manager.
SELECT e.emp_name,e.department,d.manager
FROM employees e 
LEFT JOIN departments d ON e.department = d.department
WHERE e.department='it';

-- 8. Display employee name, city, department, and manager, sorted by salary in descending order.
select e.emp_name,e.city,e.department,d.manager
FROM employees e
LEFT JOIN departments d ON e.department = d.department
ORDER BY e.salary DESC;
-- 9. Count the number of employees in each department using LEFT JOIN and GROUP BY.
SELECT d.department, COUNT(e.emp_name) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department = e.department
GROUP BY d.department;

-- 10. Display departments and the number of employees in each department, including departments that have zero employees.
SELECT d.department,COUNT(e.emp_name) as num_of_emp
FROM departments d
LEFT JOIN employees e ON d.department = e.department
GROUP BY d.department;


____RIGHT JOIN____

-- 1. Display the customer name and order ID using RIGHT JOIN.
SELECT c.customer_name,o.order_id
FROM customers c RIGHT JOIN 
orders o ON c.customer_id = o.customer_id;

-- 2. Display the customer name, product, and price using RIGHT JOIN.
SELECT c.customer_name,o.product,o.price 
FROM customers c RIGHT JOIN
orders o ON c.customer_id = o.customer_id;

-- 3. Display customer name, city, product, and order status using RIGHT JOIN.
SELECT c.customer_name,c.city,o.product,o.order_status
FROM customers c RIGHT JOIN 
orders o ON c.customer_id=o.customer_id;

-- 4. Display customer name, order ID, product, quantity, and price for all orders using RIGHT JOIN.
SELECT c.customer_name,o.order_id,o.product,o.quantity,o.price
FROM customers c RIGHT JOIN
orders o ON c.customer_id=o.customer_id;

-- 5. Display customer name, product, category, and payment method using RIGHT JOIN.
--    Show only orders where the payment method is UPI.
SELECT c.customer_name,o.product,o.category,o.payment_method
FROM customers c RIGHT JOIN 
orders o ON c.customer_id=o.customer_id
WHERE o.payment_method="UPI";

-- 6. Display customer name, product, price, and order status using RIGHT JOIN.
--    Show only Delivered orders.
SELECT customers.customer_name,orders.product,orders.price,orders.order_status
FROM customers RIGHT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_status ="Delivered";

-- 7. Display customer name, product, quantity, and price using RIGHT JOIN.
--    Arrange the result by price from highest to lowest.
SELECT c.customer_name,o.product,o.quantity,o.price 
FROM customers c RIGHT JOIN orders o 
ON c.customer_id=o.customer_id
ORDER BY o.price DESC;

-- 8. Display customer name and total order amount using RIGHT JOIN.
--    Total order amount = quantity * price.
SELECT c.customer_name,FORMAT(o.quantity*o.price,0) as total_order_amount
FROM customers c RIGHT JOIN orders o 
ON c.customer_id = o.customer_id;

-- 9. Display all orders along with the customer name using RIGHT JOIN.
--    Show only orders where the customer does not exist in the customers table.
SELECT c.customer_name,o.order_id,o.product,o.quantity,o.price 
FROM customers c RIGHT JOIN orders o 
ON c.customer_id=o.customer_id
WHERE c.customer_name IS NULL;

-- 10. Display customer name, membership, product, category, quantity, price,
--     and order status using RIGHT JOIN.
--     Show only Premium customers whose order status is Delivered.
SELECT c.customer_name, c.membership, o.product, o.category, o.quantity, o.price,o.order_status
FROM customers c RIGHT JOIN orders o   
ON c.customer_id=o.customer_id
WHERE c.membership='Premium' AND o.order_status='Delivered';


____FULL OUTER JOIN | FULL JOIN____


-- Display all employee names and department names using FULL OUTER JOIN.
SELECT e.emp_name,d.department
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION
SELECT e.emp_name,d.department
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department;
-- Display employee name and department manager using FULL OUTER JOIN.
SELECT e.emp_name,d.manager
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION
SELECT e.emp_name,d.manager
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department;
-- Display employee name, salary, and department name using FULL OUTER JOIN.
SELECT e.emp_name,e.salary,d.department
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION 
SELECT e.emp_name,e.salary,d.department
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department;
-- Display all employees and all departments, including unmatched records.
SELECT e.emp_name,d.department
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION 
SELECT e.emp_name,d.department
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department
WHERE e.department IS NULL;
-- Display employee name, designation, and department manager using FULL OUTER JOIN.
SELECT e.emp_name,e.designation,d.manager
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION 
SELECT e.emp_name,e.designation,d.manager
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department;
-- Display employee name, city, and department name using FULL OUTER JOIN.
SELECT e.emp_name,e.city,d.department
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION 
SELECT e.emp_name,e.city,d.department
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department;
-- Display employee name, salary, department name, and manager using FULL OUTER JOIN.
SELECT e.emp_name,e.salary,d.department,d.manager
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
UNION 
SELECT e.emp_name,e.salary,d.department,d.manager
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department;
-- Display all employees and departments where the employee's salary is greater than 30000.
SELECT e.emp_name,e.salary,d.department
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
WHERE e.salary>30000
UNION 
SELECT e.emp_name,e.salary,d.department
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department
WHERE e.salary>30000
OR e.emp_id IS NULL;
-- Display all employees and departments where the employee's city is Warangal.
SELECT e.emp_name,e.city,d.department
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
WHERE e.city ='Warangal'
UNION 
SELECT e.emp_name,e.city,d.department
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department
WHERE e.city ='Warangal'
OR e.emp_id IS NULL;
-- Display employee name, salary, department name, and manager where salary is between 30000 and 50000
SELECT e.emp_name,e.salary,d.department,d.manager
FROM employees e LEFT JOIN departments d                   
ON e.department=d.department
WHERE e.salary BETWEEN 30000 AND 50000
UNION 
SELECT e.emp_name,e.salary,d.department,d.manager
FROM employees e RIGHT JOIN departments d                   
ON e.department=d.department
WHERE e.salary BETWEEN 30000 AND 50000
OR e.emp_id IS NULL;



___CROSS JOIN___

-- 1. Display all employee names and all department names using CROSS JOIN.
select e.emp_name,d.department
FROM employees e CROSS JOIN departments d;
-- 2. Display employee name and department name using CROSS JOIN.
select e.emp_name,d.department
FROM employees e CROSS JOIN departments d;
-- 3. Display employee name, salary, and department name using CROSS JOIN.
select e.emp_name,e.salary,d.department
FROM employees e CROSS JOIN departments d;
-- 4. Display employee name, city, and department name using CROSS JOIN.
select e.emp_name,e.city,d.department
FROM employees e CROSS JOIN departments d;
-- 5. Display employee name, experience, and department name using CROSS JOIN.OIN.
select e.emp_name,e.experience,d.department
FROM employees e CROSS JOIN departments d;
-- 6. Display employee name and department name, sorted by employee name.
SELECT e.emp_name,d.department
FROM employees e CROSS JOIN departments d 
ORDER BY e.emp_name ASC;
-- 7. Display employee name and department name, sorted by department name.
SELECT e.emp_name,d.department
FROM employees e CROSS JOIN departments d 
ORDER BY d.department ASC;
-- 8. Display the first 10 combinations of employee names and department names using CROSS JOIN.
SELECT e.emp_name,d.department
FROM employees e CROSS JOIN departments d 
LIMIT 10;
-- 9. Display employee name and department name where employee salary is greater than 30000.
SELECT e.emp_name,d.department
FROM employees e CROSS JOIN departments d 
WHERE e.salary > 30000;
-- 10. Display employee name and department name where employee experience is greater than 3 years.
SELECT e.emp_name,d.department
FROM employees e CROSS JOIN departments d 
WHERE e.experience > 3;


___SELF JOIN___

-- 1. Display the names of employees who belong to the same department.
SELECT e1.emp_name AS employee_1,
    e2.emp_name AS employee_2,
    e1.department
FROM employees e1 JOIN employees e2
ON e1.department=e2.department
WHERE e1.emp_id < e2.emp_id;
-- 2. Display employee names and the names of other employees working in the same department.
SELECT 
    e1.emp_name AS employee,
    e2.emp_name AS other_employee,
    e1.department
FROM employees e1 
JOIN employees e2 ON e1.department = e2.department
WHERE e1.emp_id <> e2.emp_id;
-- 3. Display employee name and another employee name who has the same city.
SELECT
    e1.emp_name AS employee,
    e2.emp_name AS another_employee,
    e1.city
FROM employees e1 
JOIN employees e2 ON e1.city = e2.city
WHERE e1.emp_id <> e2.emp_id;
-- 4. Display employee name and another employee name who has the same designation.
SELECT
    e1.emp_name AS employee,
    e2.emp_name AS another_employee,
    e1.designation
FROM employees e1 
JOIN employees e2 ON e1.designation = e2.designation
WHERE e1.emp_id <> e2.emp_id;
-- 5. Display employee name, salary, and another employee name who belongs to the same department.
SELECT
    e1.emp_name AS employee,
    e1.salary AS emp_salary,
    e2.emp_name AS another_employee,
    e1.department
FROM employees e1 
JOIN employees e2 ON e1.department = e2.department
WHERE e1.emp_id <> e2.emp_id;
