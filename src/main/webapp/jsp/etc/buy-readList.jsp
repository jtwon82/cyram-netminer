<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>

	<script type="text/javaScript">
	function view_serialnum(i) {
		var cLayer = document.getElementById("serialnum_div_c_" + i);
		
		if(cLayer.innerHTML == "License Key") {
			document.getElementById("serialnum_div_v_" + i).style.display = 'table-row';
			cLayer.innerHTML = "Close";
		} else {
			document.getElementById("serialnum_div_v_" + i).style.display = "none";
			cLayer.innerHTML = "License Key";
		}
	}		

	function download(bf_file) {
		$('#downloadFileHTML').html("<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/download_buy/download/download-read.do?fileName=" + bf_file + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}

	</script>

</head>
	
<body>
	
  <!--하단컨텐츠-->
  <div id="container02" >
    
  
    <div class="submain" >
             <img src="/images/sub/contitle29.gif" />
     
     <!--레이어팝업/회원가입 부분-->
    <div class="mdt30" > 
     <ul>

     <li>
    
	<form:form commandName="saleModel">
		<form:hidden path="saleid" />
     
	    <table border="0" cellspacing="0" cellpadding="0" class="buss_tb" style="font-size:13px;">
		  <tr>
		    <th style="width:90px;" >Product</th>
		    <th style="width:140px;" >Type</th>
		    <th >Package</th>
		    <th style="width:90px;">Expire Date</th>
		    <th style="width:80px;">Product ID</th>
		    <th style="width:95px;">License Key</th>
		    <th style="width:110px;">Download</th>
		  </tr>
  
			<c:forEach var="saleModel" items="${list}" varStatus="status">
		  <tr>
		    <td  class="btiline">${saleModel.filename}
		    <!--//버튼--></td>
		    <td class="btiline" align="left">
		    	${saleModel.licenseusage}<br/>
		    	${saleModel.licensesize}<br/>
		    	${saleModel.licenseterm}
		    </td>
		    <td class="btiline" align="left">${saleModel.note}</td>
		    <td class="btiline">
				<c:choose>
					<c:when test="${ saleModel.licenseterm eq 'Perpetual' }">
				    	${saleModel.licenseterm}
					</c:when>
					<c:otherwise>
				    	${saleModel.expiredate}
					</c:otherwise>
				</c:choose>
		    </td>
		    <td class="btiline">CYNM${saleModel.productserial}</td>
		    <td class="btiline" align="center">
				<c:choose>
					<c:when test="${ saleModel.serialnum eq '' }">
				    	Unissued
					</c:when>
					<c:otherwise>
				    	<div class="sorts" id='serialnum_div_c_<c:out value="${status.index}"/>' style="display:block; cursor:pointer; " onclick="view_serialnum('<c:out value="${status.index}"/>');">License Key</div>
					</c:otherwise>
				</c:choose>
		    </td>
		    <td class="btiline" align="center">
				<c:choose>
					<c:when test="${ saleModel.serialnum eq '' }">
				    	-
					</c:when>
					<c:otherwise>
				    	<div class="sorts" style="display:block; cursor:pointer; " onclick="javascript:download('64');">64bit</div>
				    	<div class="sorts" style="display:block; cursor:pointer; " onclick="javascript:download('32');">32bit</div>
					</c:otherwise>
				</c:choose>
			</td>
		  </tr>
		  
		<c:if test="${ saleModel.serialnum ne '' }">
		  <tr id='serialnum_div_v_<c:out value="${status.index}"/>' style="display:none;">
		    <td colspan="7" align="left">
		    	<div style="color:red;">${saleModel.serialnum}</div>
		    </td>
		  </tr>
		</c:if>

			</c:forEach>
		</table>

	</form:form>
   
    </li>
   
    </ul>
    </div>
    <!--//레이어팝업/회원가입 부분-->
     
    </div>
    
  </div>
  <!--//하단컨텐츠-->


</body>
</html>
