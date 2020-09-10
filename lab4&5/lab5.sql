SELECT snum, MAX(amt) FROM orders GROUP BY snum ORDER BY snum;
SELECT MAX(amt), snum FROM orders WHERE amt > 3000 GROUP BY snum ORDER BY snum;
SELECT fname, lname, salary FROM employee ORDER BY salary, lname;
SELECT onum, cname, orders.cnum, orders.snum FROM orders, customers, salespeople WHERE customers.cnum=orders.cnum AND salespeople.snum=orders.snum AND salespeople.city != customers.city;
SELECT cname, amt FROM customers, orders WHERE amt = (SELECT MAX(amt) FROM orders) and customers.cnum = orders.cnum;
SELECT * FROM orders WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = TO_DATE('03-10-1990', 'DD-MM-YYYY'));
SELECT * FROM orders WHERE snum = (SELECT snum FROM salespeople WHERE city IN ('London') AND orders.snum = salespeople.snum);
