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
                  alert("입력하신 ID는 가입되지 않은 ID입니다. 확인 후 다시 입력하시기 바랍니다.");
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
                  alert("비밀번호 변경 메일이 발송되었습니다.");
                  var nmUserModel = document.getElementById("nmUserModel");
                  nmUserModel.action = "/";
                  nmUserModel.submit();
                } else {
                  alert("메일 발송에 실패하였습니다.");
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
        <span style="font-size:18px;font-weight:bold;">비밀번호를 잊으셨습니까?</span>
       <!--레이어팝업/로그인인풋부분-->
    <div class="login" > 
    <ul>
    
  <form:form commandName="nmUserModel">
        <div style="font-size:14px;">NetMiner 웹사이트 ID를 입력해 주십시오.<br/> 비밀번호 변경 메일을 등록하신 이메일로 발송해 드립니다.</div>
        <br/>
        <div style="font-size:15px;">NetMiner 웹사이트 ID</div>
      <table width="400" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="width:215px;" ><form:input path="loginid" onkeydown="javascript:if(event.keyCode == 13) fn_newpassword();" class="input_w160" tabindex="1"/></td>
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
