<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">

	function create() {
		doAjax("settlementModel", "/manager/settlement/settlement-create.do", "<c:out value = '${msg_save}'/>", "list_init()");
	}

	function update() {
		doAjax("settlementModel", "/manager/settlement/settlement-update.do", "<c:out value = '${msg_save}'/>", "");
	}
	
	function del() {
		doAjax("settlementModel", "/manager/settlement/settlement-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
	}

	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('settlementModel');
		frm.action = "/manager/settlement/settlement-readList.do";
		frm.submit();
	}
	
	function openWindow(action) {
		var settlementModel = document.getElementById("settlementModel");
		openPopup4Mail(settlementModel, action);
	}
	
	function sendMailPayment() {
		openWindow("/manager/settlement/settlement_mailPayment-popup.do");
	}
	
	</script>

</head>
	
<body>

    <div class="board_01">

	 <!--타이틀--><div class="btitle">자동결제</div> <!--//타이틀-->

	<form:form commandName="settlementModel">
		<form:hidden path="pageNo" />
		<form:hidden path="searchKind" />
		<form:hidden path="searchWord" />

		<form:hidden path="s_year" />
		<form:hidden path="s_month" />
		<form:hidden path="s_day" />
		<form:hidden path="e_year" />
		<form:hidden path="e_month" />
		<form:hidden path="e_day" />

		<form:hidden path="s_idx" />

    <div class="viewlist" > 
	
     <ul>
      
       <li>
         <table width="610" border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">결제상태</td>
             <td  class="mdt15 mdb10">
             	<form:select path="s_paidstatus" items="${settlementModel.paidstatusList}" itemLabel="text" itemValue="value" />
				<div class="btn_search"><a href="javascript:sendMailPayment();">결제 메일 발송</a></div>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">결제생성시각</td>
             <td  class="mdt15 mdb10">
             	${settlementModel.s_createdate}
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">아이디</td>
             <td  class="mdt15 mdb10">
             	<form:input path="s_sid" class="input_w200"/>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">비밀번호</td>
             <td  class="mdt15 mdb10">
             	<form:input path="s_spw" class="input_w200"/>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">구매자 이름(name)</td>
             <td  class="mdt15 mdb10">
             	<form:input path="s_orderid" class="input_w200"/>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">결제 항목</td>
             <td  class="mdt15 mdb10">
             	<form:input path="s_product" class="input_w200"/>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">세부 내역</td>
             <td  class="mdt15 mdb10">
             	<form:input path="s_poinvoice" class="input_w200"/>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">매출항목</td>
             <td  class="mdt15 mdb10">
             	<form:select path="s_licenseinfo_1" items="${settlementModel.licenseinfo_1List}" itemLabel="text" itemValue="value" />
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">Price</td>
             <td  class="mdt15 mdb10">
             	<form:input path="s_price" class="input_w200"/>
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">Location</td>
             <td  class="mdt15 mdb10">
             	<form:select path="s_location" items="${settlementModel.locationList}" itemLabel="text" itemValue="value" />
             </td>
           </tr>

           <tr>
             <td style="width:130px;height:28px;" class="mdt15 mdb10">Memo</td>
             <td  class="mdt15 mdb10">
			     <form:textarea path="s_memo" class="txt_w580"/>
             </td>
           </tr>

		</table>
       </li>

	    <li style="float:right" class="txtalign">
	<c:choose>
		<c:when test="${empty settlementModel.s_idx || settlementModel.s_idx eq '0'}">
			<a href="javascript:create();"><img src="/images/sub/btn_board06.gif" /></a>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty settlementModel.sessionAdminId}">
				<a href="javascript:update();"><img src="/images/sub/btn_board06.gif" /></a>
				<a href="javascript:del();"><img src="/images/sub/btn_board04.gif" /></a>
			</c:if>
		</c:otherwise>
	</c:choose>
		
		<a href="javascript:list()"><img src="/images/sub/btn_board01.gif" /></a>
       </li>

     </ul>
     </div>

	</form:form>
	
    </div>

</body>
</html>
