SELECT onum, cname, orders.cnum, orders.snum
FROM orders, customers, salespeople
WHERE customers.cnum=orders.cnum
AND salespeople.snum=orders.snum
AND salespeople.city != customers.city;
