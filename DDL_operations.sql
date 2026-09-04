create table employee(
    emp_id int primary key,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

-- 1.Add a new column email of type VARCHAR(100).
ALTER TABLE employee
ADD COLUMN email VARCHAR(100);
-- 2.Add a new column phone of type VARCHAR(15).
ALTER TABLE employee
ADD COLUMN phone varchar(15);
-- 3.Add a column joining_date of type DATE.
ALTER table employee
add column joining_date DATE;
-- 4.Change the data type of department from VARCHAR(30) to VARCHAR(50).
Alter table employee
modify column department varchar(50);
-- 5.Rename the column emp_name to employee_name.
Alter Table employee
rename column emp_name to employee_name;
-- 6.Drop the column phone.
Alter table employee 
drop column phone;
-- 7.Rename the table employees to staff.
Alter table employee
rename to staff;
desc staff;
-- 8.Add a new column age with data type INT.
Alter table staff
add column age int;
-- 9.Add a NOT NULL constraint to the department column.
alter table staff
modify department varchar(50) not null;
-- 10.Set the default value of salary to 25000.
Alter table staff
modify salary DECIMAL(10,2) DEFAULT('25000');
-- 11.Remove the default value from the salary column.
ALTER table staff
alter COLUMN salary drop default;
-- 12.Add a UNIQUE constraint on the email column.
Alter table staff
ADD constraint uq_email UNIQUE(email);
-- 13.Add a new column gender with data type CHAR(1) and default value 'M'.
Alter table staff
ADD column gender CHAR(1) default('M');
-- 14.Increase the size of employee_name from VARCHAR(50) to VARCHAR(100).
Alter table staff
modify COLUMN employee_name VARCHAR(100); 
-- 15.Rename the column department to dept_name.
alter table staff
RENAME column department to dept_name;
desc staff;
