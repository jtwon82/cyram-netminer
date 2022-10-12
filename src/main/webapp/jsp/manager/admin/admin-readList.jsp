<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">
		
		function view(adminid) {
			document.getElementById('adminid').value = adminid;
			
			var frm = document.getElementById('adminModel');
			frm.action = "/manager/admin/admin-read.do";
			frm.submit();
		}
		
	</script>

</head>
	
<body>
	
    <div class="board_01">

      <!--타이틀--><div class="btitle">관리자</div> <!--//타이틀-->
    
	<form:form commandName="adminModel" action="/admin/admin-readList.do">
		<form:hidden path="adminid" />

     <div class="viewsearch  mdl10" > 
     </div>
    <div class="viewlist mdt10 mdl10">
    <table  border="0" cellspacing="0" cellpadding="0" class="buss_tb">

	<tr>
	    <th>ID</th>
	    <th>Name</th>
	    <th>Date</th>
    </tr>
    
	<c:forEach var="adminModel" items="${list}">
		<tr>
			<td><a href="javascript:view('${adminModel.adminid}');">${adminModel.adminid}</a></td>
			<td><a href="javascript:view('${adminModel.adminid}');">${adminModel.adminname}</a></td>
			<td>${adminModel.reg_date}</td>
		</tr>
	</c:forEach>
		
</table>
		 <ul>
         <li style="float:right" class="mdt10 mdr6"><a href="javascript:view('');"><img src="/images/sub/btn_board02.gif" alt="Write"/></a></li>
        </ul>
    </div>
    
	</form:form>

    </div>


</body>
</html>
