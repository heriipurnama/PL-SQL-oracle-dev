CREATE OR REPLACE TRIGGER display_salary_change
	BEFORE DELETE OF INSERT OR UDPDATE ON custumers
	FROM EACH ROW
	WHEN (NEW.ID > 0)
DECLARE
	sal_diff number;
BEGIN
	sal_diff := :NEW.salary - :OLD.salary;
	dbms_output.put_line('Old salary : '|| :OLD.salary);
	dbms_output.put_line('Old salary : '|| :NEW.salary);
	dbms_output.put_line('Old difference : '|| sal_diff);
END;
/
	