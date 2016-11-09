DECLARE
	x number := 10;
BEGIN
	LOOP
		dbms_output.put_line(x);
		x := x + 10;
		exit WHEN x > 50; --beda dg yg satunya
	END LOOP;
		dbms_output.put_line('After Exit x is : ' || x);
END;
/

---perintah2 utama harus huruf besar.
