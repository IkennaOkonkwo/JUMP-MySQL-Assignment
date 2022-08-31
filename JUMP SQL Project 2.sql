CREATE TABLE EmployeeInfo(
EMPID varchar(2),
EMPFNAME varchar(10) DEFAULT NULL,
EMPLNAME varchar(10) DEFAULT NULL,
DEPARTMENT varchar(10) DEFAULT NULL,
PROJECT varchar(20) DEFAULT NULL,
ADDRESS varchar(15) DEFAULT NULL,
DOB date NOT NULL,
GENDER varchar(1) DEFAULT NULL,
EMAIL varchar(30) DEFAULT NULL
);
INSERT INTO EmployeeInfo (EMPID, EMPFNAME, EMPLNAME, DEPARTMENT, PROJECT, ADDRESS, DOB, GENDER,EMAIL)
VALUES (1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '1976-01-12', "M", "SANM@GMAIL.COM"),
	   (2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-02-05', "F", 'ANAM@GMAIL.COM'),
       (3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', "M", 'ROHD@GMAIL.COM'),
       (4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-02-05', "F", 'SONK@GMAIL.COM'),
       (5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL) ', '1994-03-07', "M", 'ANKK@GMAIL.COM');

CREATE TABLE EmployeePosition(
EMPID varchar(2),
EMPPOSITION varchar(10) DEFAULT NULL,
DATEOFJOINING date DEFAULT NULL,
SALARY varchar(6) DEFAULT NULL
);
INSERT INTO EmployeePosition (EMPID, EMPPOSITION , DATEOFJOINING, SALARY)
VALUES (1, 'Manager', '2022-01-05', "500000"),
	   (2, 'Executive', '2022-02-05', "75000"),
       (3, 'Manager', '2022-01-05', "90000"),
	   (2, 'Lead', '2022-02-05', "85000"),
       (1, 'Executive', '2022-01-05', "300000");

/*
1. Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use
the ALIAS name as EmpName.
*/
SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;

/*
2. Write a query to fetch the number of employees working in the department ‘HR’.
*/
SELECT COUNT(*) FROM EmployeeInfo WHERE Department = 'HR';

/*
3. Write a query to get the current date
*/
SELECT NOW();

/*
4. Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table.
*/
SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;

/*
5. Write a query to fetch only the place name(string before brackets) from the Address column of
EmployeeInfo table.
*/
 SELECT SUBSTRING(Address, 1, LOCATE('(',Address)) FROM EmployeeInfo;
 
 /*
 6. Write a query to create a new table that consists of data and structure copied from the other
table.
 */
CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;

/*
7. Write a query to find all the employees whose salary is between 50000 to 100000
*/
SELECT * FROM EmployeePosition WHERE SALARY BETWEEN 50000 AND 100000;

/*
8. Write a query to find the names of employees that begin with ‘S’
*/
SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'S%';

/*
9. Write a query to fetch top N records
*/
SELECT * FROM EmployeePosition ORDER BY Salary DESC LIMIT 5;

/*
10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The
first name and the last name must be separated with space
*/
SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM EmployeeInfo;

/*
11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975
and are grouped according to gender.
*/
SELECT COUNT(*) FROM EmployeeInfo WHERE DOB BETWEEN "1970-02-05" AND "1975-12-31" GROUP BY Gender;
/*EMPTY SET BECAUSE NO BIRTHDAYS BETWEEN THOSE DATES */

/*
12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in
descending order and Department in the ascending order.
*/
SELECT * FROM EmployeeInfo ORDER BY EmpFname desc, Department asc;

/*
13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and
contains five alphabets.
*/
SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';

/*
14. Write a query to fetch details of all employees excluding the employees with first names,
“Sanjay” and “Sonia” from the EmployeeInfo table.
*/
SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay','Sonia');

/*
15. Write a query to fetch details of employees with the address as “DELHI(DEL)”
*/
SELECT * FROM EmployeeInfo WHERE Address LIKE 'DELHI(DEL)%';

/*
16. Write a query to fetch all employees who also hold the managerial position.
*/
SELECT E.EmpFname, E.EmpLname, P.EmpPosition FROM EmployeeInfo E 
INNER JOIN EmployeePosition P ON E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');

/*
17. Write a query to fetch the department-wise count of employees sorted by department’s count in
ascending order.
*/ 
SELECT Department, count(EmpID) AS EmpDeptCount FROM EmployeeInfo GROUP BY Department ORDER BY EmpDeptCount ASC;

/*
18. Write a query to calculate the even and odd records from a table
*/
SELECT EmpID FROM (SELECT EmpID FROM EmployeeInfo) AS T WHERE MOD(EMPID,2)=0;
SELECT EmpID FROM (SELECT EmpID FROM EmployeeInfo) AS T WHERE MOD(EMPID,2)=1;

/*
19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of
joining in the EmployeePosition table
*/
SELECT * FROM EmployeeInfo E WHERE EXISTS (SELECT * FROM EmployeePosition P WHERE E.EmpId = P.EmpId);

/*
20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition
table.
*/
SELECT DISTINCT Salary FROM EmployeePosition E1 WHERE 2 >= (SELECT COUNT(DISTINCT Salary)FROM EmployeePosition E2 WHERE E1.Salary >= E2.Salary) ORDER BY E1.Salary DESC;
SELECT DISTINCT Salary FROM EmployeePosition E1 WHERE 2 >= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition E2 WHERE E1.Salary <= E2.Salary) ORDER BY E1.Salary DESC;

/*
21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword
*/
SELECT Salary FROM EmployeePosition E1 WHERE 5-1 = ( SELECT COUNT( DISTINCT ( E2.Salary ) ) FROM EmployeePosition E2 WHERE E2.Salary > E1.Salary );

/*
22. Write a query to retrieve duplicate records from a table.
*/
SELECT EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender, COUNT(*) FROM EmployeeInfo GROUP BY EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender HAVING COUNT(*) > 1;

/*
23. Write a query to retrieve the list of employees working in the same department.
*/
Select DISTINCT E1.EmpID, E1.EmpFname, E1.EmpLname, E1.Department FROM EmployeeInfo E1, EmployeeInfo E2 WHERE E1.Department = E2.Department AND E1.EmpID != E2.EmpID;

/*
24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
*/
SELECT * FROM EmployeeInfo WHERE EmpID >=3 UNION SELECT * FROM (SELECT * FROM EmployeeInfo E ORDER BY E.EmpID DESC) AS E1 WHERE E1.EmpID >=3;

/*
25. Write a query to find the third-highest salary from the EmpPosition table.
*/
SELECT * FROM employeePosition ORDER BY salary ASC LIMIT 1 OFFSET 2;

/*
26. Write a query to display the first and the last record from the EmployeeInfo table.
*/
SELECT * FROM EmployeeInfo WHERE EmpID = (SELECT MIN(EmpID) FROM EmployeeInfo);
SELECT * FROM EmployeeInfo WHERE EmpID = (SELECT MAX(EmpID) FROM EmployeeInfo);

/*
27. Write a query to add email validation to your database
*/
SELECT Email FROM EmployeeInfo WHERE Email REGEXP '^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';

/*
28. Write a query to retrieve Departments who have less than 2 employees working in it.
*/
SELECT DEPARTMENT, COUNT(EMPID) as 'EmpNo' FROM EmployeeInfo GROUP BY DEPARTMENT HAVING COUNT(EmpID) < 2;

/*
29. Write a query to retrieve EmpPostion along with total salaries paid for each of them.
*/
SELECT EmpPosition, SUM(Salary) from EmployeePosition GROUP BY EmpPosition;

/*
30. Write a query to fetch 50% records from the EmployeeInfo table.
*/
SELECT * FROM EmployeeInfo WHERE EmpID <= (SELECT COUNT(EmpID)/2 from EmployeeInfo);