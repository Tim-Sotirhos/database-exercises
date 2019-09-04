/*

--1) Copy the order by exercise and save it as 3.6_functions_exercises.sql.


--2) Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

Select concat(first_name, ", ", last_name) as full_name from employees where last_name like 'E%' order by emp_no asc;

Select concat(first_name, ", ", last_name) as full_name from employees where last_name like '%E' order by emp_no asc;

--3) Convert the names produced in your last query to all uppercase.

Select upper(concat(first_name, ", ", last_name)) as full_name from employees where last_name like '%E' order by emp_no asc;

--4) For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())

Select concat(first_name, ", ", last_name) as NAME,
datediff(curdate(),hire_date) as Days_worked from employees 
where hire_date between '1990-01-01' and '1999-12-31' 
and birth_date like '%12-25%' order by birth_date asc, hire_date desc;

--5) Find the smallest and largest salary from the salaries table.

Select min(salary) from salaries;

--6) Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select 
	lower(concat(
		(substr(first_name, 1, 1)),
		(substr(last_name,1, 4)),
		"_",
		substr(birth_date, 6, 2),
		substr(birth_date, 3, 2))) as username,
	first_name,
	last_name,
	birth_date
from employees;

*/