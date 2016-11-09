DEClARE
  c_id customer.id%type := 8;
  c_name customer.name%type;
  c_addr customers.address%type;
BEGIN
  SELECT name, address INTO c_name, c_addr
  FROM customer
  WHERE id = c_id;

  dbms_output.put_line ('name : ' || c_name);
  dbms_output.put_line ('Address : '|| c_addr);
Exception
  WHEN no_data_found then
    dbms_output.put_line('no such customer !!');
  when others then
    dbms_output.put_line('eroor');
END;
/
