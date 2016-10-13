DECLARE
	a number(3) := 100;
BEGIN
	if(a < 20 ) then
		dbms_output.put_line('a is less than 20');
	else
		dbms_output.put_line('a is not less than 20');
	end if;
		dbms_output.put_line('vslue of a is : ' || a);
END;
/