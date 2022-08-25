/* 1. Write a SQL statement to create a simple table countries including columns
country_id,country_name and region_id.
*/
CREATE TABLE Countries(
COUNTRY_ID varchar(2) DEFAULT NULL,
COUNTRY_NAME varchar(50) DEFAULT NULL,
REGION_ID decimal(50,0) DEFAULT NULL
);

/* 2. Write a SQL statement to create a simple table countries including columns
country_id,country_name and region_id which is already exists. Verify it as well.
*/
CREATE TABLE IF NOT EXISTS Countries ( 
COUNTRY_ID varchar(2) DEFAULT NULL,
COUNTRY_NAME varchar(50) DEFAULT NULL,
REGION_ID decimal(50,0) DEFAULT NULL
);

/* 3. Write a SQL statement to create the structure of a 
table dup_countries similar to countries.
*/
CREATE TABLE IF NOT EXISTS Dup_Countries
LIKE Countries;

/* 4. Write a SQL statement to create a duplicate copy 
of countries table including structure and data
by name dup_countries.
*/
CREATE TABLE IF NOT EXISTS Dup_Countries
AS SELECT * FROM  Countries;

/* 5. Write a SQL statement to create a table countries set a constraint NULL.
*/
CREATE TABLE IF NOT EXISTS Countries ( 
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(50) NOT NULL,
REGION_ID decimal(50,0) NOT NULL
);

/* 6. Write a SQL statement to create a table named jobs including columns job_id, job_title,
min_salary, max_salary and check whether the max_salary amount exceeding the upper limit
25000.
*/
CREATE TABLE Jobs ( 
JOB_ID varchar(2) DEFAULT NULL, 
JOB_TITLE varchar(50) DEFAULT NULL, 
MIN_SALARY decimal(5,2) DEFAULT NULL, 
MAX_SALARY decimal(5,2) DEFAULT NULL 
CHECK(MAX_SALARY<=25000)
);

/* 7. Write a SQL statement to create a table named countries including columns country_id,
country_name and region_id and make sure that no countries except Italy, India and China will be
entered in the table.
*/
CREATE TABLE IF NOT EXISTS Countries ( 
COUNTRY_ID varchar(2) DEFAULT NULL,
COUNTRY_NAME varchar(50) DEFAULT NULL
CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
REGION_ID decimal(50,0)
);

/* 8. Write a SQL statement to create a table named job_histry including columns employee_id,
start_date, end_date, job_id and department_id and make sure that the value against column
end_date will be entered at the time of insertion to the format like '--/--/----'.
*/
CREATE TABLE Job_History ( 
EMPLOYEE_ID decimal(5,0) NOT NULL, 
START_DATE date NOT NULL, 
END_DATE date NOT NULL
CHECK (END_DATE LIKE '--/--/----'), 
JOB_ID varchar(50) NOT NULL, 
DEPARTMENT_ID decimal(5,0) NOT NULL 
);

/* 9. Write a SQL statement to create a table named countries including columns
country_id,country_name and region_id and make sure that no duplicate data against column
country_id will be allowed at the time of insertion.
*/
CREATE TABLE IF NOT EXISTS Countries ( 
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(50) NOT NULL,
REGION_ID decimal(50,0) NOT NULL,
UNIQUE(COUNTRY_ID)
);

/* 10. Write a SQL statement to create a table named jobs including columns job_id, job_title,
min_salary and max_salary, and make sure that, the default value for job_title is blank and
min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if
no value assigned for the specified columns.
*/
CREATE TABLE IF NOT EXISTS Jobs ( 
JOB_ID varchar(2) NOT NULL UNIQUE, 
JOB_TITLE varchar(50) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(5,2) DEFAULT 8000, 
MAX_SALARY decimal(5,2) DEFAULT NULL
);

/*11. Write a SQL statement to create a table named countries including columns country_id,
country_name and region_id and make sure that the country_id column will be a key field which
will not contain any duplicate data at the time of insertion.
*/
CREATE TABLE IF NOT EXISTS Countries ( 
COUNTRY_ID varchar(2) NOT NULL PRIMARY KEY,
COUNTRY_NAME varchar(50),
REGION_ID decimal(50,0)
);

