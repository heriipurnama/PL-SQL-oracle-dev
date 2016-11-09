DECLARE
c_id custumer.id%type := 1;
c_name custumer.name%type;
c_addr custumer.address%type;
c_sal custumer.salary%type;
BEGIN
SELECT name, address, salary INTO c_name, c_addr, c_sal
FROM custumer
WHERE id = c_id;
dbms_output.put_line
('Customer ' ||c_name || ' from ' || c_addr || ' earns ' || c_sal);
END;
/