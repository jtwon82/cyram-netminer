<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
</head>
	
<body>

<div id="wrap" class="active-0-0-0">
  <!-- Layout : header Start -->
  <div id="header" >
    <a href="javascript:top_fn_moveHome();"><img src="/images/admin/logo.gif" alt="NetMiner" width="300" height="44" /></a>
    
    <span class="topleft">
    
	<c:if test="${ topModel.loginAdmin eq 'true' }">
	
	<c:choose>
		<c:when test="${ topModel.kor eq 'false' }">
	        <a href="javascript:top_fn_setKorByAjax('true');"><img src="/images/main/h_kor.png"/></a>
		</c:when>
		<c:otherwise>
	        <a href="javascript:top_fn_setKorByAjax('false');"><img src="/images/main/h_eng.png"/></a>
		</c:otherwise>
	</c:choose>

	   &nbsp;<a href="javascript:top_fn_logout();"><img src="/images/main/h_left03.png" /></a>
	</c:if>
	
	</span>
 </div>
   
 
  <!--하단컨텐츠-->
  <div id="container02" >
  
    <div class="submain" >

	<form:form commandName="topModel">
		<form:hidden path="lang" />
	</form:form>

	<c:if test="${ topModel.loginAdmin eq 'true' }">

     <div class="viewtab">
       <ul>
        <li  class="mdl1">판매</li>
        <li id="mouseout" class="mdl1"><a href="/manager/sale/sale-readList.do"> 판매관리 </a></li>
        <li id="mouseout" class="mdl1"><a href="/manager/sale/free-readList.do"> 수업용 신청 내역 </a></li>
        <li id="mouseout" class="mdl1"><a href="/manager/settlement/settlement-readList.do"> 자동결제 </a></li>
        
        <li  class="mdl1">사용자 관리</li>
        <li id="mouseout" class="mdl1"><a href="/manager/admin/admin-readList.do"> 관리자 </a></li>
        <li id="mouseout" class="mdl1"><a href="/manager/nmuser/nmuser-readList.do"> 사용자 </a></li> 
        
        <li  class="mdl1">게시판 관리</li>
        <li id="mouseout" class="mdl1"><a href="/manager/notice/notice-readList.do"> notice </a></li> 
        <li id="mouseout" class="mdl1"><a href="/manager/history/history-readList.do"> History </a></li> 
        <li id="mouseout" class="mdl1"><a href="/manager/appstore/appstore-readList.do"> Appstore </a></li> 
        <li id="mouseout" class="mdl1"><a href="/manager/qna/qna-readList.do"> QnA </a></li> 
        <li id="mouseout" class="mdl1"><a href="/manager/faq/faq-readList.do"> FAQ </a></li> 

        <li  class="mdl1">통계</li>
        <li id="mouseout" class="mdl1"><a href="/manager/statistics/statistics_monthly-read.do"> 월별 통계 </a></li> 

       </ul>
     </div>
	
	</c:if>
</body>
</html>
