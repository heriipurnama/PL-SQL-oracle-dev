DECLARE
	c_id custumers.id%type := 8;
	c_rame custumers.name%type;
	c_addr custumers.address%type;
BEGIN
	select name, addres into c_rame, c_addr from custumers
	where id = c_id;
	
	
	dbms_output.put_line ('name :' || c_name);
	dbms_output.put_line ('addres: ' || c_addr);
EXCEPTION
	WHEN no_data_found then
		dbms_output.put_line('No such custumers!!');
	when others then
		dbms_output.put_line('error');
END;
/