DROP TABLE lab4;

CREATE TABLE lab4
       (d date,
       t date);

COMMIT;
describe employee;
SELECT dependent_name FROM dependent WHERE sex = 'f' OR relationship = 'Spouse' OR relationship = 'Daughter';
SELECT pname FROM project WHERE plocation IS NULL;
SELECT fname, lname, dname FROM department INNER JOIN employee ON department.MGRSSN = EMPLOYEE.SSN;
SELECT DISTINCT fname, lname FROM employee JOIN works_on ON essn=ssn WHERE hours < 18 ORDER BY fname;
SELECT fname, lname FROM employee WHERE lname LIKE 'W%';
SELECT sname FROM salespeople WHERE city IN ('San Jose', 'Barcelona');
SELECT cname, amt FROM customers JOIN orders ON customers.CNUM = orders.CNUM WHERE amt BETWEEN 1500 AND 5000;
SELECT count(*) FROM orders;
select avg(amt) FROM orders;
SELECT * FROM employee WHERE ROWNUM <=5;
