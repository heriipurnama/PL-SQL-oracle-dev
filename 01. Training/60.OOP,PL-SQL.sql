CREATE OR REPLACE TYPE address AS OBJECT
(	house_no varchar2(10),
	street varchar2(20),
	city varchar2(20),
	states varchar2(10),
	pincode varchar2(10)
);
/

CREATE OR REPLACE TYPE customer AS OBJECT
(	code number(5),
	name varchar2(20),
	contact_no varchar2(20),
	addr address,
	member procedure display
);
/

--untuk acces operator menggunakan (.)

DECLARE
	residence address;
BEGIN
	residence := address('103A', 'prambanan', 'prambanan', 'jogja', '20161018');
		dbms_output.put_line('House No : ' || residence.house_no);
		dbms_output.put_line('Street : ' || residence.street);
		dbms_output.put_line('City : ' || residence.city);
		dbms_output.put_line('States : ' || residence.states);
		dbms_output.put_line('Pincode : ' || residence.pincode);
END;
/