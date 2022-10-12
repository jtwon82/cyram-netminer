<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <title></title>
</head>
  
<body>
  
  <!--하단컨텐츠-->
  <div id="container02" >
    
    <!--notice-->
    <div class="submain" >
      <span style="font-size:18px;font-weight: bold;">
        Reset Password
      </span>
       <!--레이어팝업/로그인인풋부분-->
    <div class="login" style="font-size:14px;"> 
    <div>We have reset the password on your NetMiner account.</div><br/>
    <div>The temporary password has been set to : <span style="font-weight:bold"><c:out value="${nmUserModel.pwd}"/></span></div><br/>
    <div>Please note the the password is case-sensitive.</div><br/>
    <div>for your security, please change your password after first-time login.</div><br/>
  
    </div>
    <!--//레이어팝업/로그인인풋부분-->
    <a href="/login/login-read.do" style="float:right;"><img src="/images/sub/btn_continue.png" alt="continue" width="78" height="31" /></a>
    </div>
    <!--notice//-->
  </div>
  <!--//하단컨텐츠-->
</body>
</html>
