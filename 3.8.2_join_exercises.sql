/*

3.8.2_join_exercises.sql

#Join Example Database:
--1) Select all the records from both the users and roles tables.

SELECT * FROM roles;
SELECT * FROM users;

--2) Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson.

#Join
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

#Left join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

#Right join
SELECT users.name as user_name, roles.name as role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

--3) Use count and the appropriate join type to get a list of roles along with the number of users that has the role.


#Join Example Database:
--1) Use the employees database.

--2) Write a query that shows each department along with the name of the current manager for that department.

SELECT departments.dept_name as Department_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Department_Manager
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date ='9999-01-01'
ORDER BY departments.dept_name ASC;

--3) Find the name of all departments currently managed by women.

SELECT departments.dept_name as Department_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Department_Manager
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
On dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date ='9999-01-01' AND gender = 'F' 
Order by departments.dept_name ASC;

--4) Find the current titles of employees currently working in the Customer Service department.

SELECT titles.title AS Title, Count(*) AS Count
FROM employees
JOIN titles
ON employees.emp_no = titles.emp_no
AND titles.to_date ='9999-01-01'
JOIN dept_emp
On employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = 'D009' 
AND dept_emp.to_date ='9999-01-01'
GROUP BY Title ASC;

--5) Find the current salary of all current managers.

SELECT departments.dept_name as Department_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Name, salaries.salary AS Salary
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = dept_manager.emp_no
Where dept_manager.to_date ='9999-01-01' AND salaries.to_date = '9999-01-01'
Order by departments.dept_name asc;


--6) Find the number of employees in each department.

SELECT departments.dept_no, departments.dept_name, count(*) AS num_employees
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_emp.to_date = '9999-01-01'
GROUP BY departments.dept_no, departments.dept_name;


--7) Which department has the highest average salary?

SELECT departments.dept_name, AVG(salaries.salary) AS average_salary
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;

--8) Who is the highest paid employee in the Marketing department?

SELECT employees.first_name, employees.last_name
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01' AND departments.dept_name = 'Marketing'
ORDER BY salaries.salary DESC
LIMIT 1;

--9) Which current department manager has the highest salary?

SELECT employees.first_name, employees.last_name, salaries.salary, departments.dept_name
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
ORDER BY salaries.salary DESC
LIMIT 1;



