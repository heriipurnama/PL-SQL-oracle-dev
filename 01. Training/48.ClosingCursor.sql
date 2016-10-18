DECLARE
	c_id custumers.ud&type;
	c_name custumers.name%type;
	c_addr custumers.address%type;
	CURSOR c_customers is
		select id, name, address from custumers;
BEGIN
	OPEN c_customers;
	LOOP
		FETCH c_customers into c_id, c_name, c_addr;
		dbms_output.put_line(C_id || ' ' || c_name || ' '|| c_addr);
		exit when c_customers%notfound;
	end LOOP;
	CLOSE c_customers;
END;
/