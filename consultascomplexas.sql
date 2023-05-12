show tables;

/*Query 0*/

select Bdate, Address
from employee
where Fname = 'John' and Minit = 'B' and Lname = 'Smith';

/*Query 1*/
select FNAME, LNAME from EMPLOYEE
where SUPER_SSN is NULL;

/*Query 2*/
select FNAME, LNAME from EMPLOYEE
where SUPER_SSN is not NULL;

/*Query 3*/
SELECT DISTINCT Pnumber FROM PROJECT
WHERE Pnumber IN
	( SELECT Pnumber FROM PROJECT, DEPARTMENT, EMPLOYEE
	WHERE Dnum = Dnumber AND
	Mgr_ssn = Ssn AND Lname = ‘Smith’)
	OR
	Pnumber IN
	( SELECT Pno FROM WORKS_ON, EMPLOYEE
	WHERE Essn = Ssn AND Lname = ‘Smith’);

/*Query 4*/
SELECT DISTINCT Essn FROM WORKS_ON
	WHERE (Pno, Hours) IN
	( SELECT Pno, Hours
	FROM WORKS_ON WHERE Essn = ‘123456789’ );

/*Query 5*/
 SELECT Lname, Fname
FROM EMPLOYEE
WHERE Salary > ALL
  ( SELECT Salary FROM EMPLOYEE WHERE Dno = 5 );
  
/*Query 6*/
SELECT E.Fname, E.Lname FROM EMPLOYEE AS E
WHERE E.Ssn IN
	( SELECT D.Essn FROM DEPENDENT AS D
	WHERE E.Fname = D.Dependent_name
	AND E.Sex = D.Sex );
  
  
/*Query 7*/
SELECT E.Fname, E.Lname
FROM EMPLOYEE AS E, DEPENDENT AS D
WHERE E.Ssn = D.Essn AND E.Sex = D.Sex
	AND E.Fname = D.Dependent_name;

/*Query 8*/
SELECT E.Fname, E.Lname
FROM EMPLOYEE AS E
WHERE EXISTS ( SELECT *
	FROM DEPENDENT AS D
	WHERE E.Ssn = D.Essn AND E.Sex = D.Sex
	AND E.Fname = D.Dependent_name);
SELECT Fname, Lname
FROM EMPLOYEE
WHERE NOT EXISTS ( SELECT * FROM DEPENDENT
	WHERE Ssn = Essn );
/*Query 9*/
SELECT Fname, Lname
FROM EMPLOYEE
WHERE EXISTS ( SELECT *
	FROM DEPENDENT WHERE Ssn = Essn )
	AND
	EXISTS ( SELECT *
	FROM DEPARTMENT WHERE Ssn = Mgr_ssn );
    
/*Query 10*/
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM EMPLOYEE;

/*Query 11*/
SELECT SUM(Salary) AS Total_Sal, MAX(Salary) AS Highest_Sal,
MIN(Salary) AS Lowest_Sal, AVG(Salary) AS Average_Sal
FROM EMPLOYEE;

/*Query 12*/
SELECT SUM(Salary), MAX(Salary), MIN(Salary), AVG(Salary)
FROM (EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber)
WHERE Dname = ‘Research’;

/*Query 13*/
SELECT COUNT(*)
FROM EMPLOYEE;

/*Query 14*/
SELECT COUNT(*)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER AND DNAME = ‘Research’;

/*Query 15*/
SELECT COUNT(DISTINCT Salary)
FROM EMPLOYEE;

/*Query 16*/
SELECT Lname, Fname
FROM EMPLOYEE
WHERE ( SELECT COUNT(*)
	FROM DEPENDENT
	WHERE Ssn = Essn ) >= 2;

/*Query 17*/
SELECT Dno, COUNT(*), AVG(Salary)
FROM EMPLOYEE
GROUP BY Dno;

/*Query 18*/
SELECT Pnumber, Pname, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname;

/*Query 19*/
SELECT Pnumber, Pname, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname
HAVING COUNT(*) > 2;

/*Query 20*/
SELECT Pnumber, Pname, COUNT(*)
FROM PROJECT, WORKS_ON, EMPLOYEE
WHERE Pnumber = Pno AND Ssn = Essn AND Dno = 5
GROUP BY Pnumber, Pname;

/*Query 21*/
SELECT Dno, COUNT(*)
FROM EMPLOYEE
WHERE Salary>4000
GROUP BY Dno
HAVING COUNT(*) > 3;

/*Query 22*/
SELECT Dno, COUNT(*)
FROM EMPLOYEE
WHERE Salary>4000 AND Dno IN
	( SELECT Dno
	FROM EMPLOYEE GROUP BY Dno
	HAVING COUNT(*) > 3)
GROUP BY Dno;

/*Aula12*/

CREATE VIEW WORKS_ON1
	AS SELECT Fname, Lname, Pname, Hours
	FROM EMPLOYEE, PROJECT, WORKS_ON
	WHERE Ssn = Essn AND Pno = Pnumber;

CREATE VIEW DEPT_INFO(Dept_name, No_of_emps, Total_sal)
	AS SELECT Dname, COUNT(*), SUM(Salary)
	FROM DEPARTMENT, EMPLOYEE
	WHERE Dnumber = Dno
	GROUP BY Dname;
    
SHOW FULL TABLES
WHERE table_type = 'VIEW';

SELECT Fname, Lname
FROM WORKS_ON1
WHERE Pname = 'ProductX';