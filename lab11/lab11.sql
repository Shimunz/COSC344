Part1:
	You: grant select on emp to juzaho1;
	Friend: select * from juzhao.emp;

Part2:
	You: grant update (dname), select on dept to juzhao1;
	Friend: update juzhao.dept set dname = 'Researchy' where dname = 'Research';
	Friend: update juzhao.dept set dnumber = 8 where dname = 'Researchy';

Part3:
	You: revoke select on emp from juzhao1;
	You: revoke select, update on dept from juzhao1;
	Friend: select * from juzhao.emp;
	Friend: select * from juzhao.dept;

Part4:
	You: create role staff;
	You: grant select on emp to staff;
	You: grant select on dept to staff;
	You: grant staff to juzhao1;
	Friend: select * from juzhao.emp;
	Friend: select * from juzhao.dept;

Part5:
	You: create view super as select fname, lname, dname from emp, dept where dno = dnumber;
	You: grant select on super to juzhao1;
	Friend: select * from juzhao1.super;

Part6:
	You: create view salary as select fname, lname, salary from emp where salary < 50000;
	You: grant select on salary to juzhao1;
	Friend: select * from juzhao.salary;
