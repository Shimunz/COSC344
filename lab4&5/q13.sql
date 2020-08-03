SELECT MAX(amt), snum FROM orders WHERE amt > 3000 GROUP BY snum ORDER BY snum;