/*
12. Write a SQL statement to create a table countries including columns country_id, country_name
and region_id and make sure that the column country_id will be unique and store an auto
incremented value.
*/
CREATE TABLE IF NOT EXISTS Countries ( 
COUNTRY_ID integer NOT NULL UNIQUE AUTO_INCREMENT,
COUNTRY_NAME varchar(50) NOT NULL,
REGION_ID decimal(50,0) NOT NULL
);

/*
13. Write a SQL statement to create a table countries including columns country_id, country_name
and region_id and make sure that the combination of columns country_id and region_id will be
unique
*/
CREATE TABLE IF NOT EXISTS Countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(50) DEFAULT NULL,
REGION_ID decimal(50,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

/*
14. Write a SQL statement to create a table job_history including columns employee_id, start_date,
end_date, job_id and department_id and make sure that, the employee_id column does not contain
any duplicate value at the time of insertion and the foreign key column job_id contain only those
values which are exists in the jobs table
*/
CREATE TABLE Job_History ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
START_DATE date NOT NULL, 
END_DATE date NOT NULL, 
JOB_ID varchar(50) NOT NULL, 
DEPARTMENT_ID decimal(5,0) DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

/*
15. Write a SQL statement to create a table employees including columns employee_id, first_name,
last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and
department_id and make sure that, the employee_id column does not contain any duplicate value
at the time of insertion and the foreign key columns combined by department_id and manager_id
columns contain only those unique combination values, which combinations are exists in the
departments table
*/
CREATE TABLE IF NOT EXISTS Employees ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(50) DEFAULT NULL, 
LAST_NAME varchar(50) NOT NULL, 
EMAIL varchar(50) NOT NULL, 
PHONE_NUMBER varchar(10) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(50) NOT NULL, 
SALARY decimal(5,2) DEFAULT NULL, 
COMMISSION_PCT decimal(5,5) DEFAULT NULL, 
MANAGER_ID decimal(5,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(5,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) 
REFERENCES  Departments(DEPARTMENT_ID,MANAGER_ID)
);

/*
16. Write a SQL statement to create a table employees including columns employee_id, first_name,
last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and
department_id and make sure that, the employee_id column does not contain any duplicate value
at the time of insertion, and the foreign key column department_id, reference by the column
department_id of departments table, can contain only those values which are exists in the
departments table and another foreign key column job_id, referenced by the column job_id of jobs 
*/
CREATE TABLE IF NOT EXISTS Employees ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(50) DEFAULT NULL, 
LAST_NAME varchar(50) NOT NULL, 
EMAIL varchar(50) NOT NULL, 
PHONE_NUMBER varchar(10) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(50) NOT NULL, 
SALARY decimal(5,2) DEFAULT NULL, 
COMMISSION_PCT decimal(5,5) DEFAULT NULL, 
MANAGER_ID decimal(5,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(5,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID) 
REFERENCES  Departments(DEPARTMENT_ID),
FOREIGN KEY(JOB_ID) 
REFERENCES  Jobs(JOB_ID)
)ENGINE=InnoDB;

/*
17. Write a SQL statement to create a table employees including columns employee_id, first_name,
last_name, job_id, salary and make sure that, the employee_id column does not contain any
duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column
job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB
Engine have been used to create the tables. The specialty of the statement is that, The ON UPDATE
CASCADE action allows you to perform cross-table update and ON DELETE RESTRICT action reject
the deletion. The default action is ON DELETE RESTRICT.
Assume that the structure of the table jobs and InnoDB Engine have been used to create the table
jobs.
*/
CREATE TABLE IF NOT EXISTS Employees ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(50) DEFAULT NULL, 
LAST_NAME varchar(50) NOT NULL,
JOB_ID varchar(50) NOT NULL,
SALARY decimal(5,2) DEFAULT NULL,  
FOREIGN KEY(JOB_ID) 
REFERENCES  Jobs(JOB_ID), 
FOREIGN KEY(DEPARTMENT_ID) 
REFERENCES Departments(DEPARTMENT_ID)
ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE=InnoDB;

/*
18. Write a SQL statement to create a table employees including columns employee_id, first_name,
last_name, job_id, salary and make sure that, the employee_id column does not contain any
duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column
job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB
Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE
CASCADE that lets you allow to delete records in the employees(child) table that refer to a record
in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE
RESTRICT actions reject any updates.
*/
CREATE TABLE IF NOT EXISTS Employees ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(50) DEFAULT NULL, 
LAST_NAME varchar(50) NOT NULL, 
JOB_ID INTEGER NOT NULL, 
SALARY decimal(5,2) DEFAULT NULL, 
FOREIGN KEY(JOB_ID) 
REFERENCES  Jobs(JOB_ID) 
ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB;

/*
19. Write a SQL statement to create a table employees including columns employee_id, first_name,
last_name, job_id, salary and make sure that, the employee_id column does not contain any
duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column
job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB
Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE
SET NULL action will set the foreign key column values in the child table(employees) to NULL when
the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the
child table must accept NULL values and the ON UPDATE SET NULL action resets the values in the
rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are
updated. Assume that the structure of two table jobs and InnoDB Engine have been used to create the table
jobs
*/
CREATE TABLE IF NOT EXISTS Employees ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(50) DEFAULT NULL, 
LAST_NAME varchar(50) NOT NULL, 
JOB_ID INTEGER, 
SALARY decimal(6,2) DEFAULT NULL, 
FOREIGN KEY(JOB_ID) 
REFERENCES  jobs(JOB_ID)
ON DELETE SET NULL 
ON UPDATE SET NULL
)ENGINE=InnoDB;

