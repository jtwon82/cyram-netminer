<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>NetMiner - Premier Software for Social Network Analysis</title>


	<script type="text/javaScript">

	function view(wr_id) {
		document.getElementById('wr_id').value = wr_id;
		
		var frm = document.getElementById('mainModel');
		frm.action = "/aboutus/notice/notice-view.do";
		frm.submit();
	}

	</script>
	
</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container04" >

	<form:form commandName="mainModel" method="post" enctype="multipart/form-data">
		<form:hidden path="wr_id" />
	</form:form>
	
    <!--베너박스-->
    
     <c:choose>
            <c:when test="${mainModel.kor eq 'false'}">
    <div class=" bannerbox">
      <ul>
        <li id="cf" style="margin:0px 0 0 0px!important"><a href="/product/overview.do"><img class="bottom" src="/images/main/banner01_over.png" alt="netminer Download" /> <img src="/images/main/banner01.png" alt="netminer Download" width="300" height="104" class="top" /></a></li>
        <li id="cf" style="margin:0px 0 0 0px!important;"><a href="/aboutus/publications.do"><img class="bottom" src="/images/main/banner02_over.png" alt="netminer Download" /> <img src="/images/main/banner02.png" alt="Buy NetMiner" width="300" height="104" class="top" /></a></li>
         <li id="cf" style="margin:0px 0 0 0px!important;"><a href="/product/features.do"><img class="bottom" src="/images/main/banner04_over.png" alt="netminer Download" /> <img src="/images/main/banner04.png" alt="Buy NetMiner" width="300" height="104" class="top" /></a></li>
      </ul>
    </div>
    
      </c:when>
		        <c:otherwise>
		         <div class=" bannerbox">
      <ul>
        <li id="cf" style="margin:0px 0 0 0px!important">
        <a href="/product/overview.do">
        <img class="bottom" src="/images/main/banner01_over_K.png" alt="netminer Download" /> 
        <img src="/images/main/banner01_K.png" alt="netminer Download" width="300" height="104" class="top" /></a></li>
        
        <li id="cf" style="margin:0px 0 0 0px!important;">
        <a href="/aboutus/publications.do">
        <img class="bottom" src="/images/main/banner02_over_K.png" alt="netminer Download" />
         <img src="/images/main/banner02_K.png" alt="Buy NetMiner" width="300" height="104" class="top" /></a></li>
         
         <li id="cf" style="margin:0px 0 0 0px!important;">
         <a href="/product/features.do">
         <img class="bottom" src="/images/main/banner04_over_K.png" alt="netminer Download" /> 
         <img src="/images/main/banner04_K.png" alt="Buy NetMiner" width="300" height="104" class="top" /></a></li>
      </ul>
    </div>
		        </c:otherwise>
          </c:choose>
    <!--베너박스//-->
  </div>

  <div id="container03">
    <!--notice-->
    <div class="noticebox" >
      <ul style="padding:15px 0">
        <!--notice contents-->
    
	<c:forEach var="boardModel" items="${noticeList}">
        <div class="noticelist">
          <h1><a href="javascript:view('${boardModel.wr_id}');">${boardModel.wr_subject}</a></h1>
          
          <ul>
          <c:choose>
            <c:when test="${mainModel.kor eq 'true'}">
		          <li style="font-size:13px;">
		            <c:out value="${boardModel.wr_link1}" escapeXml="false"/>
		          </li>
		        </c:when>
		        <c:otherwise>
		          <li>
		            <c:out value="${boardModel.wr_link1}" escapeXml="false"/>
		          </li>
		        </c:otherwise>
          </c:choose>
          
          <!--첨부파일이 있을경우
          <li>
	<c:if test="${not empty boardModel.attachFilePrint}">
		<c:out value = "${boardModel.attachFilePrint}" escapeXml="false"/>
	</c:if>
          </li>
          -->
          <!--//첨부파일이 있을경우-->
          </ul>
          
        </div>
	</c:forEach>
    
        <!--notice contents//-->
      </ul>
    </div>
    <!--notice//-->

  </div>
  <!--//하단컨텐츠-->


</body>
</html>
