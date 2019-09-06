/*

--1) Find all the employees with the same hire date as employee 101010 using a sub-query.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE hire_date=(SELECT hire_date FROM employees WHERE emp_no = '101010')
);

--2) Find all the titles held by all employees with the first name Aamod.

SELECT title
FROM titles
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
)
;

--3) How many people in the employees table are no longer working for the company?

Select count(*)
FROM employees
WHERE emp_no NOT IN(
	SELECT emp_no
	FROM dept_emp
	WHERE to_date = '9999-01-01'
)    
;


--4) Find all the current department managers that are female.

SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date = '9999-01-01' AND gender = 'F'
)
;

--5) Find all the employees that currently have a higher than average salary.

Select first_name, last_name, salaries.salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no IN(
	SELECT emp_no
	FROM salaries
	WHERE salary > (SELECT AVG(salary) FROM salaries) AND to_date = '9999-01-01')
AND salaries.to_date = '9999-01-01';

--6) Find all the employees that currently have a higher than average salary.

SELECT count(*),
count(*)/(SELECT count(*) FROM salaries WHERE to_date = "9999-01-01") * 100
FROM salaries
WHERE to_date = "9999-01-01" AND salary > (select MAX(salary) - stddev(salary) FROM salaries);