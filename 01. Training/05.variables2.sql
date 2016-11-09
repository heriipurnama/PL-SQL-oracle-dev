DECLARE
	num1 number := 95;
	num2 number := 85;
BEGIN
	dbms_output.put_line('Outer Variable num1: ' || num1 );
	dbms_output.put_line('Outer Variable num2:' || num2);
	DECLARE
		--local variable
		num1 number := 195;
		num2 number := 185;
	BEGIN
		dbms_output.put_line('Innner variable num1: ' || num1);
		dbms_output.put_line('Inner Variable num2: '|| num2);
	End;
End;
/