DECLARE
	SUBTYPE name IS CHAR(20);
	SUBTYPE message IS varchar2(100);
	salutation name;
	greetings message;
BEGIN
	salutation := ' Reader ';
	greetings := 'welcome to the world of PL/SQL ';
	dbms_output.put_line(' Hello ' || salutation || greetings);
END;
/