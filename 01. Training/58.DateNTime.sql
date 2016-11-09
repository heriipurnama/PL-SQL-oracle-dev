DECLARE
	lines dbms_output.chararr;
	num_lines number;
BEGIN
	--enable buffer
	dbms_output.enable;
	
	dbms_output.put_line('Hello Reader !');
	dbms_output.put_line('Hope enjoy');
	dbms_output.put_line('great time explporing pl/sql');
	
	num_lines := 3;
	
	dbms_output.put_lines(lines,num_lines);
	
	FOR i IN 1..num_lines LOOP
		dbms_output.put_line(line(i));
	END LOOP;
END;
/