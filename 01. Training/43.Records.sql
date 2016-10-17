DEClARE
  customer_rec customers%rowtype;
BEGIN
  SELECT * INTO customers_rec
  FROM customers
  WHERE id = 5;
    dbms_output.put_line('Customer ID :' || customers_rec.id);
    dbms_output.put_line('Customer Name :' || customers_rec.name);
    dbms_output.put_line('Customer Addres' || customers_rec.addres );
    dbms_output.put_line('Customer salary' || customers_rec.salary);
  END;
  /
