<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">

	function checkVal() {
		if($("#wr_subject").val() == '') {
			alert("Enter the Title.");
			$("#wr_subject").focus();
			return false;
		}
		
		if($("#wr_content").val() == '') {
			alert("Enter the Content.");
			$("#wr_content").focus();
			return false;
		}
		
		return true;
	}

	function create() {
		if(checkVal()) {
			doAjax("boardModel", "/manager/faq/faq-create.do", "<c:out value = '${msg_save}'/>.", "list_init()");
		}
	}

	function update() {
		if(checkVal()) {
			doAjax("boardModel", "/manager/faq/faq-update.do", "<c:out value = '${msg_save}'/>", "list()");
		}
	}
	
	function del() {
		doAjax("boardModel", "/manager/faq/faq-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
	}
	
	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('boardModel');
		frm.action = "/manager/faq/faq-readList.do";
		frm.submit();
	}
	
	</script>

</head>
	
<body>
	
    <div class="board_01">

      <!--타이틀--><div class="btitle">FAQ</div> <!--//타이틀-->

	<form:form commandName="boardModel" method="post" enctype="multipart/form-data">
		<form:hidden path="pageNo" />
		<form:hidden path="searchKind" />
		<form:hidden path="searchWord" />
		<form:hidden path="wr_id" />
		<form:hidden path="wr_parent" />
		<form:hidden path="bn_id" />
		<form:hidden path="wr_comment" />

    <div class="viewsearch mdl10" > 
	
     <ul>
      
       <li>
         <table width="610" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td class="viewline"  style="width:100px;"><strong>Category</strong></td>
             <td style="width:702px;" class="mdt15 mdb10"><form:select path="ca_name" items="${boardModel.ca_nameList}" itemLabel="text" itemValue="value" class="input_w280" style="height:20px!important" alt="Category"/></td>
             </tr>
           <tr>
             <td class="viewline" style="width:100px;"><strong>Title</strong></td>
             <td class="viewline"><form:input path="wr_subject" class="input_w600" /></td>
             </tr>

		</table>
       </li>
     </ul>
     </div>

     <!--게시글 textarea 부분-->
    <div class="viewwrite mdl10 mdb10" > 
     <ul>
    <li>
     <form:textarea path="wr_content" class="txt_w590"/>
    </li>
    
     </ul>
    </div>
    <!--//게시글 textarea 부분-->

    <!--게시판버튼-->
    <div class="viewsearch03 mdl10 mdt10" > 
     <ul>
      <li style="float:right">
	<c:choose>
		<c:when test="${empty boardModel.wr_id || boardModel.wr_id eq '0'}">
			<a href="javascript:create();"><img src="/images/sub/btn_board06.gif" /></a>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty boardModel.sessionAdminId}">
				<a href="javascript:update();"><img src="/images/sub/btn_board06.gif" /></a>
				<a href="javascript:del();"><img src="/images/sub/btn_board04.gif" /></a>
			</c:if>
		</c:otherwise>
	</c:choose>
		
		<a href="javascript:list()"><img src="/images/sub/btn_board01.gif" /></a>
		
      </li>
     </ul>
    </div>
    <!--//게시판버튼-->

	</form:form>

    </div>
	
</body>
</html>
