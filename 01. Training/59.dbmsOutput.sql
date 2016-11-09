DECLARE
	lines dbms_output.chararr;
	num_lines number;
	
BEGIN
	--enable the buffer default size
	dbms_output.enable;
	
	dbms_output.put_line('d');
	dbms_output.put_line('d');
	dbms_output.put_line('d');
	
	num_lines:=3;
	
	dbms_output.get_lines(lines, num_lines);
	
	FOR i IN..num_lines LOOP
		dbms_output.put_line(lines(i));
	END LOOP;
	END;
	/
	