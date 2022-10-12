<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">

	$(document).ready(function() {
		<c:forEach var="commentModel" items="${boardModel.commentList}" varStatus="status">
		
			$("#comment_delete_modal<c:out value="${status.index}"/>").mousedown(function(event) {
				delete_comment('<c:out value="${commentModel.wr_comment}" />');
			});
		
		</c:forEach>
	});


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
			doAjax("boardModel", "/manager/qna/qna-create.do", "<c:out value = '${msg_save}'/>.", "list_init()");
		}
	}

	function update() {
		if(checkVal()) {
			doAjax("boardModel", "/manager/qna/qna-update.do", "<c:out value = '${msg_save}'/>", "list()");
		}
	}
	
	function del() {
		doAjax("boardModel", "/manager/qna/qna-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
	}
	
	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('boardModel');
		frm.action = "/manager/qna/qna-readList.do";
		frm.submit();
	}
	
	function delete_comment(wr_comment) {
		if(wr_comment == '') {
			return;
		}
		
		if(confirm('<c:out value = '${msg_delete_confirm}'/>?')) {
			$("#wr_comment").val(wr_comment);
			doAjax("boardModel", "/manager/qna/qna_comment-delete.do", "<c:out value = '${msg_delete}'/>", "fn_reload()");
		}
	}

	</script>

</head>
	
<body>
	
    <div class="board_01">

      <!--타이틀--><div class="btitle">QnA</div> <!--//타이틀-->

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
             <td class="viewline" style="width:100px;"><strong>wr_subject</strong></td>
             <td class="viewline"><form:input path="wr_subject" class="input_w300" /></td>
             </tr>

           <tr>
             <td class="viewline"><strong>file</strong>
                <c:out value = "${attachFileButton}" escapeXml="false"/>
             </td>
             <td class="viewline">
					<c:out value = "${attachFileScript}" escapeXml="false"/>
					<c:if test="${not empty attachFilePrint}">
						<c:out value = "${attachFilePrint}" escapeXml="false"/>
					</c:if>
			</td>
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

    <!--코멘트부분-->
    <div class="viewcomment mdl10 mdb10" >

       <ul>
         <li>
            <!--코멘트라인-->
			<c:forEach var="commentModel" items="${boardModel.commentList}" varStatus="status">

	<c:choose>
		<c:when test="${status.index == 0}">
           <dl>
		</c:when>
		<c:otherwise>
           <dl class="viewline02">
		</c:otherwise>
	</c:choose>
	
             <dt></dt>
             <dt>${commentModel.mb_id}</dt>
             <dt class="font12">${commentModel.wr_datetime} </dt>
             <dt><span id="comment_delete_modal<c:out value="${status.index}"/>" style="cursor:pointer"> delete </span>
             </dt>
           <dl class="md10">
            <dt >
				<c:out value = "${commentModel.wr_content_view}" escapeXml="false"/>
            </dt>
           </dl>
           
			</c:forEach>
            <!--//코멘트라인-->

         </li>
       </ul>
     </div>
    <!--//코멘트부분--> 

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
