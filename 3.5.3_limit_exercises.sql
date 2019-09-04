/*
--1) Create a new SQL script named 3.5.3_limit_exercises.sql.


--2) List the first 10 distinct last name sorted in descending order.

Select distinct last_name from employees where last_name like 'Z%' order by last_name desc limit 10;

--3) Find your query for employees born on Christmas and hired in the 90s from order_by_exercises.sql. Update it to find just the first 5 employees.

Select first_name, last_name from employees where hire_date between '1990-01-01' and '1999-12-31' and birth_date like '%12-25%' order by birth_date asc, hire_date desc limit 5;

--4)Update the previous query to find the tenth page of results.

Select first_name, last_name from employees where hire_date between '1990-01-01' and '1999-12-31' and birth_date like '%12-25%' order by birth_date asc, hire_date desc limit 5 offset 45;
*/