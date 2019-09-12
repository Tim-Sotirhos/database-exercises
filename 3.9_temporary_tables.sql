/*

--1) Using the example from the lesson, re-create the employees_with_departments table.

USE bayes_823;
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT * FROM employees_with_departments;

--1a) Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

--1b) Update the table so that full name column contains the correct data.

UPDATE employees_with_departments SET full_name = concat (first_name, " ", last_name);

--1c) Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

--1d) What is another way you could have ended up with this same table?

You could have created the table with out SELECT first_name and last_name during the creation process.
Then add in Select CONCAT(first_name, " ", Last_name) and populate it with values FROM the employees database.

--2) Create a temporary table based on the payment table from the sakila database. 
Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment.

USE bayes_823;
CREATE TEMPORARY TABLE payment_copy as
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment;

SELECT * FROM payment_copy;

ALTER TABLE payment_copy ADD amount_mod INT(5);

UPDATE payment_copy SET amount_mod = amount*100;

ALTER TABLE payment_copy DROP COLUMN amount;

--3)Find out how the average pay in each department compares to the overall average pay.
-- In order to make the comparison easier, you should use the Z-score for salaries.
-- In terms of salary, what is the best department to work for? The worst?

-- Generate a temporary table holding the current salary average and standard deviation
CREATE TEMPORARY TABLE salary_avg_stddev AS 
	SELECT avg(salaries.salary) AS avg, stddev(salaries.salary) AS stddev
	FROM departments
	JOIN dept_emp USING(dept_no)
	JOIN salaries USING(emp_no)
	WHERE salaries.to_date > NOW()
	AND dept_emp.to_date > NOW()

SELECT * from salary_avg_stddev;
-- Company average salary = 72012
-- Company standard deviation = 17310

CREATE TEMPORARY TABLE dept_average_salaries AS 
	select departments.dept_name, avg(salaries.salary) as department_average
	from salaries
	join dept_emp using(emp_no)
	join departments using(dept_no)
	where salaries.to_date > now()
	and dept_emp.to_date > now()
	group by departments.dept_name;


alter table dept_average_salaries ADD average FLOAT;
alter table dept_average_salaries ADD stddev FLOAT;

UPDATE dept_average_salaries
SET average = 72012, stddev = 17310;

SELECT * from dept_average_salaries;

-- add the zscore column
alter table dept_average_salaries add zscore float;

-- Populate the z-score column
UPDATE dept_average_salaries
SET zscore = (department_average - average) / stddev;

SELECT * from dept_average_salaries;

*/
