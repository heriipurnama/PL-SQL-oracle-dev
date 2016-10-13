DECLARE
	letter varchar(1) := 'm';
	---pendefisian variabel 
BEGIN
	IF (letter in ('a','b','c')) then
		dbms_output.put_line('true');
	else
		dbms_output.put_line('false');
	end if;
	
	if(letter in ('m','n','o')) then
		dbms_output.put_line('true');
	else
		dbms_output.put_line('false');
	end if;
	
	if (letter is null) then
		dbms_output.put_line('true');
	else
		dbms_output.put_line('false');
	end if;
end;
/