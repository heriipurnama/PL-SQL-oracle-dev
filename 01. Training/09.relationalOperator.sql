DECLARE
	a number (2) := 13;
		--menentukan jumlah besar desimal yg ingin diinputkan
	b number (2) := 10;
BEGIN
	IF (a = b ) then
		dbms_output.put_line('Line 1 - a is equal to b');
		--ini yang benar
	ELSE
		dbms_output.put_line('Line 1 - a is not equal to b');
	END IF;
	
	IF (a < b ) then
		dbms_output.put_line('Line 2 - a is less than b');
		--ini yang benar
	ELSE
		dbms_output.put_line('Line 2 - a is not less than b');
	END IF;
	
	IF (a > b ) then
		dbms_output.put_line('Line 3 - a is greather than b');
	ELSE
		dbms_output.put_line('Line 3 - a not greather than b');
	END IF;
	
	-- lets change value of a and b
	
	a := 5;
	b := 20;
	
	IF ( a <= b ) THEN
		dbms_output.put_line('Line 4 - a is either equal or less than b');
	END IF;
	
	IF ( a <> b ) THEN --persamaan data a apa sama dengan b
		dbms_output.put_line('Line 6 - a is equal to b');
	ELSE
		dbms_output.put_line('Line 6 - a equal to b');
	END IF;
END;
/