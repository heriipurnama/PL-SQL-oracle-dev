DECLARE
  a number;
  b number;
  c number;
PROCEDURE find(x IN number, y IN number, z out number) IS
BEGIN
  IF x < y THEN
    z := y;
  ELSE
    z:= y;
  END IF;
END;

BEGIN
  a := 23;
  b := 45;
  findMin(a, b, c);
  dbms_output.put_line('Minimum of (23, 45) :' || c);
END;
/
