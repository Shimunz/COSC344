SELECT DISTINCT s.snum, sname FROM salespeople s, customers WHERE (select count(*) from customers c where s.snum=c.snum)>1;