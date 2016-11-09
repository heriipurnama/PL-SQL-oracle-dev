 	
create or replace 
PROCEDURE TUGAS_MAS (P_PERIOD varchar2 DEFAULT '201209',
                                       P_REVENUE_DATE varchar2 DEFAULT sysdate,
                                       P_PROVIDER_ID varchar2 DEFAULT 'All Brand',
                                       P_L1 varchar2 DEFAULT 'ALL',
                                       P_TOTAL_REVENUE number DEFAULT '7112966482',
                                       P_TOTAL_DURATION number DEFAULT '289374726',
                                       P_TOTAL_VOLUME number DEFAULT '178482361',
                                       P_TOTAL_TRANSACTION number DEFAULT '9793357',
                                       P_PERIOD_DATE varchar2 DEFAULT sysdate,
                                       p_tanggal date default sysdate,
                                       p_region VARCHAR2 default 'NATIONAL',
                                       p_product VARCHAR2 default 'SP',
                                       p_date VARCHAR2 default sysdate,
                                       p_set varchar2 default 'Daily' )
AS 
BEGIN
htp.p('<html>
  <head>        
    <title>TUGAS GRAFIK DAILY</title>         
    <script type="text/javascript" src="/'||f_template||'/js/fusion_chart/FusionCharts.js"></script>
  </head>   
<body bgcolor="violet"> 
  <form>
  <table>
       ');
  htp.p('
       <tr>     
       <td><div id="chart1" class="chartdiv"></div></td>
       <td> <div id="chart2" class="chartdiv"></div></td>
       <td> <div id="chart3" class="chartdiv"></div></td>
       </tr>
       <tr>
      <td><div id="chart4" class="chartdiv"></div></td>
      <td><div id="chart5" class="chartdiv"></div></td>
      <td><div id="chart6" class="chartdiv"></div></td>
      </tr>
   <script type="text/javascript"><!--
  //FusionCharts.setCurrentRenderer(''javascript'');
    var Line = new FusionCharts("/'||f_template||'/js/fusion_chart/Line.swf", "LineId", "400", "330", "0", "1");
    Line.setJSONData('||F_REVENUE_DAILY(p_period,p_region,p_tanggal)||');
    Line.setTransparent(true);
    Line.render("chart1");
    // -->
  </script> 

   <script type="text/javascript"><!--
  //FusionCharts.setCurrentRenderer(''javascript'');
    var Line = new FusionCharts("/'||f_template||'/js/fusion_chart/MSLine.swf","LineId", "400", "330", "0", "1");
    Line.setJSONData('||JSON_SCN_SALES_DAILY(p_period,p_region,p_product,p_date,p_set)||');
    Line.setTransparent(true);
    Line.render("chart2");
    // -->
  </script> 
  
   <script type="text/javascript"><!--
  //FusionCharts.setCurrentRenderer(''javascript'');
    var Line = new FusionCharts("/'||f_template||'/js/fusion_chart/MSLine.swf", "LineId", "400", "330", "0", "1");
    Line.setJSONData('||JSON_SCN_CHURN_DAILY(p_period,p_region,p_product,p_date,p_set)||');
    Line.setTransparent(true);
    Line.render("chart3");
    // -->
  </script> 
  
  
   <script type="text/javascript"><!--
  //FusionCharts.setCurrentRenderer(''javascript'');
    var Line = new FusionCharts("/'||f_template||'/js/fusion_chart/MSLine.swf", "LineId", "400", "330", "0", "1");
    Line.setJSONData('||F_SUBSCRIBER(p_period,p_region,p_product,p_date,p_set)||');
    Line.setTransparent(true);
    Line.render("chart4");
    // -->
  </script> 
  
   <script type="text/javascript"><!--
  //FusionCharts.setCurrentRenderer(''javascript'');
    var Line = new FusionCharts("/'||f_template||'/js/fusion_chart/MSLine.swf", "LineId", "400", "330", "0", "1");
    Line.setJSONData('||f_rar(p_period,p_region,p_product,p_date,p_set)||');
    Line.setTransparent(true);
    Line.render("chart5");
    // -->
  </script> 
  
    <script type="text/javascript"><!--
  //FusionCharts.setCurrentRenderer(''javascript'');
    var Line = new FusionCharts("/'||f_template||'/js/fusion_chart/MSLine.swf", "LineId", "400", "330", "0", "1");
    Line.setJSONData('||f_sub_rar(p_period,p_region,p_product,p_date,p_set)||');
    Line.setTransparent(true);
    Line.render("chart6");
    // -->
  </script> 
  
    </tr>
    </table>
    </form>
          </body> 
    </html>
  ');
END TUGAS_MAS;