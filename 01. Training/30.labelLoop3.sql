DECLARE
	a number(2) := 10;
BEGIN
	--while loop execution
	WHILE
		dbms_output.put_line ('value of a : ' || a);
		a := a + 1;
		IF a = 15 THEN
			--skip loop
			a := a + 1;
			CONTINUE;
		END IF;
	END LOOP;
END;
/