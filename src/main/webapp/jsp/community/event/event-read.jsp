<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>

	<script type="text/javaScript">
	function checkVal() {
		if($("#wr_subject").val() == '') {
			alert("Enter the Title.");
			$("#wr_subject").focus();
			return false;
		}
		
		<c:if test="${boardModel.login ne true}">
		if($("#mb_id").val() == '') {
			alert("Enter the Author.");
			$("#mb_id").focus();
			return false;
		}
		
		if($("#wr_password").val() == '') {
			alert("Enter the Password.");
			$("#wr_password").focus();
			return false;
		}
		</c:if>
		
		if($("#wr_content").val() == '') {
			alert("Enter the Content.");
			$("#wr_content").focus();
			return false;
		}
		
		return true;
	}
	
	function create() {
		if(checkVal()) {
			doAjax("boardModel", "/community/event/event-create.do", "<c:out value = '${msg_save}'/>", "list_init()");
		}
	}
	
	function update() {
		if(checkVal()) {
			doAjax("boardModel", "/community/event/event-update.do", "<c:out value = '${msg_save}'/>", "list()");
		}
	}
	
	function del() {
		if(confirm("<c:out value = '${msg_delete_confirm}'/>")) {
			doAjax("boardModel", "/community/event/event-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
		}
	}
	
	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('boardModel');
		frm.action = "/community/event/event-readList.do";
		frm.submit();
	}
	
	function view() {
		var frm = document.getElementById('boardModel');
		frm.action = "/community/event/event-view.do";
		frm.submit();
	}
	</script>

</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >

	<form:form commandName="boardModel" method="post" enctype="multipart/form-data">
		<form:hidden path="pageNo" />
		<form:hidden path="searchKind" />
		<form:hidden path="searchWord" />
		<form:hidden path="wr_comment" />
		<form:hidden path="wr_id" />

    <div class="submain" >
             <img src="/images/sub/mers2.png" alt="MERS" />
     <div class="viewsearch" > 
     <ul>
      
       <li>
         <table width="814" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td style="width:112px;height:28px;" class="mdt15 mdb10"><strong>Title</strong></td>
             <td style="width:702px;" class="mdt15 mdb10"><form:input path="wr_subject" class="input_w300"/></td>
             </tr>

           <tr>
             <td class="viewline">
             	<strong>
             		file <c:out value = "${attachFileButton}" escapeXml="false"/>
             	</strong>
             </td>
             <td class="viewline">
				<c:out value = "${attachFileScript}" escapeXml="false"/>
             </td>
           </tr>

		<c:if test="${not empty attachFilePrint}">
           <tr>
             <td class="viewline"></td>
             <td class="viewline">
				<c:out value = "${attachFilePrint}" escapeXml="false"/>
             </td>
           </tr>
		</c:if>
           
         </table>
       </li>
     </ul>
     </div>
<!--      게시글 textarea 부분 -->
<!--     <div class="viewwrite" >  -->
<!--      <ul> -->
<!--     <li> -->
<%--     	<form:textarea path="wr_content"  class="txt_w800"/> --%>
<!--     </li> -->
<!--      </ul> -->
<!--     </div> -->
<!--     //게시글 textarea 부분 -->

    <!--게시판버튼-->
    <div class="viewsearch03" > 
     <ul>
      <li>

	<c:choose>
		<c:when test="${empty boardModel.wr_id || boardModel.wr_id eq '0'}">
			<a href="javascript:create();"> <img src="/images/sub/btn_board06.gif" alt="save" /> </a>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty boardModel.mb_id && boardModel.mb_id eq boardModel.sessionId}">
				<a href="javascript:update();"> <img src="/images/sub/btn_board06.gif" alt="save" /> </a>
	   			<a href="javascript:del();"><img src="/images/sub/btn_board04.gif" alt="delete" /></a>  
			</c:if>
		</c:otherwise>
	</c:choose>

		<a href="javascript:list()"><img src="/images/sub/btn_board01.gif" alt="list" /></a>
      </li>
     </ul>
    </div>
    <!--//게시판버튼-->
    
    
    </div>
    
	</form:form>
	
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
