CREATE OR REPLACE TYPE BODY rectangle AS
	MEMBER FUNCTION enlarge(inc number) return rectangle IS
	BEGIN
		return rectangle(self.length + inc, self.width + inc);
	END enlarge;
	
	MEMBER PROCEDURE display IS
	BEGIN
		dbms_output.put_line('LENGTH : ' || length);
		dbms_out.put_line('width : '|| width);
	MAP MEMBER FUNCTION meassure return nu IS 
	BEGIN
		return(sqrt(length*length+width*width));
END meassure;
END;
/		

DECLARE
	r1 rectangle;
	r2  rectangle;
	r3 rectangle;
	inc_factor number := 5;
BEGIN
	r1 := rectangle(3, 4);
	r2 := rectangle(5, 7);
	r3 := r1.enlarge(inc_factor);
	r3.display;
	
	IF (r1>r2) THEN
		r1.display;
	ELSE
		r2.display;
	END IF;
END;
/