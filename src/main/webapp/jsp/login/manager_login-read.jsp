<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=1060" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	
	<title></title>
	
	<link rel="stylesheet" type="text/css" href="/css/admin.css" />

	<script type="text/javascript" src="/js/netminer.js"></script>
	<script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	
	<script>
	function fn_onload() {
		if($("#adminid").val() == '') {
			$("#adminid").focus();
			return;
		}
		
		if($("#adminpw").val() == '') {
			$("#adminpw").focus();
			return;
		}
	}
	
	function fn_login() {
		if($("#adminid").val() == '') {
			alert("아이디를 입력하세요.");
			$("#adminid").focus();
			return;
		}
		
		if($("#adminpw").val() == '') {
			alert("비밀번호를 입력하세요.");
			$("#adminpw").focus();
			return;
		}
		
		doAjax("adminModel", "/login/manager_login-create.do", "", "fn_moveReturn()");
	}
	
	function fn_moveReturn() {
		var adminModel = document.getElementById("adminModel");
		
		adminModel.action = "/manager/main/main-read.do";
		adminModel.submit();
	}
	
	</script>
</head>
	
<body onload="fn_onload();">
	

<div class="adminwrap">
<div class="login "  >
  <ul>
  	<li>

	<form:form commandName="adminModel">

    <table width="300" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="width:63px;"><img src="/images/sub/id.gif" width="61" height="14" alt="아이디"/></td>
        <td style="width:139px;" ><form:input path="adminid" onkeydown="javascript:if(event.keyCode == 13) fn_login();" tabindex="1" class="input_w100"/></td>
        <td style="width:98px;height:75px;" rowspan="2"><a href="javascript:fn_login();" tabindex="3" ><img src="/images/sub/btn_login.gif" alt="로그인" width="97" height="53"/></a></td>
      </tr>
      <tr>
        <td><img src="/images/sub/pw.gif" width="61" height="14" alt="패스워드"/></td>
        <td ><form:password path="adminpw" onkeydown="javascript:if(event.keyCode == 13) fn_login();" tabindex="2" class="input_w100"/></td>
      </tr>
     
    </table>

	</form:form>

  	</li>
  </ul>
</div>
</div>

<div id="return_message" style="display:none">
</div>

</body>
</html>
