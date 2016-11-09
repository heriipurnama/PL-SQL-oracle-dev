CREATE OR REPLACE TYPE address AS OBJECT( //objek 1
	house_no varchar2(10),
	street varchar2(30),
	cuty varchar2(20),
	state varchar2(10),
	pincode varchar2()
);
/

CREATE OR REPLACE TYPE customer AS OBJECT(

	code number(5),
	nama varchar2(10),
	contack_no varchar2(12),
	add address,
	mrmber procedure dispalay
);
/

//intalling objeck
DECLARE
	residende address;
BEGIN
	residende := address('2','herippurnama','jogja','jogja','2016');
	dbms_otput.put_line('House NO :' || residende.house_no);
	dbms_otput.put_line('Street : '|| residende.street);	
	dbms_otput.put_line('City :' || residende.city);
	dbms_otput.put_line('State :' || residende.state);
	dbms_otput.put_line('pincode :' || residende.pincode);
	END;
	/