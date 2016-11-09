DECLARE
  v_rcg_min NUMBER;
  v_rcg_max NUMBER;
  v_iterasi NUMBER;
BEGIN
  v_rcg_min:= &1;
  v_rcg_max:=&2;
  v_iterasi:=v_rcg_min;
WHILE v_iterasi <= v_rcg_max LOOP
  delete from MYTAB where rcg_id=v_iterasi;
  commit;
  v_iterasi:=v_iterasi+1;
END LOOP;
  dbms_output.put_line('Deleting Sukses');
  dbms_output.put_line('Min RCG_ID' || v_rcg_min);
  dbms_output.put_line('Max RCG_ID '|| v_rcg_max);
EXCEPTION
  WHEN OTHERS THEN dbms_output.put_line('eroor here');
END;
/
