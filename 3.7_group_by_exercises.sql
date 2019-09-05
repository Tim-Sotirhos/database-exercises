/*

--1) Create a new file named 3.7_group_by_exercises.sql

--2) In your script, use DISTINCT to find the unique titles in the titles table. Your results should look lik:

Senior Engineer
Staff
Engineer
Senior Staff
Assistant Engineer
Technique Leader
Manager

Select distinct title from titles;

--3) Find your query for employees whose last names start and end with 'E'. Update the query find just the unique last names that start and end with 'E' using GROUP BY. The results should be:

Eldridge
Erbe
Erde
Erie
Etalle

Select last_name from employees     
Where last_name like 'E%E' 
Group by last_name; 

--4) Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.

Select first_name, last_name 
from employees
Where last_name like 'E%E' 
Group by first_name, last_name; 

--5) Find the unique last names with a 'q' but not 'qu'. Your results should be:

Chleq
Lindqvist
Qiwen

Select last_name 
From employees 
Where last_name like '%q%' and last_name not like '%qu%' 
Group by last_name;

--6) Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

Select last_name, count(*) 
From employees
Group by last_name
Order by last_name desc;

--7) Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:

441 M
268 F

Select gender, count(*)
From employees 
Where first_name in ('Irena','Vidya', 'Maya') 
Group by gender
Order by gender;

--8) Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames?

Yes the usernames generated have duplicates.

Select 
	lower(concat(
		(substr(first_name, 1, 1)),
		(substr(last_name,1, 4)),
		"_",
		substr(birth_date, 6, 2),
		substr(birth_date, 3, 2))) as username,count(*)
From employees
Group by username
Having count(*) > 1
Order by count(*);

Bonus: how many duplicate usernames are there?
 
There are 13,251 duplicate usernames.

*/