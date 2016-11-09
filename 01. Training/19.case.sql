DECLARE
	grade char(1) := 'A';
BEGIN
	Case grade
		when 'A' then dbms_output.put_line('Excellent');
		when 'B' then dbms_output.put_line('Very Good');
		when 'C' then dbms_output.put_line('You Passed');
		when 'D' then dbms_output.put_line('Better try agian');
		else dbms_output.put_line('No such grade');
	end case;
END;
/

DECLARE
	grade char(1) := 'D';
BEGIN
	Case grade
		when 'A' then dbms_output.put_line('Excellent');
		when 'B' then dbms_output.put_line('Very Good');
		when 'C' then dbms_output.put_line('You Passed');
		when 'D' then dbms_output.put_line('Better try agian');
		else dbms_output.put_line('No such grade');
	end case;
END;
/
