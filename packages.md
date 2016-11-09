package scope (
    schema[
            package_spec[
                package_body[
                      procedure,
                      function,
                      procedure
                ]
           ]
   ]
   schema[
           package_spec[
               package_body[
                     procedure,
                     function,
                     procedure
               ]
          ]
  ]     
)



create or replace PACKAGE MINIX_SATU AS

  /* TODO enter package declarations (types, exceptions, methods etc) here */
PROCEDURE addCustomer(c_id customers.id%type,
          c_name customers.name%type,
          c_age customers.age%type,
          c_addr customers.adress%type,
          c_sal customers.salary%type);
PROCEDURE delCustomer(
          c_id customers.id%type
);
PROCEDURE listCustomer;
END MINIX_SATU;

create or replace PACKAGE BODY MINIX_SATU AS

 PROCEDURE addCustomer(c_id  customers.id%type,
      c_name customers.name%type,
      c_age  customers.age%type,
      c_addr  customers.adress%type,
      c_sal   customers.salary%type)
   IS
   BEGIN
      INSERT INTO customers (id,name,age,adress,salary)
         VALUES(c_id, c_name, c_age, c_addr, c_sal);
   END addCustomer;

   PROCEDURE delCustomer(c_id   customers.id%type) IS
   BEGIN
       DELETE FROM customers
         WHERE id = c_id;
   END delCustomer;

   PROCEDURE listCustomer IS
   CURSOR c_customers is
      SELECT  name FROM customers;
   TYPE c_list is TABLE OF customers.name%type;
   name_list c_list := c_list();
   counter integer :=0;
   BEGIN
      FOR n IN c_customers LOOP
      counter := counter +1;
      name_list.extend;
      name_list(counter)  := n.name;
      dbms_output.put_line('Customer(' ||counter|| ')'||name_list(counter));
      END LOOP;
   END listCustomer;
END MINIX_SATU;

-------------------------------------------------------------
  -->execusi packages on workSheet pl/sql developer
  exp,
  select id,name from customers;
  select*from customers;
  desc customers
  SELECT * FROM CUSTOMERS;

---exsecusi packages
  DECLARE
    code CUSTOMERS.ID%type:=9;
  BEGIN
   -- MINIX_SATU.DELCUSTOMER(code);
      MINIX_SATU.LISTCUSTOMER;
  END;

  --full-excecusi packages
  DECLARE
  code CUSTOMERS.ID:=8;
BEGIN
  MINIX_SATU.ADDCUSTOMER(7,'Rajnis',25,'Chenai',3000);
  MINIX_SATU.ADDCUSTOMER(8,'Subnam',22,'dada'300);
  MINIX_SATU.LISTCUSTOMER;
  MINIX_SATU.DELCUSTOMER(code);
  MINIX_SATU.LISTCUSTOMER;
END;
