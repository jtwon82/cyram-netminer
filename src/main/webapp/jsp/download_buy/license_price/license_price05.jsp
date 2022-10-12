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

</head>

	
<body>
	

  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > <img src="/images/sub/contitle21.gif" alt="demo" width="200" height="30"/>
        <div class="buybox" >
        <p>Flexible licensing options are available in order to meet various
          needs, when using NetMiner in your classroom, work group, enterprise
          and campus.</p>
      
      </div>

      <div class="viewtab02 mdt20" id="about">
        <ul>
          <li  id="mouseout02" class="mdl1"><a href="/download_buy/license_price/license_price.do">Overview</a></li>
          <li id="mouseout02"  class="mdl1"><a href="/download_buy/license_price/license_price02.do">Student(Coursework)</a></li>
          <li id="mouseout02"  class="mdl1"><a href="/download_buy/license_price/license_price03.do">Student(Research)</a></li>
          <li id="mouseout02"  class="mdl1"><a href="/download_buy/license_price/license_price04.do">Academic</a></li>
          <li   class="mdl1"><a href="/download_buy/license_price/license_price05.do">Institute</a></li>
          <li  id="mouseout02" class="mdl1"><a href="/download_buy/license_price/license_price06.do">Commercial</a></li>
        </ul>
      </div>
      
      <div class="buybox" >
      
          <table class="buss_tb2" border="0" cellpadding="0" cellspacing="0">

          <tr>
            <th style="width:327px;" class="h20">Term</th>
            <td style="width:493px;" class="h20">Perpetual</td>
          </tr>
          <tr>
            <th style="width:327px;" class="h20">Data Size<br/>(Number of Nodes)</th>
            <td class="h20">Small (~1,000) <br/>
Medium (~10,000)<br/>
Large (~100,000)<br/>
Huge (~1,000,000)</td>
          </tr>
          <tr>
            <th style="width:327px;" class="h20">Packages</th>
            <td class="h20">Full Packages</td>
          </tr>
        </table>
      
       <h1 class="mdt15">Institute Use </h1>
    <ul>
     <li class="mdt15">
      (1) License<br/>
     The LICENSEE must be an institution which performs research and development activities, or a not-for-profit organization and
     must not be affiliated with any commercial corporations.

      </li>
      <li class="mdt15">
        (2) Installation<br/>
      Programs may only be installed and operated on one (1) individual, stand-alone computer that the LICENSEE owns or leases, 
     provided (i) the Programs are only accessible to, and operated by LICENSEE, and (ii) the LICENSEE has provided machine-
     specific identification for that computer through the registration and activation process. Network installation is prohibited.

</li>
      <li class="mdt15">
     (3) User<br/>
     Any users authorized by the LICENSEE are allowed to use the Software.
      </li>
      <li class="mdt15">
         (4) Use<br/>
    Specifically restrict to research and development activities.


      </li>
    </ul>
      </div>

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
