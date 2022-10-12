<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <title></title>
  
  <script>
  function fn_onload() {
    if($("#loginid").val() == '') {
      $("#loginid").focus();
      return;
    }
    
    if($("#pwd").val() == '') {
      $("#pwd").focus();
      return;
    }
  }

  function fn_login() {
    if($("#loginid").val() == '') {
      alert("<c:out value = '${msg_enter_id}'/>");
      $("#loginid").focus();
      return;
    }
    
    if($("#pwd").val() == '') {
      alert("<c:out value = '${msg_enter_pwd}'/>");
      $("#pwd").focus();
      return;
    }
    
    doAjax("nmUserModel", "/login/login-create.do", "", "fn_moveReturn()");
  }
  
  function fn_moveReturn() {
	    var nmUserModel = document.getElementById("nmUserModel");
	    
	    var url = nmUserModel.action;
	    var index = url.indexOf("/login/login-read.do");
	    
	    if(index > -1) {
	      url = document.referrer;
	      index = url.indexOf("/nmuser/nmuser-read.do");
	      /* 비밀번호 찾기 페이지에서 넘어와서 로그인하는 경우 초기화면으로 돌아간다 */
	      var indexnew = url.indexOf("/login/newpassword.do");
	      
	      if(index > -1 || indexnew > -1) {
	        nmUserModel.action = "/";
	      } else {
	        nmUserModel.action = url;
	      }
	    }

	    nmUserModel.submit();
	  }
  
  </script>
</head>
  
<body onload="fn_onload();">
  
  <!--하단컨텐츠-->
  <div id="container02" >
    
    <!--notice-->
    <div class="submain" >
             <img src="/images/sub/contitle01.gif" alt="login" />
       <!--레이어팝업/로그인인풋부분-->
    <div class="login" > 
    <ul>
    
  <form:form commandName="nmUserModel">
      <table width="300" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="width:63px;"><img src="/images/sub/id.gif" width="48" height="14" alt="아이디" /></td>
          <td style="width:139px;"><form:input path="loginid" onkeydown="javascript:if(event.keyCode == 13) fn_login();" class="input_w100" tabindex="1"/></td>
          <td style="width:98px;height:75px;" rowspan="2"><a href="javascript:fn_login();" tabindex="3"><img src="/images/sub/btn_login.gif" alt="로그인" width="97" height="53" /></a></td>
        </tr>
        <tr>
          <td><img src="/images/sub/pw.gif" width="54" height="14" alt="패스워드" /></td>
          <td ><form:password path="pwd" onkeydown="javascript:if(event.keyCode == 13) fn_login();" class="input_w100" tabindex="2"/></td>
          </tr>
        <tr>
          <td style="height:56px;" colspan="3" align="right" style="border-top:1px #DDD solid;" >
            <a href="javascript:top_fn_moveSign();"><img src="/images/sub/btn_mem.gif" alt="회원가입" width="94" height="31" /></a>
          </td>
        </tr>
        <tr>
          <td style="height:25px;" colspan="3" align="right" >
            <a href="/login/forgot-password.do"><span style="font-size:12px;">패스워드 찾기</span></a>
          </td>
        </tr>
      </table>
  </form:form>
  
    </ul>
    </div>
    <!--//레이어팝업/로그인인풋부분-->
     
    </div>
    <!--notice//-->
  </div>
  <!--//하단컨텐츠-->
</body>
</html>
