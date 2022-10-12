<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
	
<body>

<form:form commandName="topModel">
	<form:hidden path="lang" />
</form:form>

<!-- Layout : theader Start -->
<div id="theader">
   <div class="topcenter">
   <ul>
   <li><a href="javascript:top_Home();"><img src="/images/main/h_top01.png" alt="netminer" /></a></li>
   <li>
     <c:choose>
	     <c:when test="${ topModel.kor eq 'false' }">
	       <a href="http://www.cyram.com/en/" target="_blank">
	         <img src="/images/main/h_top02.png" alt="cyram" />
	       </a>
	     </c:when>
	     <c:otherwise>
         <a href="http://www.cyram.com/" target="_blank">
           <img src="/images/main/h_top02.png" alt="cyram" />
         </a>
	     </c:otherwise>
     </c:choose>   
     </li>
     
     <c:if test="${ topModel.kor eq 'true' }">
    <li><a href="https://onlineedu.cyram.com" target="_blank"><img src="/images/main/h_top03.png" alt="edu" /></a></li> 
    <li><a href="http://cyram.tistory.com" target="_blank"><img src="/images/main/h_top04.png" alt="blog" /></a></li> 
    </c:if>
  </ul>
   </div>
   <span class="topleft">
<c:choose>
	<c:when test="${ topModel.kor eq 'false' }">
      <a href="javascript:top_setKorByAjax('true');">
      	<img src="/images/main/h_kor.png" alt="korean" />
      </a>
	</c:when>
	<c:otherwise>
      <a href="javascript:top_setKorByAjax('false');">
      	<img src="/images/main/h_eng.png" alt="english" />
      </a>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${ topModel.login eq 'false' }">
      &nbsp;<a href="/login/login-read.do"><img src="/images/main/h_left01.png" alt="login" class="mdt2"/></a>
      &nbsp;<a href="/nmuser-read.do"><img src="/images/main/h_left02.png" class="mdt2"/></a>
	</c:when>
	<c:otherwise>
      &nbsp;<a href="/nmuser-read.do" class="font12  mdb3"><c:out value="${ topModel.sessionId }" /></a>
      &nbsp;<a href="/buy-readList.do"><img src="/images/main/h_left05.png" class="mdt2"/></a>
      &nbsp;<a href="javascript:top_logout();"><img src="/images/main/h_left03.png" alt="logout" class="mdt2"/></a>
	</c:otherwise>
</c:choose>

   </span>
  </div>
<!--// Layout : theader Start -->

  <!-- Layout : header Start -->
  <div id="header">
    <h1 class="logo"><a href="javascript:top_Home();"><img src="/images/logo.gif" alt="NetMiner" /></a></h1>
    <div id="gnb" class="gnbWrap">
      <ul class="gnb">
        <li class="g2"> <strong><a href="/product/overview.do"><img src="/images/main/menu01.png" alt="Product" /></a></strong>
          <ul class="dep2" style="width:200px; float:left; height:180px; width:142px">
            <!--<h1>Overview</h1>-->
            <li class="l1 mdt15" ><a href="/product/overview.do">NetMiner</a></li>
            <li class="l2 mdt15" ><a href="/product/features.do">Features</a></li>
            <li class="l3 mdt15" ><a href="/product/extensions.do">Extensions</a></li>
            
<!--            <li class="l4 mdt15" ><a href="/product/package01.do">Edition&amp;Package</a></li> -->
            
            <li class="l5 mdt15" ><a href="/product/demo.do">Demo</a></li>
            <li class="l6 mdt15" ><a href="/product/gallery.do">Gallery</a></li>
            <li class="l7 mdt15" ><a href="/product/systemrequirement.do">Requirement</a></li>
            <li class="l8 mdt15" ><a href="/product/scalability_performance.do">Scalability</a></li>
            <li class="l9 mdt15" ><a href="/product/history-readList.do">History</a></li>
          </ul>
        </li>
        <li class="g3"> <strong><a href="/download_buy/buy/buy-view.do"><img src="/images/main/menu02.png" alt="Buy & Download" /></a></strong>
          <ul class="dep2" style="margin-left:15px;">
            <li class="l1 mdt15"><a href="/download_buy/buy/buy-view.do">Buy</a></li>
            <li class="l2 mdt15"><a href="/download_buy/download/download-readList.do">Download</a></li>
            <li class="l3 mdt15"><a href="/download_buy/appstore/appstore-readList.do">Appstore</a></li>
			<!--             
            <li class="l4 mdt15"><a href="/download_buy/license_price/license_price.do">License</a></li>
            <li class="l5" style="margin-top:-0px;"><a href="/download_buy/license_price/license_price.do"><img src="/images/main/menu_sub01.png" alt="license"/></a></li>
            <li class="l6 "style="margin-top:-5px;"><a href="/product/package01.do"><img src="/images/main/menu_sub10.png" alt="license"/></a></li>
             -->
			<li class="l7 mdt15"><a href="/download_buy/partner/partner-read.do">Partner</a></li>
                    
          </ul>
        </li>
        
        
