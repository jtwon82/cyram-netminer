<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>

	<script type="text/javaScript">
		
		function search() {
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
		
		function view(wr_id) {
			document.getElementById('wr_id').value = wr_id;
			
			var frm = document.getElementById('boardModel');
			frm.action = "/aboutus/notice/notice-view.do";
			frm.submit();
		}
		
		function read() {
			document.getElementById('wr_id').value = '0';
			
			var frm = document.getElementById('boardModel');
			frm.action = "/aboutus/notice/notice-read.do";
			frm.submit();
		}
		
	</script>

</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    
    <div class="submain" >
             <img src="/images/sub/contitle28.gif" alt="Notice" />
    <c:choose>
      <c:when test="${boardModel.kor eq 'true'}">
        <div>
          <ul>
            <li class="mdt10">NetMiner에 대한 뉴스를 확인하실 수 있습니다. </li>
          </ul>
        </div>
      </c:when>
    </c:choose>
             
     <div class="viewsearch" > 
     <ul>
       <li>
	
	<form:form commandName="boardModel" action="/aboutus/notice/notice-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="wr_id" />
       	<form:select path="searchKind" items="${boardModel.selectBoxModelList}" itemLabel="text" itemValue="value" class="select_w200"/>
       	<form:input path="searchWord" class="input_w300"/>
       	<div class="btn_search"><a href="javascript:search();">SEARCH</a></div>
	</form:form>

       </li>
     </ul>
     </div>
     
     
    <div class="buybox">
    
	<table  border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
	  <tr>
	    <th style="width:60px;">No</th>
	    <th>Subject</th>
	    <th style="width:130px;">Author</th>
	    <th style="width:110px;">Date</th>
      </tr>
      
	<c:if test="${fn:length(list) <= 0}">
		<tr>
			<td colspan="4">There are no results.</td>
		</tr>
	</c:if>
	    
	<c:forEach var="boardModel" items="${list}">
		<tr>
	    <td align="center">${boardModel.wr_id}</td>
	    <td align="left">
			<a href="javascript:view('${boardModel.wr_id}');">${boardModel.wr_subject}</a>
			<c:if test="${boardModel.wr_comment != 0}">
			(${boardModel.wr_comment})
			</c:if>
		</td>
	    <td align="center">${boardModel.wr_name}</td>
	    <td align="center">${boardModel.wr_last}</td>
		</tr>
	</c:forEach>
	</table>

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
