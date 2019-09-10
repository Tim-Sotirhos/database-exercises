/* 

3.11_more_exercises.sql

-- Employees Database

USE employees;

-- 1a) Current managers salary?

SELECT departments.dept_name as Department_Name, CONCAT(employees.first_name, ' ', employees.last_name) AS Department_Manager, salaries.salary as Salary
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = employees.emp_no
WHERE dept_manager.to_date ='9999-01-01' and salaries.to_date = '9999-01-01'
ORDER BY departments.dept_name;

-- 1b) Average salary for the department?

SELECT departments.dept_name, AVG(salaries.salary) AS average_salary
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY departments.dept_name;

-- 1c) Is there any department where the department manager gets paid less than the average salary?

The Customer Service, Production,  department managers earns less than the average salary for the department.

-- World Database

USE world;

-- What languages are spoken in Santa Monica?

SELECT countrylanguage.language AS 'Language', countrylanguage.percentage AS 'Percentage'
FROM countrylanguage
JOIN city ON city.countrycode = countrylanguage.countrycode
WHERE city.name = 'santa monica'
ORDER BY percentage;

-- How many different countries are in each region?

SELECT region AS 'Region', COUNT(*) AS 'num_countries'
FROM country
GROUP BY region
ORDER BY count(*);

-- What is the population for each region?

SELECT region AS 'Region', SUM(population) AS 'population'
FROM country
GROUP BY region
ORDER BY sum(population) DESC;

-- What is the population for each continent?

SELECT Continent AS continent, SUM(population)
FROM country
GROUP BY continent
ORDER BY sum(population) DESC;

-- What is the average life expectancy globally?

SELECT AVG(lifeexpectancy) AS 'avg(LifeExpectancy)'
FROM country;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

SELECT region AS 'Region', AVG(lifeexpectancy) AS 'life_expectancy'
FROM country
GROUP BY region
ORDER BY AVG(lifeexpectancy);

SELECT continent AS 'Continent', AVG(lifeexpectancy) AS 'life_expectancy'
FROM country
GROUP BY continent
ORDER BY AVG(lifeexpectancy);

-- Sakila Database

USE sakila;

--1) Display the first and last names in all lowercase of all the actors.

SELECT lower(concat(first_name, ' ', last_name)) AS 'First, Last Name'
FROM actor
ORDER BY last_name, first_name;

--2) You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?

SELECT actor_id, first_name, last_name 
FROM actor
WHERE first_name = 'joe';

--3) Find all actors whose last name contain the letters "gen":

SELECT lower(concat(first_name, ' ', last_name)) AS 'First, Last Name'
FROM actor
WHERE last_name LIKE '%gen%';

--4) Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.

SELECT lower(concat(first_name, ' ', last_name)) AS 'First, Last Name'
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

--5) Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:

SELECT country_id, country
FROM country
WHERE country IN(
	'afghanistan', 'bangladesh', 'china');

--6) List the last names of all the actors, as well as how many actors have that last name.

SELECT last_name, count(*) AS 'num_actors'
FROM actor
GROUP BY last_name;

--7) List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

SELECT last_name, count(*) AS 'num_actors'
FROM actor
GROUP BY last_name HAVING num_actors > 1
ORDER BY num_actors;

--8) You cannot locate the schema of the address table. Which query would you use to re-create it?

SHOW CREATE TABLE address;

--9) Use JOIN to display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address, city, district, postal_code
From staff
join address ON staff.address_id = address.address_id
join city ON address.city_id = city.city_id;

--10) Use JOIN to display the total amount rung up by each staff member in August of 2005.

SELECT staff_id, first_name, last_name, sum(amount)
FROM staff
JOIN payment USING (staff_id)
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff_id;

--11) List each film and the number of actors who are listed for that film.

SELECT title, count(title) AS 'num_actors'
FROM film
JOIN film_actor USING(film_id)
GROUP By film.film_id;

--12) How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT title, count(title) AS inventory
FROM film
JOIN inventory USING(film_id)
GROUP BY title
HAVING title LIKE 'Hunchback%';

--13) The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

SELECT title AS Title
FROM film
JOIN language USING(language_id)
WHERE title LIKE 'q%' OR title LIKE 'k%' AND title IN(
	SELECT title
	FROM film
	WHERE language_id = '1');

--14) Use subqueries to display all actors who appear in the film Alone Trip.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id
	FROM film_actor
	WHERE film_id = 
		(SELECT film_id
		FROM film
		WHERE title = 'alone trip'));

--15) You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.

SELECT first_name, last_name, email
FROM customer
WHERE address_id in(
	SELECT address_id
	FROM address
	WHERE city_id in(
		SELECT city_id
		FROM city
		WHERE country_id = 
			(SELECT country_id
			FROM country
			WHERE country = 'canada')));

--16) Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.

SELECT title
FROM film
WHERE film_id IN(
	SELECT film_id
	FROM film_category
	WHERE category_id in(
		(SELECT category_id
		FROM category
		WHERE name = 'family')));

--17) Write a query to display how much business, in dollars, each store brought in.



--18) Write a query to display for each store its store ID, city, and country.



--19) List the top five genres in gross revenue in descending order.


--1) Select Statements

--a) Select all columns from the actor table.

SELECT * FROM actor;

--b) Select only the last_name column from the actor table.

SELECT last_name FROM actor;

--c) Select only the following columns from the film table.

SELECT * FROM film;

--2) Distinct Operator

--a) Select all distinct (different) last names from the actor table.

SELECT DISTINCT last_name FROM actor;

--b) Select all distinct (different) postal codes from the address table.

SELECT DISTINCT postal_code FROM address;

--c) Select all distinct (different) ratings from the film table.

SELECT DISTINCT rating FROM film;

--3) WHERE clause

--a) Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.

SELECT title, description, rating, length 
FROM film
WHERE length >= 180;

--b) Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.

SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date > '2005-05-27';

--c) Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.

SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date LIKE '2005-05-27%';

--d) Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.

SELECT * FROM customer
WHERE last_name LIKE 's%'
AND first_name LIKE '%n';

--e) Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".

SELECT * FROM customer
WHERE active = 0 
OR last_name LIKE 'm%';

--f) Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.

SELECT * FROM category
WHERE category_id > 4
AND name LIKE 'c%' OR name LIKE 'S%' OR name LIKE 'T%';

--g) Select all columns minus the password column from the staff table for rows that contain a password.

SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;

--h) Select all columns minus the password column from the staff table for rows that do not contain a password.

SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NULL;

-- IN Operator

--a) Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.

SELECT phone, district FROM address
Where district IN('california', 'england', 'taipei', 'west java');

--b) Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)

SELECT payment_id, amount, payment_date
FROM payment
WHERE date(payment_date) IN('2005-05-25', '2005-05-27', '2005-05-29');

--c) Select all columns from the film table for films rated G, PG-13 or NC-17.

SELECT * FROM film
WHERE rating IN('g', 'pg-13', 'nc-17');

-- BETWEEN Operator

--a) Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.

SELECT * FROM payment
WHERE payment_date BETWEEN '2005-05-25 00:00:00' AND '2005-05-25 23:59:59';

--b) Select the following columns from the film table for films where the length of the description is between 100 and 120.

SELECT * FROM film
WHERE length BETWEEN 100 AND 200;

--6) LIKE Operator

--a) Select the following columns from the film table for rows where the description begins with "A Thoughtful".

SELECT * FROM film
WHERE description LIKE 'a thoughtful%';

--b) Select the following columns from the film table for rows where the description ends with the word "Boat".

SELECT * FROM film
WHERE description LIKE '%boat';

--c) Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.

SELECT * FROM film
WHERE description LIKE '%database%'
AND length > 180;

-- LIMIT Operator

--a) Select all columns from the payment table and only include the first 20 rows.

SELECT * FROM payment
LIMIT 20;

--b) Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.

SELECT payment_date, amount
FROM payment 
WHERE amount > 5 
LIMIT 1001 OFFSET 999;

--c) Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.

SELECT * FROM customer
LIMIT 100 OFFSET 100;

-- ORDER BY Statements

--a) Select all columns from the film table and order rows by the length field in ascending order.

SELECT * FROM film
ORDER BY length ASC;

--b) Select all distinct ratings from the film table ordered by rating in descending order.

SELECT * FROM film
ORDER BY length ASC;

--c) Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.

SELECT payment_date, amount
FROM payment
ORDER BY amount DESC
LIMIT 20;

--d) Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.

SELECT title, description, special_features, length, rental_duration
FROM film
WHERE special_features LIKE '%behind the scenes%'
AND length < 120
AND rental_duration BETWEEN 5 and 7
ORDER BY length DESC
LIMIT 10;

-- JOIN s

-- a) Select customer first_name/last_name and actor first_name/last_name columns
-- from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 599



--b) Select the customer first_name/last_name and actor first_name/last_name columns
-- from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200



-- c) Select the customer first_name/last_name and actor first_name/last_name columns
-- from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43



--d) Select the city name and country name columns from the city table
-- performing a left join with the country table to get the country name column.
-- Returns correct records: 600



--e) Select the title, description, release year, and language name columns from the film table
-- performing a left join with the language table to get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows



--f) Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table
-- performing 2 left joins with the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2








*/