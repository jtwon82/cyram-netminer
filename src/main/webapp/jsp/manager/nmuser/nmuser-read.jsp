<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">
	
	function fn_check_duplicate() {
		$("form[id=nmUserModel]").ajaxSubmit({
			url : "/nmuser-read-ajax.do",
			type : "post",
			success : function(data){

				if(data.trim() == 'SUCCESS') {
					$("#dup").val($("#loginid").val());
					$("#id_error_msg").html("<span style='color:blue;'>Available id.</span>");
				} else {
					$("#dup").val("");
					$("#id_error_msg").html("<span style='color:red;'>The already existing id.</span>");
				}
			}
		});
	}

	function fn_checkDup() {
		if($("#dup").val() == $("#loginid").val()) {
			;
		} else {
			$("#dup").val("");
			$("#id_error_msg").html("");
		}
	}
	
	function create() {
		if($("#dup").val() != $("#loginid").val()) {
			alert("Please check duplicate id.");
			return;
		}
		
		doAjax("nmUserModel", "/manager/nmuser/nmuser-create.do", "<c:out value = '${msg_save}'/>", "list_init()");
	}

	function update() {
		doAjax("nmUserModel", "/manager/nmuser/nmuser-update.do", "<c:out value = '${msg_save}'/>", "list()");
	}
	
	function del() {
		doAjax("nmUserModel", "/manager/nmuser/nmuser-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
	}

	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('nmUserModel');
		frm.action = "/manager/nmuser/nmuser-readList.do";
		frm.submit();
	}
	
	</script>

</head>
	
<body>

    <div class="board_01">

      <!--타이틀--><div class="btitle">사용자</div> <!--//타이틀-->
	
	<form:form commandName="nmUserModel">
		<form:hidden path="pageNo" />
		<form:hidden path="searchKind" />
		<form:hidden path="searchWord" />		
		<form:hidden path="dup" />
		
    <div class="viewlist" > 
	
     <ul>
      
     <li>
	    <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
           <tr>
             <td  style="width:150px;" class="mdt15 mdb10">User ID</td>
             <td  class="mdt15 mdb10">
		<c:choose>
			<c:when test="${empty nmUserModel.loginid || nmUserModel.loginid eq '0'}">
            	<form:input path="loginid" onkeyup="javascript:fn_checkDup()" class="input_w300" />
				<a href="javascript:fn_check_duplicate();">
					<img src="/images/sub/btn_dul.gif" alt="DUPLICAT CHECK" />
				</a>
				<div id="id_error_msg"></div>
			</c:when>
			<c:otherwise>
				<c:out value="${nmUserModel.loginid}" />
				<form:hidden path="loginid" />
			</c:otherwise>
		</c:choose>
             
             </td>
             </tr>

           <tr>
             <td class="viewline">Password</td>
             <td class="viewline"><form:password path="pwd" /></td>
             </tr>

           <tr>
             <td class="viewline">e-mail Address</td>
             <td class="viewline">
             	<form:input path="email" class="input_w200"/>
             </td>
             </tr>

           <tr>
             <td class="viewline">First Name</td>
             <td class="viewline">
             	<form:input path="firstname" class="input_w200"/> <form:input path="lastname" class="input_w200"/>
             </td>
             </tr>

           <tr>
             <td class="viewline">Last Name</td>
             <td class="viewline">
             	<form:input path="lastname" class="input_w200"/>
             </td>
             </tr>

           <tr>
             <td class="viewline">Occupation</td>
             <td class="viewline">
             	<form:select path="occupation" items="${nmUserModel.occupationList}" itemLabel="text" itemValue="value" class="input_w300" style="height:20px!important"/>
             </td>
             </tr>

           <tr>
             <td class="viewline">Industry</td>
             <td class="viewline">
             	<form:select path="industry" items="${nmUserModel.industryList}" itemLabel="text" itemValue="value" class="input_w300" style="height:20px!important"/>
             </td>
             </tr>

           <tr>
             <td class="viewline">Company / Organization</td>
             <td class="viewline">
             	<form:input path="organization" class="input_w200"/>
             </td>
             </tr>

           <tr>
             <td class="viewline">Country</td>
             <td class="viewline">
             	<form:select path="country" items="${nmUserModel.countryList}" itemLabel="text" itemValue="value" class="input_w300" style="height:20px!important"/>
             </td>
             </tr>

		</table>
       </li>
       
	    <li class="txtalign" style="float:right">
		<c:choose>
			<c:when test="${empty nmUserModel.loginid || nmUserModel.loginid eq '0'}">
				<a href="javascript:create();"><img src="/images/sub/btn_board06.gif" /></a>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty nmUserModel.sessionAdminId}">
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
