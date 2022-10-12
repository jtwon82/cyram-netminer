<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">
		
	function search() {
		$("#pageNo").val("0");
		
		var frm = document.getElementById('settlementModel');
		frm.action = "/manager/settlement/settlement-readList.do";
		frm.submit();
	}
	
	function view(s_idx) {
		document.getElementById('s_idx').value = s_idx;
		
		var frm = document.getElementById('settlementModel');
		frm.action = "/manager/settlement/settlement-read.do";
		frm.submit();
	}

	function changeTrColor(trObj, oldColor, newColor) {
		trObj.style.backgroundColor = newColor;
		trObj.onmouseout = function() {
			trObj.style.backgroundColor = oldColor;
		};
	}
		
	</script>

</head>
	
<body>
	
    <div class="board_01">
      <!--타이틀--><div class="btitle">자동결제</div> <!--//타이틀-->

	<form:form commandName="settlementModel">
		<form:hidden path="pageNo" />
		<form:hidden path="s_idx" />

     <div class="viewsearch  mdl10" > 
     <ul>
       <li class="mdt10 mdl10">
       	<form:input path="s_year" class="input_w70" style="width:40px " onkeydown="javascript:if(event.keyCode == 13) search();"/>년 <form:input path="s_month" style="width:20px" onkeydown="javascript:if(event.keyCode == 13) search();"/>월 <form:input path="s_day" class="input_w70" style="width:20px" onkeydown="javascript:if(event.keyCode == 13) search();" />일 ~ <form:input path="e_year" class="input_w70" style="width:40px" onkeydown="javascript:if(event.keyCode == 13) search();"/>년 <form:input path="e_month" class="input_w70" style="width:20px" onkeydown="javascript:if(event.keyCode == 13) search();" />월 <form:input path="e_day" class="input_w70" style="width:20px" onkeydown="javascript:if(event.keyCode == 13) search();" />일 
       </li>
       <li class="mdt10 mdl10">
       	<form:select path="searchKind" items="${settlementModel.selectBoxModelList}" itemLabel="text" itemValue="value" />
         <form:input path="searchWord" class="input_w300" onkeydown="javascript:if(event.keyCode == 13) search();"/>
         <div class="btn_search">
         	<a href="javascript:search();">SEARCH</a>
         </div>
       </li>
     </ul>
     </div>

    <div class="viewlist mdt10 mdl10">
    <table  border="0" cellspacing="0" cellpadding="0" class="buss_tb">
    
	  <tr>
	    <th style="width:60px">상태</th>
	    <th style="width:160px">결제생성시각</th>
	    <th style="width:120px">아이디</th>
	    <th style="width:100px">구매자 이름</th>
	    <th style="width:140px">결제 항목(Description)</th>
	    <th>세부 내역</th>
	    <th style="width:150px">매출항목</th>
	    <th style="width:100px">Price</th>
	    <th style="width:80px">Location</th>
	    </tr>

		<c:forEach var="settlementModel" items="${list}">
			<tr onclick="javascript:view('${settlementModel.s_idx}');" style="cursor:pointer" onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')">
					<c:choose>
						<c:when test="${settlementModel.s_paidstatus eq 'END'}">
				<td style="color:blue;">${settlementModel.s_paidstatus}</td>
						</c:when>
						<c:otherwise>
				<td style="color:gray;">${settlementModel.s_paidstatus}</td>
						</c:otherwise>
					</c:choose>

				<td>
					${settlementModel.s_createdate}
				</td>
				<td>
					${settlementModel.s_sid}
				</td>
				<td>
					${settlementModel.s_orderid}
				</td>
				<td>
					${settlementModel.s_product}
				</td>
				<td>
					${settlementModel.s_poinvoice}
				</td>
				<td>
					${settlementModel.s_licenseinfo_1}
				</td>
				<td>
					${settlementModel.s_price}
				</td>
				<td>
					${settlementModel.s_location}
				</td>
			</tr>
		</c:forEach>

	</table>

		 <ul>
         <li style="float:right" class="mdt10 mdr6"><a href="javascript:view('0');"><img src="/images/sub/btn_board02.gif" alt="Write"/></a></li>
        </ul>
    </div>
		
		<c:out value = "${moveLinkPageScript}" escapeXml="false"/>
		<c:out value = "${moveLinkPagePrint}" escapeXml="false"/>
		
	</form:form>

    </div>

</body>
</html>
