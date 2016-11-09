DECLARE
	CURSOR c_custumer is
	SELECT name FROM custumer;
	-------------
	type c_list is varray (6) of custumer.name%type;
	name_list c_list := c_list();
			---pemanggilan data dalam databases
	counter integer :=0;
	-------------
BEGIN
	FOR n IN c_custumer LOOP
		counter := counter + 1;
		name_list.extend;
		name_list(counter) := n.name;
		dbms_output.put_line('Custummer('||counter||'):'||name_list(counter));
	END LOOP;
END;
/