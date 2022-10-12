<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title></title>
	
	<script>
	function fn_onload() {
	<c:if test="${ nmUserModel.login eq 'false' }">
		if($("#loginid").val() == '') {
			$("#loginid").focus();
			return;
		}
	</c:if>
	}
	
	function fn_check_duplicate() {
		$("form[id=nmUserModel]").ajaxSubmit({
			url : "/nmuser-read-ajax.do",
			type : "post",
			success : function(data){
				if(data.trim() == 'SUCCESS') {
					$("#dup").val($("#loginid").val());
					setErrorMsg("error_msg_loginid", "blue", "<c:out value = '${msg_ava_id}'/>");
				} else {
					$("#dup").val("");
					setErrorMsg("error_msg_loginid", "red", "<c:out value = '${msg_not_ava_id}'/>");
				}
			}
		});
	}

	function fn_checkDup() {
		if($("#dup").val() == $("#loginid").val()) {
			;
		} else {
			if($("#loginid").val().length > 10) {
				$("#dup").val("");
				setErrorMsg("error_msg_loginid", "red", "Max Length is 10.");
				$("#loginid").val($("#loginid").val().substring(0, 10));
			} else {
				$("#dup").val("");
				$("#error_msg_loginid").html("");
			}
		}
	}
	
	function fn_checkPwd() {
    var pwd = $("#pwd").val();
    if(pwd == '') {
    	$("#error_msg_pwd").html("");
    }
    if(pwd.length != 0 && (pwd.length < 6 || pwd.length > 32)) {
    	setErrorMsg("error_msg_pwd", "red", "<c:out value = '${msg_short_pwd}'/>")
    } else {
    	$("#error_msg_pwd").html("");
    }
    
		var pwd2 = $("#pwd2").val();
		if(pwd2 == '') {
			$("#error_msg_pwd2").html("");
		} else {
			if(pwd == pwd2) {
				$("#error_msg_pwd2").html("");
			} else {
				setErrorMsg("error_msg_pwd2", "red", "<c:out value = '${msg_not_pwd}'/>");
			}
		}
	}

	function fn_keydown(obj) {
		if(obj.value != '' && obj.value != '0' && $("#error_msg_" + obj.id).html() == "required") {
			$("#error_msg_" + obj.id).html("");
		}
	}
	
	function _checkVal(withPwd) {
		if($("#loginid").val() == '') {
			return "loginid";
		}
		
		if(withPwd) {
			if($("#pwd").val() == '') {
				return "pwd";
			}
			
			if($("#pwd2").val() == '') {
				return "pwd2";
			}
		} else {
			if($("#pwd").val() != '' && $("#pwd2").val() == '') {
				return "pwd2";
			}
			
			if($("#pwd").val() == '' && $("#pwd2").val() != '') {
				return "pwd";
			}
		}
		
		if($("#email").val() == '') {
			return "email";
		}

		if($("#firstname").val() == '') {
			return "firstname";
		}

		if($("#lastname").val() == '') {
			return "lastname";
		}

		if($("#occupation").val() == '0') {
			return "occupation";
		}

		if($("#industry").val() == '0') {
			return "industry";
		}

		if($("#organization").val() == '') {
			return "organization";
		}

		if($("#country").val() == '') {
			return "country";
		}

		return "";
	}

	function checkVal(withPwd) {
		var objId = _checkVal(withPwd);
		
		if(objId != '') {
			setErrorMsg("error_msg_" + objId, "red", "required");
			$("#" + objId).focus();
			return false;
		}

		if($("#error_msg_pwd2").html() != '' || $("#error_msg_pwd").html() != '') {
			$("#pwd").focus();
			return false;
		}

		return true;
	}
	
	function fn_signup() {
		if(checkVal(true)) {
			if($("#dup").val() != $("#loginid").val()) {
				setErrorMsg("error_msg_loginid", "red", "Please check duplicate id.");
				$("#loginid").focus();
				return;
			}
			
			doAjax("nmUserModel", "/nmuser-create.do", "<c:out value = '${msg_signup}'/>", "top_Home()");
		}
	}
	
	function fn_update() {
		if(checkVal(false)) {
			doAjax("nmUserModel", "/nmuser-update.do", "<c:out value = '${msg_save}'/>", "fn_reload()");
		}
	}
		
	</script>
</head>
	
