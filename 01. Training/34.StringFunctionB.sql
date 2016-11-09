DECLARE
	greetings varchar2(30) := '...Hello World....';
BEGIN
	dbms_output.put_line(RTRIM(greetings, '.'));
	dbms_output.put_line(LTRIM(greetings, '.'));
	dbms_output.put_line(TRIM('.' from greetings));
END;
/