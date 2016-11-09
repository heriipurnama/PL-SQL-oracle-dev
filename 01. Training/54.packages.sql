CREATE PACKAGE cust_sal AS
	PROCEDURE find_salc (c_id customers.id%type);
END cust_sal;
/