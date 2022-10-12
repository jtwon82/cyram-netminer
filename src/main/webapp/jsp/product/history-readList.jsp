<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
	
<body>
	
  <!--하단컨텐츠-->
  <div id="container02" >
    
  
    <div class="submain" >
             <img src="/images/sub/contitle09.gif" alt="history" />
     <div class="viewth" > 
     
	<form:form commandName="boardModel" action="/product/history-readList.do">
		<form:hidden path="pageNo" />
	</form:form>

     <ul>
     
     
       <!--반복-->
	<c:forEach var="boardModel" items="${list}">
	
      <li>
      
      <h1>${boardModel.wr_subject}</h1>
<%--       <h3><strong>${boardModel.wr_last}</strong></h3> --%>
      
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td>
      
			<c:out value = "${boardModel.wr_content}" escapeXml="false"/>
			
	         </td>
		  </tr>
		</table>
      
	 </li>
      
	</c:forEach>
       <!--//반복-->
       
     
     </ul>
    </div>
    
     <div class="viewsearch02" > 
		<c:out value = "${moveLinkPageScript}" escapeXml="false"/>
		<c:out value = "${moveLinkPagePrint}" escapeXml="false"/>
     </div>
    </div>
    
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
