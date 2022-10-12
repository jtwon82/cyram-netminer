<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">

		function create() {
			doAjax("adminModel", "/manager/admin/admin-create.do", "<c:out value = '${msg_save}'/>.", "list()");
		}

		function update() {
			doAjax("adminModel", "/manager/admin/admin-update.do", "<c:out value = '${msg_save}'/>", "list()");
		}
		
		function list() {
			var frm = document.getElementById('adminModel');
			frm.action = "/manager/admin/admin-readList.do";
			frm.submit();
		}
	</script>

</head>
	
<body>

    <div class="board_01">

      <!--타이틀--><div class="btitle">관리자</div> <!--//타이틀-->

	<form:form commandName="adminModel" method="post">

    <div class="viewlist" > 
	
     <ul>
      
       <li>
	    <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
           <tr>
             <td style="width:112px;height=28px;" class="mdt15 mdb10"><strong>admin id</strong></td>
             <td  class="mdt15 mdb10"><form:input path="adminid" class="input_w300" /></td>
             </tr>
           <tr>
             <td class="viewline"><strong>admin password</strong></td>
             <td class="viewline"><form:password path="adminpw" class="input_w100" /></td>
             </tr>
           <tr>
             <td class="viewline"><strong>사용 여부</strong></td>
             <td class="viewline"><form:select path="del" items="${adminModel.delList}" itemLabel="text" itemValue="value" /></td>
             </tr>
		</table>
       </li>
       
	    <li class="txtalign" style="float:right">

    <!--게시판버튼-->
	<c:choose>
		<c:when test="${empty adminModel.adminid}">
			<a href="javascript:create();"><img src="/images/sub/btn_board06.gif" /></a>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty adminModel.adminid}">
				<a href="javascript:update();"><img src="/images/sub/btn_board06.gif" /></a>
			</c:if>
		</c:otherwise>
	</c:choose>
		
		<a href="javascript:list()"><img src="/images/sub/btn_board01.gif" /></a>
		
      </li>
    <!--//게시판버튼-->

     </ul>
     </div>
		
	</form:form>
	
    </div>
	
</body>
</html>
