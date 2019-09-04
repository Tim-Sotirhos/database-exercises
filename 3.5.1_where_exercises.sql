/*
-- 1) Create a file named 3.5.1_where_exercises.sql. Make sure to use the employees database

Use employees;
Select * from employees;

--2) Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).

Select * from employees where first_name in ('Irena','Vidya', 'Maya');

--3) Find all employees whose last name starts with 'E' — 7,330 rows.

Select * from employees where last_name like 'E%';

--4) Find all employees hired in the 90s — 135,214 rows.

Select * from employees where hire_date like '199%';

--5) Find all employees born on Christmas — 842 rows.

Select * from employees where birth_date like '%12-25%';

--6) Find all employees with a 'q' in their last name — 1,873 rows.

Select * from employees where last_name like '%q%';

--  Next Section of Exercises

--1) Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.

Select * from employees where first_name='Irena' or first_name='Vidya'or first_name='Maya';

--2) Add a condition to the previous query to find everybody with those names who is also male — 441 rows.

Select * from employees where gender='M' and (first_name='Irena' or first_name='Vidya'or first_name='Maya');

--3) Find all employees whose last name starts or ends with 'E' — 30,723 rows.

Select * from employees where last_name like 'E%' or last_name like '%E';

--4) Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.

Select * from employees where last_name like 'e%e';

--5) Find all employees hired in the 90s and born on Christmas — 362 rows.

Select * from employees where hire_date like '199%' and birth_date like '%12-25%';

--6) Find all employees with a 'q' in their last name but not 'qu' — 547 rows.

Select * from employees where last_name like '%q%' and last_name not like '%qu%';
*/