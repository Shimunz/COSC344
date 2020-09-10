SELECT * FROM orders WHERE snum = (SELECT snum FROM salespeople WHERE city IN ('London') AND orders.snum = salespeople.snum);
