DECLARE
	SUBTYPE name IS char(20);
	SUBTYPE message IS varchar2(100);
	salutation name;
	greetings message;
BEGIN
	salutation := 'Reader';
	greetings := 'Wel';
	dbms_output.put_line('hello' || salutation || greetings);
END;
/
	
	
	
