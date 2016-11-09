DECLARE
	a number(2) := 20;
	b number(2) := 10;
	c number(2) := 15;
	d number(2) := 5;
	--variabel masukkan untuk sebiuah nilai yang konstan
	e number(10) ; --inisialisasai besar bilangan untuk keluaran
BEGIN
	e := (a+b) * c / d; --30 * 15 /5 
		dbms_output.put_line('Value of (a+b) * c / d is : ' || e);
	e := ((a+b) *c)/ d; --30*15 /5
		dbms_output.put_line('value of ((a+b)*c)/d is : ' || e);
	e := (a+b) * (c*d);
		dbms_output.put_line('value of (a+b) * (c+d) is : '|| e);
	e := (a+b) * (c/d);
		dbms_output.put_line('value of (a+b) * (c/d) is : '|| e);
	e := a + (b * c) /d ; -- 20 + (150/5)
		dbms_output.put_line('Value of a + (b * c)/d is : ' || e);
END;
/