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
			frm.action = "/community/qna/qna-view.do";
			frm.submit();
		}
		
		function read() {
			document.getElementById('wr_id').value = '0';
			
			var frm = document.getElementById('boardModel');
			frm.action = "/community/qna/qna-read.do";
			frm.submit();
		}
		function list() {
			var frm = document.getElementById('boardModel');
			frm.action = "/community/qna/qna-readList.do";
			frm.submit();
		}
		function search2(ca_name) {
		
			$("#searchWord").val("");
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
	
	</script>

</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    
    <div class="submain" >
             <img src="/images/sub/contitle05.gif" alt="Q&A" />
     <div class="viewsearch" > 
     <ul>
       <li>
	
	<form:form commandName="boardModel" action="/community/qna/qna-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="wr_id" />
       	<form:select path="searchKind" items="${boardModel.selectBoxModelList}" itemLabel="text" itemValue="value" class="select_w200"/>
       	<form:input id="searchWord" path="searchWord" class="input_w300" />
       	<div class="btn_search"><a href="javascript:search();">SEARCH</a></div>
	</form:form>

       </li>
     </ul>
     </div>
     
     
    <div class="buybox">
    
	<table  border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
	  <tr>
	    <th style="width:74px;">No</th>
	    <th style="width:303px;">Subject</th>
	    <th style="width:123px;">Author</th>
	    <th style="width:116px;">Date</th>
      </tr>
      
	<c:if test="${fn:length(list) <= 0}">
		<tr>
			<td colspan="4">There are no results.</td>
		</tr>
	</c:if>
	    
	<c:forEach var="boardModel" items="${list}">
		<tr>
	    <td>${boardModel.wr_id}</td>
	    <td>
			<a href="javascript:view('${boardModel.wr_id}');">${boardModel.wr_subject}</a>
			<c:if test="${boardModel.wr_comment != 0}">
			(${boardModel.wr_comment})
			</c:if>
		</td>
	    <td>${boardModel.mb_id}</td>
	    <td>${boardModel.wr_last}</td>
		</tr>
	</c:forEach>
	</table>

    </div>
    
     <div class="viewsearch02" > 
		<c:out value = "${moveLinkPageScript}" escapeXml="false"/>
		<c:out value = "${moveLinkPagePrint}" escapeXml="false"/>
     </div>

<!--게시판버튼-->
    <div class="viewsearch03" > 
     <ul>
      <li>

	
<%-- 	<c:if test="${boardModel.login eq true}"> --%>
<!-- 		<a href="javascript:read();"><img src="/images/sub/btn_board02.gif" alt="write" /></a> -->
<%-- 	</c:if> --%>
	
	
			<c:choose>
				<c:when test="${boardModel.login eq 'true'}">
				 	<a href="javascript:read();"><img src="/images/sub/btn_board02.gif" alt="write" /></a>
				</c:when>
				<c:otherwise>
			      	
			      	<a href="javascript:d_login_move();"><img src="/images/sub/btn_board02.gif" alt="write" /></a>
				</c:otherwise>
			</c:choose>
	
<!-- 	<a href="javascript:read2();"><img src="/images/sub/btn_board02.gif" alt="write" /></a> -->
	<a href="javascript:search2();"><img src="/images/sub/btn_board01.gif" alt="list" /></a> 
	  </li>
     </ul>
    </div>
    <!--//게시판버튼-->
     
    </div>
    
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
