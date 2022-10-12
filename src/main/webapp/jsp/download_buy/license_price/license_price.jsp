<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javascript">

	function download(bf_file) {
		$('#downloadFileHTML').html("<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_download_storage-read.do?bf_file=" + bf_file + "&bf_source=" + bf_file + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}
	
	</script>    
	
	<style type="text/css">
    p{letter-spacing:-0.05em;}
    </style>

</head>
	
<body>
	
  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" style="min-height:600px;" > <img src="/images/sub/contitle21.gif" alt="demo" width="200" height="30"/>
        <div class="buybox" >
        <p>Flexible licensing options are available in order to meet various
          needs, when using NetMiner in your classroom, work group, enterprise
          and campus.</p>
      
      </div>

      <div class="viewtab02 mdt20" id="about">
        <ul>
          <li  class="mdl1"><a href="/download_buy/license_price/license_price.do">Overview</a></li>
          <li  id="mouseout02"class="mdl1"><a href="/download_buy/license_price/license_price02.do">Student(Coursework)</a></li>
          <li  id="mouseout02" class="mdl1"><a href="/download_buy/license_price/license_price03.do">Student(Research)</a></li>
          <li  id="mouseout02" class="mdl1"><a href="/download_buy/license_price/license_price04.do">Academic</a></li>
          <li  id="mouseout02" class="mdl1"><a href="/download_buy/license_price/license_price06.do">Commercial</a></li>
        </ul>
      </div>
      <div class="buybox mdb30">
      	<img src="/images/sub/License3.png"/>
      </div>
<!--       <div class="buybox"> -->
<!--       <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2"> -->
 
<!--   <tr> -->
<!--     <th style="width:130px;" rowspan="2"  class="brline3">License</th> -->
<!--     <th colspan="3" class="brline3">Term</th> -->
<!--     <th colspan="4" class="brline3">Data Size&#13;</th> -->
<!--     <th style="width:147x;" rowspan="2" class="brline3">Packages</th> -->
<!--     <th colspan="2">Version</th> -->
<!--     </tr> -->
<!--   <tr> -->
<!--     <th style="width:43px;height:86px;" class="brline3 btiline fot12" >6 month</th> -->
<!--     <th style="width:33px;" class="brline3 btiline fot12">1 year</th> -->
<!--      <th style="width:62px;" class="brline3 btiline fot12" >Perpetual</th> -->
<!--      <th style="width:66px;" class="brline3 btiline fot12">Small -->
<!--        <span class="fot8">(~1000)</span></th> -->
<!--      <th style="width:84px;" class="brline3 btiline fot12" >Medium -->
<!--       <span class="fot8">(~10,000)</span></th> -->
<!--      <th style="width:86px;" class="brline3 btiline fot12" >Large -->
<!--       <span class="fot8">(~100,000)</span></th> -->
<!--      <th style="width:92px;" class="brline3 btiline fot12">Huge -->
<!--        <span class="fot8">(~1,000,000)</span></th> -->
<!--      <th style="width:42px;" class="brline3 btiline fot12" >Stand <br/> -->
<!--        Alone</th> -->
<!--     <th style="width:45px;" class="btiline">Server</th> -->
<!--   </tr> -->
<!--   <tr> -->
<!--     <td align="center" class="brline2 btiline">Student<br/>(Coursework)</td> -->
<!--     <td align="center" class="brline2 btiline">v</td> -->
<!--     <td align="center" class="brline2 btiline">&nbsp;</td> -->
<!--     <td align="center" class="brline2 btiline">&nbsp;</td> -->
<!--     <td align="center" class="brline2 btiline">v</td> -->
<!--     <td align="center" class="brline2 btiline">&nbsp;</td> -->
<!--     <td align="center" class="brline2 btiline">&nbsp;</td> -->
<!--     <td align="center" class="brline2 btiline">&nbsp;</td> -->
<!--     <td class="brline2 btiline fot12" >Full Package -->
<!-- <br/> -->
<!-- (without DB <br/>Connection and Make Plug-in)</td> -->
<!--     <td align="center" class="brline2 btiline">v</td> -->
<!--     <td align="center" class="btiline">&nbsp;</td> -->
<!--   </tr> -->
<!--   <tr> -->
<!--     <td align="center" class="brline2">Student<br/>(Research)</td> -->
<!--     <td align="center" class="brline2">&nbsp;</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">&nbsp;</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">&nbsp;</td> -->
<!--     <td rowspan="2" class="fot12 brline2">Basic  -->
<!-- + Additional  -->
<!-- <br/>Package -->
<!-- </td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td>&nbsp;</td> -->
<!--   </tr> -->
<!--   <tr> -->
<!--     <td align="center" class="brline2">Academic</td> -->
<!--     <td align="center" class="brline2">&nbsp;</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td >&nbsp;</td> -->
<!--   </tr> -->
<!--   <tr> -->
<!--     <td align="center" class="brline2">Institute<br/>Commercial</td> -->
<!--     <td align="center" class="brline2">&nbsp;</td> -->
<!--     <td align="center" class="brline2">&nbsp;</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td class="fot12 brline2">Full Packages</td> -->
<!--     <td align="center" class="brline2">v</td> -->
<!--     <td align="center" class="btiline">v</td> -->
<!--   </tr> -->
<!-- </table> -->
<!--       </div> -->
      
      <div class="buybox buybox_boxline" id="price" >
      <h1 style="text-align:center;">Want to know the price for License? </h1>
      <ul><li class="mdt15">Student and Academic license &nbsp; <div class="btn_mnoti">

	<c:choose>
		<c:when test="${isLogin eq 'true'}">
	      	<a href="/download_buy/buy/buy-view.do">Find Details &gt;</a>
		</c:when>
		<c:otherwise>
	      	<a href="javascript:d_login_move();">Find Details &gt;</a>
		</c:otherwise>
	</c:choose>

      </div>
      </li></ul>
      <ul><li class="mdt15">Institute and Commercial license &nbsp; <div class="btn_mnoti"><a href="/download_buy/buy/buyEnterprise-read.do">Request a quote  &gt;</a></div>
      </li></ul>
      </div>

    </div>
  </div>
  <!--//하단컨텐츠-->
  
</body>
</html>
