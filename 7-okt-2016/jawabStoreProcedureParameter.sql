CREATE OR REPLACE PROCEDURE SUM_DLY 
	( period OUT number, area OUT number, PAYLOAD_AMOUNT OUT NUMBER )
IS
	
BEGIN

insert into fd_payload_sum_area_dly  
--memasukkan values ke tabel yang dituju == fd_payload_sum_area_dly
  select PERIOD, AREA, PAYLOAD_AMOUNT
--start proses masukkan data dari query filter
from
( select period, area, sum(PAYLOAD)as PAYLOAD_AMOUNT from (
--start area 1       
	select period, 'AREA 1' AREA, 'SUMBAGUT' REGION, SUMBAGUT as PAYLOAD
		from FD_PAYLOAD_DLY where period between 20160801 and 20160831
		union
			select period, 'AREA 1' AREA, 'SUMBAGTENG' REGION, SUMBAGTENG as PAYLOAD
				from FD_PAYLOAD_DLY where period between 20160801 and 20160831
				union
					select period, 'AREA 1' AREA, 'SUMBAGSEL' REGION, SUMBAGSEL as PAYLOAD
						from FD_PAYLOAD_DLY where period between 20160801 and 20160831
						union
--end area 1
--start area 2
	select period, 'AREA 2' AREA, 'JABOTABEK' REGION, JABOTABEK as PAYLOAD
		from FD_PAYLOAD_DLY where period between 20160801 and 20160831
		union
			select period, 'AREA 2' AREA, 'WESTJAVA' REGION, WEST_JAVA as PAYLOAD
				from FD_PAYLOAD_DLY where period between 20160801 and 20160831
				union
--end area 2
--start area 3
	select period, 'AREA 3' AREA, 'CENTRALJAVA' REGION, CENTRAL_JAVA as PAYLOAD
		from FD_PAYLOAD_DLY where period between 20160801 and 20160831
		union
			select period, 'AREA 3' AREA, 'EASTJAVA' REGION, EAST_JAVA as PAYLOAD
				from FD_PAYLOAD_DLY where period between 20160801 and 20160831
				union
					select period, 'AREA 3' AREA, 'BALINUSRA' REGION, BALINUSRA as PAYLOAD
						from FD_PAYLOAD_DLY where period between 20160801 and 20160831
						union
--end area 3
--start area 4
	select period, 'AREA 4' AREA, 'KALIMANTAN' REGION, KALIMANTAN as PAYLOAD
		from FD_PAYLOAD_DLY where period between 20160801 and 20160831
		union
			select period, 'AREA 4' AREA, 'SULAWESI' REGION, SULAWESI as PAYLOAD
				from FD_PAYLOAD_DLY where period between 20160801 and 20160831
				union
					select period, 'AREA 4' AREA, 'PUMA' REGION, PUMA as PAYLOAD
						from FD_PAYLOAD_DLY where period between 20160801 and 20160831
						union
--end area4
--start national
	select period, 'NATIONAL' AREA, 'NATIONWIDE' REGION, NATIONWIDE as PAYLOAD
		from FD_PAYLOAD_DLY where period between 20160801 and 20160831
--end national
		)
	group by period,area order by AREA
	commit;	
);
--end proses masukkan data dari query filter
--commit;				
END SUM_DLY;