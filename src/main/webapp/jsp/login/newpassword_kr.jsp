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
        임시 비밀번호가 발급되었습니다.
      </span>
       <!--레이어팝업/로그인인풋부분-->
    <div class="login" style="font-size:14px;"> 
    <div>가입하신 NetMiner 웹사이트 계정에 대한 비밀번호가 변경되었습니다.</div><br/>
    <div>임시 비밀번호는 <span style="font-weight:bold"><c:out value="${nmUserModel.pwd}"/></span> 입니다.</div><br/>
    <div>임시 비밀번호를 이용하여 로그인 한 후에는 반드시 사용자 정보 변경에서 비밀번호를 변경해 주시기 바랍니다.</div><br/>
  
    </div>
    <!--//레이어팝업/로그인인풋부분-->
    <a href="/login/login-read.do" style="float:right;"><img src="/images/sub/btn_continue.png" alt="continue" width="78" height="31" /></a>
    </div>
    <!--notice//-->
  </div>
  <!--//하단컨텐츠-->
</body>
</html>
