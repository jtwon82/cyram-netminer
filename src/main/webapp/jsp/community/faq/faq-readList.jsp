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
		

		function search(ca_name) {
			var kor = $("#kor").val();
// 			alert(kor);
// 			if (kor == "false") {
// 				if (ca_name != '') {
// 					document.getElementById('searchCa_name').value = ca_name;
// 				}
// 			} else {
// 				if (ca_name2 != '') {
// 					document.getElementById('searchCa_name').value = ca_name2;
// 				}
// 			}

				if (ca_name != '') {
					document.getElementById('searchCa_name').value = ca_name;
				}
			
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
		function search2(ca_name) {
			var kor = $("#kor").val();

			$("#searchWord").val("");
			
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}

		function view(wr_id) {
			document.getElementById('wr_id').value = wr_id;

			var frm = document.getElementById('boardModel');
			frm.action = "/community/faq/faq-view.do";
			frm.submit();
		}

		function read() {
			document.getElementById('wr_id').value = '0';

			var frm = document.getElementById('boardModel');
			frm.action = "/community/faq/faq-read.do";
			frm.submit();
		}

		var old_i; // 전에 클릭했던 글의 번호값 저장 

		function view(i) { // 답변 표시여부 조정하는 js함수

			if (old_i == i) {
				var mode = document.getElementById('tr_content_' + i).style.display;

				if (mode == 'table-row') {
					document.getElementById('tr_content_' + i).style.display = 'none';
				} else {
					document.getElementById('tr_content_' + i).style.display = 'table-row';
				}
			} else {
				if (old_i) {
					document.getElementById('tr_content_' + old_i).style.display = 'none';
				}
				document.getElementById('tr_content_' + i).style.display = 'table-row';
			}
			old_i = i;
		}
	</script>

</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    
    <div class="submain" >
             <img src="/images/sub/contitle06.gif" alt="FAQ" />
    <c:choose>
      <c:when test="${boardModel.kor eq 'true'}">
        <div>
          <ul>
            <li class="mdt10">NetMiner와 관련된 문의사항에 대한 답변을 미리 확인하실 수 있습니다. </li>
          </ul>
        </div>
      </c:when>
    </c:choose>
     <div class="viewsearch" > 
     <ul>
       <li>
	
	<form:form commandName="boardModel" action="/community/faq/faq-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="wr_id" />
		<form:hidden path="searchCa_name" />
       	<form:hidden path="searchKind" value="wr_subject+wr_content"/>
		<form:hidden path="kor" />
       	<form:input path="searchWord" class="input_w300"/>
       	<div class="btn_search"><a href="javascript:search('','');">SEARCH</a></div>
	</form:form>

       </li>
     </ul>
     </div>
     
     
     <div class="viewtab">
       <ul>

	<c:choose>
		<c:when test="${boardModel.searchCa_name eq '' || boardModel.searchCa_name eq 'ALL'}">
			<li class="mdl1">All</li>
		</c:when>
		<c:otherwise>
			<li id="mouseout" class="mdl1"><a href="javascript:search('ALL');">All</a></li>
		</c:otherwise>
	</c:choose>
	

	<c:choose>
		<c:when test="${boardModel.searchCa_name eq 'Order/Delivery'}">
			<li class="mdl1">Order/Delivery</li>
		</c:when>
		<c:otherwise>
			<li id="mouseout" class="mdl1"><a href="javascript:search('Order/Delivery');">Order/Delivery</a></li>
		</c:otherwise>
	</c:choose>

	
	<c:choose>
		<c:when test="${boardModel.searchCa_name eq 'License'}">
			<li class="mdl1">License</li>
		</c:when>
		<c:otherwise>
			<li id="mouseout" class="mdl1"><a href="javascript:search('License');">License</a></li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${boardModel.searchCa_name eq 'Student License'}">
			<li class="mdl1">Student License</li>
		</c:when>
		<c:otherwise>
			<li id="mouseout" class="mdl1"><a href="javascript:search('Student License');">Student License</a></li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${boardModel.searchCa_name eq 'Discount Program'}">
			<li class="mdl1">Discount Program</li>
		</c:when>
		<c:otherwise>
			<li id="mouseout" class="mdl1"><a href="javascript:search('Discount Program');">Discount Program</a></li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${boardModel.searchCa_name eq 'Error/Issue'}">
			<li class="mdl1">Error/Issue</li>
		</c:when>
		<c:otherwise>
			<li id="mouseout" class="mdl1"><a href="javascript:search('Error/Issue');">Error/Issue</a></li>
		</c:otherwise>
	</c:choose>
	
       </ul>
     </div>
    <div class="buybox">
    <table  border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
    
    <c:if test="${list eq null || fn:length(list) <= 0}">
		<tr>
			<td>There are no results.</td>
		</tr>
	</c:if>
    
	<c:forEach var="boardModel" items="${list}">
  <tr>
    <td style="width:30px;"><strong>Q</strong></td>
    <td >
<%-- <c:out value="${kor}"/> --%>
<%-- <c:choose> --%>
<%-- 	<c:when test="${boardModel.kor eq true }"> --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${boardModel.ca_name eq 'Order/Delivery'}"> --%>
<!-- 		      <strong>[주문/배송]</strong> -->
<%-- 			</c:when> --%>
<%-- 			<c:when test="${boardModel.ca_name eq 'License'}"> --%>
<!-- 		      <strong>[라이선스]</strong> -->
<%-- 			</c:when> --%>
<%-- 			<c:when test="${boardModel.ca_name eq 'Student License'}"> --%>
<!-- 		      <strong>[Strudent 라이선스]</strong> -->
<%-- 			</c:when> --%>
<%-- 			<c:when test="${boardModel.ca_name eq 'Discount Program'}"> --%>
<!-- 		      <strong>[할인]</strong> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 		     <strong>[오류/기타]</strong> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<%-- 	    <strong>[<c:out value = "${boardModel.ca_name}"/>]</strong>  --%>
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>

<strong>[<c:out value = "${boardModel.ca_name}"/>]</strong> 
    
    <a href="javascript:view('<c:out value = "${boardModel.wr_id}"/>');"><c:out value = "${boardModel.wr_subject}"/></a>
    </td>
    </tr>
  <!--//질문일경우-->
   <!--답변일경우-->   
  <tr id='tr_content_<c:out value = "${boardModel.wr_id}"/>' style="display:none;">
    <td class="btilineefef">&nbsp;</td>
    <td class="btilineefef"><c:out value = "${boardModel.wr_content}" escapeXml="false"/></td>
    </tr>
       <!--//답변일경우-->   
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
