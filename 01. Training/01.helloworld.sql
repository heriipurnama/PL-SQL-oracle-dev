DECLARE
 --deklarasi variabel
	message varchar2(20):= 'Hello World';
BEGIN
--perintah exsekusi program
	dbms_output.put_line(message);
END;
/



-- KETERANGAN MENEMPILKAN HASILNYA KEDALAM COMAND 
-- PROMPRT DENGAN MENGGUNAKAN PERINTAH [ SET SERVEROUTPUT ON ] 
-- PADA SCRIPT SEBELUM MENGEKSEKUSI FILE .SQL