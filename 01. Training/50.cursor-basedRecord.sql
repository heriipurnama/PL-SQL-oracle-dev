DECLARE
	CURSOR custumer_cur is
		SELECT id, name, address
		FROM custumer;
	custumer_rec custumer_cur%rowtype;
BEGIN
	OPEN custumer_cur;
	LOOP
		FETCH custumer_cur into custumer_rec;
		EXIT WHEN custumer_cur%notfound;
		dbms_output.put_line(custumer_rec.id|| '' || custumer_rec.name);
	END LOOP;
END;
/