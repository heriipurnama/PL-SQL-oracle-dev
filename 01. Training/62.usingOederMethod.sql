------ deklarasi---------------------
CREATE OR REPLACE TYPE rectagle AS OBJECT
(length number,
width number,
member procedure display,
order member function measure(r rectagle) return member
);
/
	
	-----------------body --------
CREATE OR REPLACE TYPE BODY rectagle AS
	MEMBER PROCEDURE display IS
	BEGIN
		dbms_output.put_line('length :' || length);
		dbms_output.put_line('with :' || with);
	END display;
	ORDER MEMBER FUNCTION measure(r rectagle) return number IS
	BEGIN
		IF(sqrt(self.length*self.length + self.width*self.with)>
	sqrt(r.length*r.length + r.width*r.width)) then
			return(1);
		ELSE
			return(-1);
		END IF;
	END measure;
END;
/

------------------compile-----------------
DECLARE
	r1 rectagle;
	r2 rectagle;
BEGIN
	r1 := rectagle(23, 24);
	r2 :+ rectagle(15, 17);
	r1.display;
	r2.display;
	IF (r1 > r2) THEN 
	--pemangilan fungsi meassure
		r1.display;
	ELSE
		r2.display;
	END IF;
END;
/
	