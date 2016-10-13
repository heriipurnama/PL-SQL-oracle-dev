DECLARE
	a number;
	b number;
	c number;
	
PROCEDURE findMin( x IN number, y IN number, z OUT number ) IS
BEGIN
	IF x < y THEN
		z := x;
	ELSE
		z := y;
	END IF;
END;


BEGIN
	a := 23;
	b := 45;
	dbms_output.put_line(' MINIMUMINUS of (23, 45) : ' || c);
END;
/