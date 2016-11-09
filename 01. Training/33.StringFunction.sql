DECLARE
	greeting varchar2(11) := 'hello wold';
BEGIN
	dbms_output.put_line(UPPER(greeting));
		--HELLO WOLD
	dbms_output.put_line(LOWER(greeting));
		--hello wold
	dbms_output.put_line(INITCAP(greeting));
		--Hello Wold
	dbms_output.put_line(SUBSTR(greeting, 1, 1));
		--h
	dbms_output.put_line(SUBSTR(greeting, -1, 1));
		--d
	dbms_output.put_line(SUBSTR(greeting, 7, 5));
		--wold
	dbms_output.put_line(SUBSTR(greeting, 2));
		--ello wold
	dbms_output.put_line(INSTR(greeting, 'e'));
		--2
END;
/
	