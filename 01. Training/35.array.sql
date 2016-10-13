DECLARE
	type namesarray IS VARRAY(115) OF VARCHAR2(110);
	type grades IS VARRAY(5) OF INTEGER;
	names namesarray;
	marks grades;
	total integer;
BEGIN
	names := namesarray('heriipurnama', 'marks', 'hita', 'ditaa', 'dia');
	marks := grades(98,97,78,87,92);
	total := names.count;
	dbms_output.put_line('Total ' || total || 'Student');
	FOR i in 1 .. total LOOP
		dbms_output.put_line('Student: ' || names(i) || ' marks' || marks(i));
	END LOOP;
END;
/