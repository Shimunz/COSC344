SELECT * FROM orders oouter WHERE amt > (SELECT avg(amt) FROM orders oinner WHERE oouter.cnum = oinner.cnum);