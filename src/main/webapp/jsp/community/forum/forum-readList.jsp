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
$(document).ready(function() {
		
		location2=document.location +"?wr_id="+ $("#wr_id").val();
		
		$("#link").text(location2);
		
		if($("#wr_id").val() == '' || $("#wr_id").val() == '0') {
			list();
		}	
	});
	
	
		function search() {
			
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
// 			alert("dddddddd"+document.getElementById('boardModel'));
		}
		
		function view(wr_id) {
			document.getElementById('wr_id').value = wr_id;
			
			var frm = document.getElementById('boardModel');
			frm.action = "/community/forum/forum-view.do";
// 			location.href = "/community/forum/forum-view.jsp";
			frm.submit();
			
// 			&ID="+ID
		}
		
		function read() {
			document.getElementById('wr_id').value = '0';
			
			var frm = document.getElementById('boardModel');
			frm.action = "/community/forum/forum-read.do";
			frm.submit();
		}
		function search2(ca_name) {
			
			$("#searchWord").val("");
			$("#searchCa_name").val("ALL");
			
			
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
		
	</script>

</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    
    <div class="submain" >
             <img src="/images/sub/contitle31.png" alt="forum" />
    <c:choose>
      <c:when test="${boardModel.kor eq 'true'}">
        <div>
          <ul>
            <li class="mdt10">SNA와 관련된 최신 소식, 컨퍼런스 및 이벤트, 관련 논문 등을 소개해 주세요.</li>
          </ul>
        </div>
      </c:when>
    </c:choose>
             
     <div class="viewsearch" > 
     <ul>
       <li>
	
	<form:form commandName="boardModel" action="/community/forum/forum-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="wr_id" />
		<form:select id="searchCa_name" path="searchCa_name" items="${boardModel.ca_nameSearchList}" itemLabel="text" itemValue="value" class="select_w200"/>
       	<form:select path="searchKind" items="${boardModel.selectBoxModelList}" itemLabel="text" itemValue="value" class="select_w200"/>
       	<form:input id="searchWord" path="searchWord" class="input_w300"/>
       	<div class="btn_search"><a href="javascript:search();">SEARCH</a></div>
	</form:form>

       </li>
     </ul>
     </div>
     
     
    <div class="buybox">
    
	<table  border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
	  <tr>
	    <th style="width:50px;">No</th>
	    <th style="width:110px;">Category</th>
	    <th style="width:265px;">Subject</th>
	    <th style="width:95px;">Author</th>
	    <th style="width:96px;">Date</th>
      </tr>
      
	<c:if test="${list eq null || fn:length(list) <= 0}">
		<tr>
			<td colspan="4">There are no results.</td>
		</tr>
	</c:if>
	    
	<c:forEach var="boardModel" items="${list}">
		<tr>
	    <td>${boardModel.wr_id}</td>
	    <td>${boardModel.ca_name}</td>
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
