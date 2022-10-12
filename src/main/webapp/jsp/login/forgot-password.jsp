<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <title></title>
      <script>
      function fn_newpassword() {
    	    // 아이디체크
          $("form[id=nmUserModel]").ajaxSubmit({
              url : "/nmuser-read-ajax.do",
              type : "post",
              success : function(data){
                if(data.trim() == 'SUCCESS') {
                  // 아이디 없음 통보. 종료.
                  alert("The ID you have entered does not exist. Pleae check your website ID again.");
                } else {
                  // 아이디로 이메일 발송
                  checkmail();
                }
              }
            });
      }
      
      function checkmail() {
          $("form[id=nmUserModel]").ajaxSubmit({
              url : "/nmuser-mail-ajax.do",
              type : "post",
              success : function(data){
                if(data.trim() == 'SUCCESS') {
                  alert("The reset password email will be delivered.");
                  var nmUserModel = document.getElementById("nmUserModel");
                  nmUserModel.action = "/";
                  nmUserModel.submit();
                } else {
                  alert("Sorry sending mail failed.");
                }
              }
            });
      }
      
      </script>
</head>
  
<body>
  
  <!--하단컨텐츠-->
  <div id="container02" >
    
    <!--notice-->
    <div class="submain" >
        <span style="font-size:18px;font-weight:bold;">Forgot your password?</span>
       <!--레이어팝업/로그인인풋부분-->
    <div class="login" > 
    <ul>
    
  <form:form commandName="nmUserModel">
        <div style="font-size:14px;">Please enter your NetMiner website ID and we'll send reset password email to your registered email address.</div>
        <br/>
        <div style="font-size:15px;">NetMiner website ID</div>
      <table width="400" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="width:215px;"><form:input path="loginid" onkeydown="javascript:if(event.keyCode == 13) fn_newpassword();" class="input_w160" tabindex="1"/></td>
          <td style="width:98px;height:35px;" rowspan="2"><a href="javascript:fn_newpassword();" tabindex="2"><img src="/images/sub/btn_continue.png" alt="continue" width="78" height="31" /></a></td>
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
