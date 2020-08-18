DROP TABLE emp_dep;

CREATE TABLE emp_dep
	AS (SELECT e.fname, e.lname, d.dependent_name, d.sex, d.bdate
	FROM employee e, dependent d
	WHERE d.essn = e.ssn) ORDER BY fname;


SELECT * FROM emp_dep;