/*
20. Write a SQL statement to create a table employees including columns employee_id, first_name,
last_name, job_id, salary and make sure that, the employee_id column does not contain any
duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column
job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB
Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE
NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.
Assume that the structure of two table jobs and InnoDB Engine have been used to create the table
jobs.
*/
CREATE TABLE IF NOT EXISTS Employees ( 
EMPLOYEE_ID decimal(5,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(50) DEFAULT NULL, 
LAST_NAME varchar(50) NOT NULL, 
JOB_ID INTEGER NOT NULL, 
SALARY decimal(5,2) DEFAULT NULL, 
FOREIGN KEY(JOB_ID) 
REFERENCES  Jobs(JOB_ID)
ON DELETE NO ACTION 
ON UPDATE NO ACTION
)ENGINE=InnoDB;

/*************************
21 Sakila DB exercises
*************************/
/*
1. Which actors have the first name ‘scarlett’
ANSWER: SCARLETT DAMON, SCARLETT BENING
*/
SELECT * FROM actor WHERE first_name = 'Scarlett';

/*2. Which actors have the last name ‘johansson’
ANSWER: MATTHEW JOHANSSON, RAY JOHANSSON, AND ALBERT JOHANSSON
*/
SELECT * FROM actor WHERE last_name = 'Johansson';

/*3. How many distinct actors last names are there?
ANSWER: 121
*/
SELECT count(distinct last_name) FROM actor;

/*4. Which last names are not repeated?
ANSWER: ASTAIRE, BACALL, BARRYMORE, BASINGER, BERGEN, BERGMAN, BIRCH, BLOOM, BRIDGES, BULLOCK, CARREY, CHAPLIN, CLOSE, COSTNER,
		CRUISE, CRUZ, DAMON, DAY-LEWIS, DERN, DREYFUSS, DUNST, GABLE, GIBSON, GOLDBERG, GRANT, HAWKE, HESTON, HOPE, HUDSON, HURT,
        JOLIE, JOVOVICH, LEIGH, LOLLOBRIGIDA, MALDEN, MANSFIELD, MARX, MCDORMAND, MIRANDA, NICHOLSON, PESCI, PFEIFFER, PHOENIX,
        PINKETT, PITT, POSEY, PRESELY, REYNOLDS, RYDER, SINATRA, SOBIESKI, STALLONE, SUVARI, SWANK, TAUTOU, TOMEI, VOIGHT, WALKEN,
        WAYNE, WILSON, WITHERSPOON, WRAY
*/
SELECT last_name FROM actor GROUP BY last_name HAVING count(*) = 1;

/*5. Which last names appear more than once?
ANSWER: AKROYD, ALLEN, BAILEY, BENING, BERRY, BOLGER, BRODY, CAGE, CHASE, CRAWFORD, CRONYN, DAVIS, DEAN, DEE, DEGENERES, DENCH, DEPP, 
		DUKAKIS, FAWCETT, GARLAND, GOODING, GUINESS, HACKMAN, HARRIS, HOFFMAN, HOPKINS, HOPPER, JACKMAN, JOHANSSON, KEITEL, KILMER, 
        MCGONAUGHEY, MCKELLEN, MCQUEEN, MONROE,MOSTEL, NEESON, NOLTE, OLIVIER, PALTROW, PECK, PENN, SILVERSTONE, STREEP, TANDY, TEMPLE,
        TORN, TRACY, WAHLBERG, WEST, WILLIAMS, WILLIS, WINSLET, WOOD, ZELLWEGER
*/
SELECT last_name FROM actor GROUP BY last_name HAVING count(*) > 1;
   
/*6. Which actor has appeared in the most films?
ANSWER:  GINA DEGENERES AT 42       
*/
SELECT actor.actor_id, actor.first_name, actor.last_name,
       count(actor_id) as film_count
FROM actor JOIN film_actor USING (actor_id)
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;

/*7. Is ‘academy dinosaur’ available for rent from store 1?
ANSWER: YES
*/
SELECT film.film_id, film.title, store.store_id, inventory.inventory_id
FROM inventory JOIN store USING (store_id) JOIN film USING (film_id)
WHERE film.title = 'Academy Dinosaur' AND store.store_id = 1;

SELECT inventory.inventory_id
FROM inventory  JOIN store USING (store_id)
				JOIN film USING (film_id)
				JOIN rental USING (inventory_id)
WHERE film.title = 'Academy Dinosaur'
      AND store.store_id = 1
      AND NOT EXISTS (SELECT * FROM rental
                      WHERE rental.inventory_id = inventory.inventory_id
                      AND rental.return_date IS NULL);

/* 8. Insert a record to represent mary smith renting ‘academy dinosaur’ from mike hillyer at
store 1 today .
ANSWER: BELOW
*/
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (NOW(), 1, 1, 1);

/*9. When is ‘academy dinosaur’ due?
ANSWER: '2022-08-31 10:29:25'

*/
SELECT rental_duration FROM film WHERE film_id = 1; 
SELECT rental_date, rental_date + INTERVAL(SELECT rental_duration FROM film WHERE film_id = 1) DAY AS due_date FROM rental 
WHERE rental_id = (SELECT rental_id FROM rental ORDER BY rental_id DESC LIMIT 1);

/*10. What is that average running time of all the films in the sakila db?
ANSWER: 115.2720
*/
SELECT AVG(length) FROM film;

/*11. What is the average running time of films by category?
ANSWER: 'Sports', '128.2027'
'Games', '127.8361'
'Foreign', '121.6986'
'Drama', '120.8387'
'Comedy', '115.8276'
'Family', '114.7826'
'Music', '113.6471'
'Travel', '113.3158'
'Horror', '112.4821'
'Classics', '111.6667'
'Action', '111.6094'
'New', '111.1270'
'Animation', '111.0152'
'Children', '109.8000'
'Documentary', '108.7500'
'Sci-Fi', '108.1967'
*/
SELECT category.name, AVG(length)
FROM film JOIN film_category USING (film_id) JOIN category USING (category_id)
GROUP BY category.name
ORDER BY AVG(length) DESC;

/*12. Why does this query return the empty set?
		a. Select * from film natural join inventory;
ANSWER: Both the film table and inventory table have missmatched records for last_update
*/    