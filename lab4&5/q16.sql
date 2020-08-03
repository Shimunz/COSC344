SELECT cname, amt FROM customers, orders WHERE customers.cnum = (SELECT orders.cnum FROM orders WHERE amt = MAX(AMT));
