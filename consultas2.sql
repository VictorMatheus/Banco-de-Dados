# query 0
INSERT INTO EMPLOYEE
VALUES ( 'Richard', 'K', 'Marini', '653298653', '1962-12-30', '98
Oak Forest, Katy, TX', 'M', 37000, '653298653', 4 );

# query 1
INSERT INTO EMPLOYEE (Fname, Lname, Dno, Ssn)
VALUES ('Richard', 'Marini', 4, '653298653');

# query 2
INSERT INTO EMPLOYEE (Fname, Lname, Ssn, Dno)
VALUES ('Robert', 'Hatcher', '980760540', 2);

# query 3
INSERT INTO EMPLOYEE (Fname, Lname, Ssn, Dno)
VALUES ('Robert', 'Hatcher', '980760540', 2);

# query 4
INSERT INTO EMPLOYEE (Fname, Lname, Dno)
VALUES ('Robert', 'Hatcher', 5);

# query 5
CREATE TABLE WORKS_ON_INFO
(Emp_name varchar(15),
Proj_name varchar(15),
Hours_per_week decimal(3,1));

# query 6
INSERT INTO WORKS_ON_INFO(Emp_name,Proj_name,Hours_per_week)
SELECT E.Lname, P.Pname, W.Hours
FROM PROJECT P, WORKS_ON W, EMPLOYEE E
WHERE P.Pnumber = W.Pno AND W.Essn = E.Ssn;

# query 7
CREATE TABLE D5EMPS LIKE EMPLOYEE;
INSERT INTO D5EMPS SELECT * FROM EMPLOYEE WHERE Dno = 5;

# query 8
SET SQL_SAFE_UPDATES = 0; -- DESATIVA O MODO DE ATUALIZAÇÃO SEGURA --
DELETE FROM EMPLOYEE
WHERE Lname = 'Brown';
SET SQL_SAFE_UPDATES=1;

# query 9
SET SQL_SAFE_UPDATES = 0;
DELETE FROM EMPLOYEE
WHERE Ssn = '123456789';
SET SQL_SAFE_UPDATES=1;

# query 10
SET SQL_SAFE_UPDATES = 0;
DELETE FROM EMPLOYEE
WHERE Dno = '5';
SET SQL_SAFE_UPDATES=1;

# query 11
SET SQL_SAFE_UPDATES = 0;
DELETE FROM EMPLOYEE;
SET SQL_SAFE_UPDATES=1;

# query 12
UPDATE PROJECT
SET Plocation = 'Bellaire', Dnum = 5
WHERE Pnumber = 10;

# query 13
UPDATE EMPLOYEE
SET   Salary = Salary* 1.1
WHERE Dno = 5;
