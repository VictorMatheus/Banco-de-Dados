# query 0
SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

# query 1
SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTMENT
WHERE Dname = 'Research' AND Dnumber = Dno;

# query 2
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Plocation = 'Stafford';

# query 3
SELECT E.Fname, E.Lname, S.Fname, S.Lname
FROM EMPLOYEE AS E, EMPLOYEE AS S
WHERE E.Super_ssn = S.Ssn;

# query 4
SELECT Ssn
FROM EMPLOYEE;

# query 5
SELECT Ssn, Dname
FROM EMPLOYEE, DEPARTMENT;

# query 6
SELECT *
FROM EMPLOYEE
WHERE Dno = 5;

#Query 7
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE Dname = 'Research' AND Dno = Dnumber;

# query 8
SELECT ALL Salary
FROM EMPLOYEE;

# query 9
SELECT DISTINCT Salary
FROM EMPLOYEE;
