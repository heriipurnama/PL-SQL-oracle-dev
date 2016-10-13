DECLARE
PROCEDURE compare (value varchar2, pattern varchar2 )
is
--eksekusi file jawaban
BEGIN
	IF value LIKE pattern THEN
		dbms_output.put_line('TRUE');
	else
		dbms_output.put_line('FALSE');
	END IF;
END;
---eksekusi file dari data constant
BEGIN
	compare('Zara Ali', 'Z%A_i');
	compare('Nuha Ali', 'Z%A_i');
END;
/