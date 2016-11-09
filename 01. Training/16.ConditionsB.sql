DECLARE
	c_id custumer.id%type := 1;
	c_sal custumer.salary%type;
BEGIN
	select salary
	into c_sal
	from custumer
	where id = c_id;
	if (c_sal <= 2000) then
		update custumer
		set salary = salary + 1000
			where id = c_id;
		dbms_output.put_line('Salary update');
	End if;
end;
/
	