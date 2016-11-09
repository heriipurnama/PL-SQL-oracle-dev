DEClARE
  CURSOR customer_cur is
   SELECT id, name, address
   FROM customers;
  customers_rec customer_cur%rowtype;
BEGIN
  OPEN customer_cur;
  LOOP
    FETCH customer_cur into customers_rec;
    EXIT WHEN customer_cur%notfound;
    dbms_output.put_line(customer_rec.id || '' || customer_rec.name);
  END LOOP;
  END;
  /
