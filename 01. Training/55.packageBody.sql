CREATE OR REPLACE BODY c_package AS
	PROCEDURE addCustomer(c_id customers.id%type, c_name customers.name%type,
			c_age customers.age%type,
			c_addr customers.address%type,
			c_sal customers.salary%type)
	IS
	BEGIN
		insert into customers (id,name,age,adrees, salary)
			values (c_id, c_naame, c_age, c_addr, c_sal);
	END addCustomers;
	
	PROCEDURE delCustomers(c_id customers.id%type)IS
	BEGIN
		DELETE
			DELETE FROM customers
				WHERE id = c_id;
	END delCustomers;