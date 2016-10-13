sales number(10, 2);
pi CONSTANT double precision := 3.1415;
name varchar2(25);
address varchar2(100);
sales number(10, 2);
name varchar2(25);
address varchar2(100);
----------------------------------------------
DECLARE
	a integer := 10;
	b integer := 20;
	c integer;
	f real;
BEGIN
	c := a + b;
	dbms_output.put_line('Value of c : ' || c);
	f := 70.3/3.0;
	dbms_output.put_line('value of f : ' || f);
END;
/