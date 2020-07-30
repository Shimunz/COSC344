SELECT DISTINCT fname, lname FROM employee JOIN works_on ON essn=ssn WHERE hours < 18 ORDER BY fname;
