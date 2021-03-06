SELECT DISTINCT s.snum, sname FROM salespeople s, customers WHERE (select count(*) from customers c where s.snum=c.snum)>1;

SELECT * FROM orders orderOut WHERE amt > (SELECT avg(amt) FROM orders orderIn WHERE orderOut.cnum = orderIn.cnum);

SELECT fname, lname FROM employee WHERE NOT EXISTS (SELECT * FROM dependent WHERE ssn=essn);

INSERT INTO department VALUES
('TempDept', 6, 123456789,
TO_DATE('18-Jul-2002', 'DD-MON-YYYY'));
INSERT INTO project VALUES
('TempProject', 50, 'Houston', 6);
SELECT pno FROM works_on, employee WHERE lname = 'Smith' AND works_on.essn = employee.ssn UNION SELECT pnumber FROM department, project, employee WHERE lname = 'Smith' AND project.dnum = dnumber AND mgrssn = employee.ssn;

UPDATE employee SET salary = salary + salary*.10 WHERE lname <> 'Borg';
SELECT lname, salary FROM employee;

DROP TABLE hou_emp;
CREATE TABLE hou_emp AS (SELECT * FROM employee WHERE address LIKE '%Houston%');
SELECT * FROM hou_emp;

DROP TABLE emp_dep;
CREATE TABLE emp_dep
	AS (SELECT e.fname, e.lname, d.dependent_name, d.sex, d.bdate
	FROM employee e, dependent d
	WHERE d.essn = e.ssn) ORDER BY fname;
SELECT * FROM emp_dep;
