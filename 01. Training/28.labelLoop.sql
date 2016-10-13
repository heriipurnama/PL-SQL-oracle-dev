DECLARE
	a number(2) := 10;
BEGIN
	--while loop execution
	WHILE a < 20 LOOP
		dbms_output.put_line('Value of a : ' || a);
		a := a + 1;
		IF a > 15 THEN
			-- hentikan loop dg statement exit
			EXIT;
		END IF;
	END LOOP;
END;
/