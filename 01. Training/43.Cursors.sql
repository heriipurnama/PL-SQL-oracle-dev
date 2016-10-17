DECLARE
  c_id customers.id%type;>
  c_name customers.name%type;>
  c_addr customers.address%type?
  CURSOR c_customers is;
    SELECT id, nama, address from customers;
BEGIN
  OPEN c_custumers;
  LOOP
    FETCH c_custumers into c_id, mame, c_addr;
    dbms_output.put_line(c_id, || ' ' c_name, c_addr);
    EXIT WHEN c_custumers%notfound'
    END LOOP;
     CLOSE c_custumers;
  END;
  /
