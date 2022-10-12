<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">
		
		function search() {
			document.getElementById('pageNo').value = 0;
			document.getElementById('boardModel').submit();
		}
		
		function view(wr_id) {
			document.getElementById('wr_id').value = wr_id;
			
			var frm = document.getElementById('boardModel');
			frm.action = "/manager/appstore/appstore-read.do";
			frm.submit();
		}
		
	</script>

</head>
	
<body>
	
    <div class="board_01">

      <!--타이틀--><div class="btitle">Appstore</div> <!--//타이틀-->

	<form:form commandName="boardModel" action="/manager/appstore/appstore-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="wr_id" />

     <div class="viewsearch  mdl10" > 
     <ul>
       <li class="mdt10 mdl10"><form:select path="searchKind" items="${boardModel.selectBoxModelList}" itemLabel="text" itemValue="value" />
         <form:input path="searchWord" class="input_w300" /><div class="btn_search"><a href="javascript:search();">SEARCH</a></div>
       </li>
     </ul>
     </div>
	
    <div class="viewlist mdt10 mdl10">
    <table  border="0" cellspacing="0" cellpadding="0" class="buss_tb">
  <tr>
    <th style="width:50px">id</th>
    <th style="width:150px">Category</th>
    <th >Title</th>
    <th style="width:100px">mb_id</th>
    <th style="width:150px">wr_name</th>
    <th style="width:100px">Date</th>
    </tr>

			<c:forEach var="boardModel" items="${list}">
				<tr>
					<td>${boardModel.wr_id}</td>
					<td>${boardModel.ca_name}</td>
					<td align="left">
						<a href="javascript:view('${boardModel.wr_id}');">${boardModel.wr_subject}</a>
						<c:if test="${boardModel.wr_comment != 0}">
						(${boardModel.wr_comment})
						</c:if>
					</td>
					<td>${boardModel.mb_id}</td>
					<td>${boardModel.wr_name}</td>
					<td>${boardModel.wr_last}</td>
				</tr>
			</c:forEach>

		</table>

		 <ul>
         <li style="float:right" class="mdt10 mdr6"><a href="javascript:view('0');"><img src="/images/sub/btn_board02.gif" alt="Write"/></a></li>
        </ul>
    </div>
		
		<c:out value = "${moveLinkPageScript}" escapeXml="false"/>
		<c:out value = "${moveLinkPagePrint}" escapeXml="false"/>
		
	</form:form>

    </div>

</body>
</html>
