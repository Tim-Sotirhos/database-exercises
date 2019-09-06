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

use bayes_823;
CREATE TEMPORARY TABLE payment_copy as
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment;

SELECT * FROM payment_copy;

ALTER TABLE payment_copy ADD amount_mod INT(5);

UPDATE payment_copy SET amount_mod = amount*100;

ALTER TABLE payment_copy DROP COLUMN amount;

--3)


--4)


*/
