DECLARE
	x number := 10;
BEGIN
		LOOP
		--awal perulangan
			dbms_output.put_line(x);
			x := x + 10;
			IF x > 50 THEN --awal perbedaan dg versi 21
				exit;
			END IF; --akhir 
		--akhir perulangan
		END LOOP;
	dbms_output.put_line('AFTER exit x is ' || x);
END;
/

kurang tanda ; sangat 
berpengaruh dalam menjalankan program yang ada.