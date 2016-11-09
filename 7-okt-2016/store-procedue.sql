create or replace 
PROCEDURE     adm_unlock_xls (
  p_nik 		  VARCHAR2 DEFAULT NULL,
   p_id		    VARCHAR2 default null
) IS

  CURSOR c_data IS
    SELECT * FROM ADM_USER
    WHERE STATUS ='N';
    --AND inact_status = 'N'
    --AND NOT (ROLE_id = '5434')
    --AND regional LIKE (SELECT CASE WHEN b.level_roleid = '1' THEN '%' ELSE a.regional END
    --                         FROM adm_user a, adm_role b
    --                        WHERE a.NAME=p_nik
    --                          AND a.role_id = b.id);
    --superuser role is exclude
  d_data c_data%ROWTYPE;

  CURSOR c_user(x_id VARCHAR2) IS
    SELECT * FROM adm_user
    WHERE id = x_id;
  d_user c_user%ROWTYPE;

  CURSOR c_param IS
    SELECT value FROM adm_rule WHERE type = 'PSWD_LENGTH';
  d_param c_param%ROWTYPE;


cekres 	VARCHAR2(100);
a 		  NUMBER :=1;
i	   	  INTEGER;
str 	  VARCHAR2(1000);
tmp 	  NUMBER:=1;
val 	  NUMBER;
tot 	  NUMBER:=0;
cek 	  VARCHAR2(200);
ok 		  VARCHAR2(20);
rand 		BINARY_INTEGER;

v_pass_akhir  VARCHAR2(200);

BEGIN
htp.init;
owa_util.mime_header ('application/vnd.ms-excel',false);
htp.print('Content-Disposition:attachment;filename="adm_unlock_'||to_char(sysdate,'rrrrmmdd')||'.xls"');
owa_util.http_header_close;

htp.prn('
<table>
   <tr colspan="13">
     <b>
     Unlock User & Reset Password

    </b>
   </tr>
  </table>
   ');

  htp.prn('
  <table width="778" border="1" cellspacing="1" cellpadding="0">
          <tr align="center">
            <td width=20% class="hcol"><b>Name</b></td>
            <td width=20% class="hcol"><b>Full Name</b></td>
            <td width=30% class="hcol"><b>Address</b></td>
            <td width=20% class="hcol"><b>E-mail</b></td>
          </tr>
  </table>
  <table width="778" border="1" cellspacing="1" cellpadding="0">
            ');
      FOR i IN c_data LOOP

          IF MOD(a,2) = 0 THEN
    	    htp.p('<tr class="list02">');
          ELSE
            htp.p('<tr class="list01">');
          END IF;
        htp.p('
            <td width=20%>'||i.name||'</td>
            <td width=20%>'||i.full_name||'</td>
            <td width=30%>'||i.address||'</td>
            <td width=20%>'||i.email||'</td>
             </tr>');
          a := a + 1;
      END LOOP ;

       htp.prn('
        </table>
');

END ;
