DECLARE
	custumer_rec custumer%rowtype;
BEGIN
	SELECT * INTO custumer_rec
	FROM custumer
 	WHERE id = 5;
	
	dbms_output.put_line('custumer ID :' || custumer_rec.id);
	dbms_output.put_line('custumer Name : ' || custumer_rec.name);
	dbms_output.put_line('custumer addrres : ' || custumer_rec.addrres);
	dbms_output.put_line('custumer salary :' || custumer_rec.salary);
END:
/
	