SQL> create table customers(
  2  id number(12),
  3  name varchar2(20),
  4  age number(2),
  5  address varchar2(21),
  6  salary number(6)
  7  );

Table created.

SQL> desc customers;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                                 NUMBER(12)
 NAME                                               VARCHAR2(20)
 AGE                                                NUMBER(2)
 ADDRESS                                            VARCHAR2(21)
 SALARY                                             NUMBER(6)


 
 
DECLARE
	total_rows number(2);
BEGIN
	UPDATE customers
	SET salary = salary + 500;
	IF sql%notfound THEN
		dbms_output.put_line('no customers selected');
	ELSIF sql%found THEN
		total_rows := sql%rowcount;
		dbms_output.put_line( total_rows || ' customers selected ');
	END IF;
END;
/