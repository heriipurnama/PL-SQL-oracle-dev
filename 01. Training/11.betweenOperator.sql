DECLARE
	x number(2) := 10;
	--deklaraasi vaiabel
BEGIN
	IF (x between 5 and 20) then
		dbms_output.put_line('TRUE');
	ELSE
		dbms_output.put_line('FALSE');
	END IF;
	
	IF (x BETWEEN 5 AND 10) THEN
		dbms_output.put_line('TRUE');
	ELSE
		dbms_output.put_line('FALSE');
	END IF;
	
	IF (x BETWEEN 11 AND 20) then
		dbms_output.put_line('true');
	ELSE
		dbms_output.put_line('false');
	END IF;
END;
/
		