<body onload="fn_onload();">
	
  <!--하단컨텐츠-->
  <div id="container02" >
    
  
    <div class="submain" >
	<c:choose>
		<c:when test="${ nmUserModel.login eq 'false' }">
             <img src="/images/sub/contitle02.gif" alt="Sign up for your Netminer Community Member ID" />
		</c:when>
		<c:otherwise>
             <img src="/images/sub/contitle03.gif" alt="NetminerMember" />
		</c:otherwise>
	</c:choose>

     
     <!--레이어팝업/회원가입 부분-->
    <div class="mdt30" > 
     <ul>
    
       <li class="mdt10 mdl700 fot12">
     <span style="color:red;">*</span> Required Information</li>
     <li>
     
	<form:form commandName="nmUserModel">
		<form:hidden path="dup" />
     
    <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
    
	<c:choose>
		<c:when test="${ nmUserModel.login eq 'false' }">
		
  <tr>
    <td style="width:216px;">User ID <span style="color:red;">*</span></td>
    <td >
    	<form:input path="loginid" onkeyup="javascript:fn_keydown(this);fn_checkDup();" class="input_w100" alt="id"/>
    	<a href="javascript:fn_check_duplicate();"><img src="/images/sub/btn_dul.gif" alt="DUPLICAT CHECK" /></a>
		<!--중복메세지출력--> <span id="error_msg_loginid" class="font12"></span><!--//중복메세지출력-->
    </td>
  </tr>
    
		</c:when>
		<c:otherwise>

  <tr>
    <td style="width:216px;">User ID <span style="color:red;">*</span></td>
    <td >
    	<c:out value="${nmUserModel.loginid}" />
		<form:hidden path="loginid" />
    </td>
  </tr>
		
		</c:otherwise>
	</c:choose>
    
  <tr>
    <td>Password <span style="color:red;">*</span></td>
    <td><form:password path="pwd" onkeyup="javascript:fn_keydown(this);fn_checkPwd();" class="input_w100" alt="password"/> <span id="error_msg_pwd" class="font12"></span></td>
  </tr>
  <tr>
    <td>Verify Password <span style="color:red;">*</span></td>
    <td><form:password path="pwd2" onkeyup="javascript:fn_keydown(this);fn_checkPwd();" class="input_w100" alt="verify password" /> <span id="error_msg_pwd2" class="font12"></span></td>
  </tr>
  <tr>
    <td>e-mail address <span style="color:red;">*</span></td>
    <td><form:input path="email" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="e-mail address"/> <span id="error_msg_email" class="font12"></span></td>
  </tr>
  <tr>
    <td>First name <span style="color:red;">*</span></td>
    <td><form:input path="firstname" onkeyup="javascript:fn_keydown(this);" class="input_w100" alt="first name"/> <span id="error_msg_firstname" class="font12"></span></td>
  </tr>
  <tr>
    <td>Last name <span style="color:red;">*</span></td>
    <td><form:input path="lastname" onkeyup="javascript:fn_keydown(this);" class="input_w100" alt="last name"/> <span id="error_msg_lastname" class="font12"></span></td>
  </tr>
  <tr>
    <td>Occupation <span style="color:red;">*</span></td>
    <td><form:select path="occupation" onchange="javascript:fn_keydown(this);" items="${nmUserModel.occupationList}" itemLabel="text" itemValue="value" class="input_w280" alt="occupation" style="height:20px!important"/> <span id="error_msg_occupation" class="font12"></span></td>
  </tr>
  <tr>
    <td>Industry <span style="color:red;">*</span></td>
    <td><form:select path="industry" onchange="javascript:fn_keydown(this);" items="${nmUserModel.industryList}" itemLabel="text" itemValue="value" class="input_w280" alt="industry" style="height:20px!important"/> <span id="error_msg_industry" class="font12"></span></td>
  </tr>
  <tr>
    <td>Company/organization <span style="color:red;">*</span></td>
    <td><form:input path="organization" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="company/organization"/> <span id="error_msg_organization" class="font12"></span></td>
  </tr>
  <tr>
    <td>Country <span style="color:red;">*</span></td>
    <td><form:select path="country" onchange="javascript:fn_keydown(this);" items="${nmUserModel.countryList}" itemLabel="text" itemValue="value" class="input_w280" alt="country"/> <span id="error_msg_country" class="font12"></span></td>
  </tr>
</table>

	</form:form>
   
    </li>


	<c:choose>
		<c:when test="${ nmUserModel.login eq 'false' }">
		
    <li class="mdt10 mdl300"><a href="javascript:fn_signup();" class="close mdl10"> <img src="/images/main/btn_sign.gif" alt="회원가입" /></a></li>
    
		</c:when>
		<c:otherwise>

     <li class="mdt10 mdl300"><a href="javascript:fn_update();" class="close mdl10"> <img src="/images/sub/btn_ok.gif" alt="확인" /></a></li>
		
		</c:otherwise>
	</c:choose>
 
    </ul>
    </div>
    <!--//레이어팝업/회원가입 부분-->
     
    </div>
    
  </div>
  <!--//하단컨텐츠-->
  
</body>
</html>
