DECLARE
	name varchar2(20);
	company varchar2(30);
	introduction clob; --clob type text
	choice char(1);
	datas clob;
BEGIN
	name := 'heriipurnama';
	company := 'Infotech';
	introduction := 'hai heriipurnama';
	choice := 'y';
	datas :='data tak ada';
	IF choice = 'y' THEN
		dbms_output.put_line(name);
		dbms_output.put_line(company);
		dbms_output.put_line(introduction);
	ELSE
		dbms_output.put_line(datas);
	END IF;
END;
/