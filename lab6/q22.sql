UPDATE employee SET salary = salary + salary*.10 WHERE lname <> 'Borg';

SELECT lname, salary FROM employee;