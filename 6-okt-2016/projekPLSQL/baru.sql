select * from bpr_city;
select * from bpr_bts;


create or replace 
PROCEDURE PROC_FD_PAYLOAD_SUM (p_curr_date VARCHAR2) AS 
   
	CURSOR c_get_date IS
--	select 
--	p_curr_date currdate,
--	to_char(last_day(to_date(p_curr_date,'yyyymmdd')),'yyyymmdd') lastdate,
--	to_char(add_months(to_date(p_curr_date,'yyyymmdd'),-1),'yyyymmdd') lastmonthdate,
--	to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-1)),'yyyymmdd') lastmonthlastdate,
--	to_char(add_months(to_date(p_curr_date,'yyyymmdd'),-12),'yyyymmdd') lastyeardate,
--	to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-12)),'yyyymmdd') lastyearlastdate
--	from dual;
  select
	p_curr_date currdate,
  to_char(to_date(p_curr_date,'yyyymmdd')+1,'yyyymmdd') nextdate,
  to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-1))+1,'yyyymmdd') firstdate,
	to_char(last_day(to_date(p_curr_date,'yyyymmdd')),'yyyymmdd') lastdate,
  to_char(add_months(to_date(p_curr_date,'yyyymmdd'),-1),'yyyymmdd') lastmonthcurrdate,
  to_char(add_months(to_date(p_curr_date,'yyyymmdd'),-1)+1,'yyyymmdd') lastmonthnextdate,
	to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-2))+1,'yyyymmdd') lastmonthdate,
	to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-1)),'yyyymmdd') lastmonthlastdate,
	to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-13))+1,'yyyymmdd') lastyeardate,
	to_char(last_day(add_months(to_date(p_curr_date,'yyyymmdd'),-12)),'yyyymmdd') lastyearlastdate
	from dual;
  c_gd c_get_date%rowtype;
  
--  CURSOR c_get_curr_period (p_date NUMBER) IS
--  select max(period) period from FD_OL_REV_OUTLOOK
--  where substr(period,1,6)=substr(p_date,1,6);
--	c_gcp c_get_curr_period%rowtype;
  
  cursor cget_max_period (pyearmonth VARCHAR2) is
    select max(period) period from FD_PAYLOAD_DLY
    where substr(period,1,6)=pyearmonth;
  c_gmp cget_max_period%rowtype;
  
  
	v_curr varchar2(8 byte);
  v_mtd varchar2(8 byte);
	v_lmtd varchar2(8 byte);
	v_ytd varchar2(8 byte);
	v_lytd varchar2(8 byte);

BEGIN

 c_gd := NULL;
 open  c_get_date;
 fetch  c_get_date into c_gd;
 close  c_get_date;
 v_curr:=c_gd.currdate;
 open  cget_max_period(substr(c_gd.currdate,1,6));
 fetch  cget_max_period into c_gmp;
 close  cget_max_period; 
 
 if to_number(c_gmp.period) >= to_number(c_gd.currdate) then
   
    if c_gd.currdate=c_gd.lastdate then
      v_mtd := c_gd.lastdate;
      v_lmtd := c_gd.lastmonthlastdate;
--      v_ytd := c_gd.lastdate;
--      v_lytd := c_gd.lastyearlastdate;
    else
      v_mtd := c_gd.currdate;
      v_lmtd := c_gd.lastmonthcurrdate;
--      v_ytd := c_gd.currdate;
--      v_lytd := c_gd.lastyeardate;
    end if;

 else

    v_mtd := c_gmp.period;
    v_lmtd := to_char(add_months(to_date(c_gmp.period,'yyyymmdd'),-1),'yyyymmdd');
 end if;
  
--  v_period := '';
--  OPEN c_get_curr_period(to_number(p_curr_date));
--  FETCH c_get_curr_period INTO c_gcp;
--  CLOSE c_get_curr_period;
--  v_period := substr(c_glmd.period,1,6);
--  if nvl(v_period,0) != substr(v_lmfd,1,6) then
 
  execute immediate 'truncate table FD_PAYLOAD_SUM_STG';
  
  insert into FD_PAYLOAD_SUM_STG
	select v_curr payload_date, area, region,  
	sum(payload) mtd_payload, 0 lmtd_payload
	from 
  (select period, 'AREA 1' AREA, 'SUMBAGUT' REGION, SUMBAGUT PAYLOAD from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 1' AREA, 'SUMBAGTENG' REGION, SUMBAGTENG from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 1' AREA, 'SUMBAGSEL' REGION, SUMBAGSEL from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 2' AREA, 'JABOTABEK' REGION, JABOTABEK from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 2' AREA, 'WEST_JAVA' REGION, WEST_JAVA from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 3' AREA, 'CENTRAL_JAVA' REGION, CENTRAL_JAVA from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 3' AREA, 'EAST_JAVA' REGION, EAST_JAVA from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 3' AREA, 'BALINUSRA' REGION, BALINUSRA from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 4' AREA, 'KALIMANTAN' REGION, KALIMANTAN from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 4' AREA, 'SULAWESI' REGION, SULAWESI from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'AREA 4' AREA, 'PUMA' REGION, PUMA from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd
    union
    select period, 'NATIONWIDE' AREA, 'NATIONWIDE' REGION, NATIONWIDE from FD_PAYLOAD_DLY
    where period between substr(v_mtd,1,6)||'01' and v_mtd)
	group by area, region;
	commit;
	--LMTD
	insert into FD_PAYLOAD_SUM_STG
	select v_curr payload_date, area, region,   
	0 mtd_payload, sum(payload) lmtd_payload
	from 
  (select period, 'AREA 1' AREA, 'SUMBAGUT' REGION, SUMBAGUT PAYLOAD from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 1' AREA, 'SUMBAGTENG' REGION, SUMBAGTENG from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 1' AREA, 'SUMBAGSEL' REGION, SUMBAGSEL from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 2' AREA, 'JABOTABEK' REGION, JABOTABEK from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 2' AREA, 'WEST_JAVA' REGION, WEST_JAVA from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 3' AREA, 'CENTRAL_JAVA' REGION, CENTRAL_JAVA from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 3' AREA, 'EAST_JAVA' REGION, EAST_JAVA from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 3' AREA, 'BALINUSRA' REGION, BALINUSRA from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 4' AREA, 'KALIMANTAN' REGION, KALIMANTAN from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 4' AREA, 'SULAWESI' REGION, SULAWESI from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'AREA 4' AREA, 'PUMA' REGION, PUMA from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd
    union
    select period, 'NATIONWIDE' AREA, 'NATIONWIDE' REGION, NATIONWIDE from FD_PAYLOAD_DLY
    where period between substr(v_lmtd,1,6)||'01' and v_lmtd)
	group by area, region;
	commit;
  
  delete from FD_PAYLOAD_SUM where payload_date=v_curr;
  commit;
  
  insert into FD_PAYLOAD_SUM
	select payload_date, area, region,   
	sum(mtd_payload) mtd_payload, sum(lmtd_payload) lmtd_payload
  FROM FD_PAYLOAD_SUM_STG
  group by payload_date, area, region;
  commit;

END;


rubah dar data dly ke sum dengan skrip seperti diatas penyerdehanaan data.
proc_fd_payload_sum == query
fd_payload_sum == hasil query
fd_payload_dly == data mentah


buat query seperti proc_fd_payload_sum