<!--    게시판 ㄴ

	     <li class="g4"> <strong><a href="/community/faq/faq-readList.do"><img src="/images/main/menu03.png" alt="Community" /></a></strong>
          <ul class="dep2">
            <li class="l1 mdt15"><a href="/community/faq/faq-readList.do">FAQ</a></li>
            <li class="l2 mdt15"><a href="/community/qna/qna-readList.do">Q&amp;A</a></li>
          </ul>
        </li> -->
        <li class="g4"> <strong><a href="/community/faq/faq-readList.do"><img src="/images/main/menu05.png" alt="Support" /></a></strong>
          <ul class="dep2">
<!--             <li class="l1 mdt15"><a href="/aboutus/notice/notice-readList.do">Notice</a></li> -->
            <li class="l1 mdt15"><a href="/community/faq/faq-readList.do">FAQ</a></li>
            <li class="l2 mdt15"><a href="/community/qna/qna-readList.do">Q&amp;A</a></li>
            <li class="l2 mdt15"><a href="/aboutus/publications.do">Publications</a></li>
            <li class="l3" style="margin-top:-0px;"><a href="/aboutus/publications.do#brochure"><img src="/images/main/menu_sub03.png" alt="Brochure"/></a></li>
             <li class="l3 "style="margin-top:-5px;"><a href="/aboutus/publications.do#whitePaper"><img src="/images/main/menu_sub04.png" alt="White Paper"/></a></li>
              <li class="l3" style="margin-top:-5px;"><a href="/aboutus/publications.do#casestudy"><img src="/images/main/menu_sub05.png" alt="Case study"/></a></li>
             <li class="l3 "style="margin-top:-5px;"><a href="/aboutus/publications.do#manual"><img src="/images/main/menu_sub06.png" alt="Manual"/></a></li>
            <li class="l2 mdt15"><a href="/aboutus/service.do">Services</a></li>

<c:choose>
	<c:when test="${ topModel.kor eq 'false' }">
            <li class="l3" style="margin-top:-0px;"><a href="/aboutus/service.do#technicalsupport"><img src="/images/main/menu_sub07.png" alt="Technical Support"/></a></li>
	</c:when>
	<c:otherwise>
            <li class="l3" style="margin-top:-0px;"><a href="/aboutus/service.do#technicalsupport"><img src="/images/main/menu_sub07.png" alt="Technical Support"/></a></li>
             <li class="l3 "style="margin-top:-5px;"><a href="/aboutus/service.do#education"><img src="/images/main/menu_sub08.png" alt="Training Service"/></a></li>
              <li class="l3" style="margin-top:-5px;"><a href="/aboutus/service.do#paperconsultingservice"><img src="/images/main/menu_sub09.png" alt="Research Consulting Service"/></a></li>	</c:otherwise>
</c:choose>

<!--             <li class="l2 mdt15"><a href="/aboutus/aboutus.do">Contact us</a></li> -->
          </ul>
        </li>
        
        <li class="g5"> <strong><a href="/aboutus/notice/notice-readList.do"><img src="/images/main/menu03.png" alt="Community" /></a></strong>
          <ul class="dep2">
            <li class="l1 mdt15"><a href="/aboutus/notice/notice-readList.do">Notice</a></li>
            <li class="l2 mdt15"><a href="/community/forum/forum-readList.do">SNA Forum</a></li>
            <li class="l3 mdt15"><a href="/aboutus/aboutus.do">About us</a></li>
             <li class="l3 mdt15"><a href="/community/event/event-readList.do">MERS Data</a></li>
<!--             <li class="l1 mdt15"><a href="/community/faq/faq-readList.do">FAQ</a></li>
            <li class="l2 mdt15"><a href="/community/qna/qna-readList.do">Q&amp;A</a></li> -->
          </ul>
        </li>
      </ul>
      
    </div>
  </div>
  <!-- //Layout : header Start -->

</body>
</html>
