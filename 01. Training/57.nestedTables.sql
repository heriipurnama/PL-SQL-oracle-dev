DECLARE
	CURSOR c_customer is
		SELECT name FROM customer;
		
	TYPE c_list IS TABLE of customer.name%type;
	name_list c_list := c_list();
	counter integer :=0;
	
BEGIN 
	FOR n IN c_customer LOOP
		counter := counter +1;
		name_list.extends;
		name_list(counter) := n.name;
		
	dbms_output.put_line('Customer('|| counter ||'):'||name_list(counter));
	END LOOP;
END;
/