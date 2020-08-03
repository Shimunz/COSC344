SELECT cname, amt FROM customers JOIN orders ON customers.CNUM = orders.CNUM WHERE amt BETWEEN 1500 AND 5000;
