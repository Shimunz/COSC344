SELECT * FROM orders WHERE amt > ALL(SELECT AVG(amt) FROM orders WHERE odate = TO_DATE('03-10-1990', 'DD-MM-YYYY'));
