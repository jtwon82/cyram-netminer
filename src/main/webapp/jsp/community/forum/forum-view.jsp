<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">
	var location1=null;

	
	$(document).ready(function() {
	
		
		if($("#wr_id").val() == '' || $("#wr_id").val() == '0') {
			list();
		}	
	});

	function checkVal() {
		if($("#comment_wr_content").val() == '') {
			alert("Enter the Content.");
			$("#comment_wr_content").focus();
			return false;
		}
		
		<c:if test="${boardModel.login ne true}">
		if($("#comment_mb_id").val() == '') {
			alert("Enter the Author.");
			$("#comment_mb_id").focus();
			return false;
		}
		
		if($("#comment_wr_password").val() == '') {
			alert("Enter the Password.");
			$("#comment_wr_password").focus();
			return false;
		}
		</c:if>
		
		return true;
	}

	function create_comment() {
		if(checkVal()) {
			doAjax("boardModel", "/community/forum/forum_comment-create.do", "<c:out value = '${msg_save}'/>.", "fn_reload()");
		}
	}
	
	function delete_comment(wr_comment) {
		if(wr_comment == '') {
			return;
		}
		$("#wr_comment").val(wr_comment);
		doAjax("boardModel", "/community/forum/forum_comment-delete.do", "<c:out value = '${msg_delete}'/>", "fn_reload()");
	}

	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('boardModel');
		frm.action = "/community/forum/forum-readList.do";
		frm.submit();
	}
	
	function clip(){
	
		var location0 = "?wr_id=";
		location1=document.location+"";
		var contains = location1.indexOf(location0);
		
		
		if(contains < 0){
			location1=location1 +"?wr_id="+ $("#wr_id").val();
		}
		
		
		var IE = (document.all) ? true : false;
			if (IE) {
				if (confirm("<c:out value = '${msg_clip_confirm}'/>"))
					window.clipboardData.setData("Text", location1);
			} else {
				temp = prompt("<c:out value = '${msg_clip}'/>", location1);
			}

		}


		function read() {
			var frm = document.getElementById('boardModel');
			frm.action = "/community/forum/forum-read.do";
			frm.submit();
		}

		function del() {
			if (confirm("<c:out value = '${msg_delete_confirm}'/>")) {
				doAjax("boardModel", "/community/forum/forum-delete.do",
						"<c:out value = '${msg_delete}'/>", "list_init()");
			}
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
             <img src="/images/sub/contitle31.png" alt="forum" />
     <div class="viewsearch" > 

     <ul>
       <li><h1><c:out value="${boardModel.wr_subject}" /></h1>
       </li>
       <li class="mdt10">
         <table width="814" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td style="width:313px;" class="viewline">Author : <c:out value="${boardModel.mb_id}" /> </td>
             <td style="width:219px;" class="viewline">&nbsp;</td>
             <td style="width:282px;" align="right" class="viewline"> Date : <c:out value="${boardModel.wr_last}" /> </td>
           </tr>
           <tr>
            <td colspan="3" align="right" valign="bottom" class="font12">
			<c:if test="${not empty attachFilePrint}">
				<c:out value = "${attachFilePrint}" escapeXml="false"/>
			</c:if>
            
            </td>
           </tr>
         </table>
       </li>
     </ul>
     </div>
     <!--앱게시판 부분-->
    <div class="viewdetail" > 
     <ul>
     <li style="text-align:right;">
    	<c:choose>
				<c:when test="${boardModel.kor eq 'true'}">
				 	<a href="javascript:clip()" onfocus="blur();"><img src="/images/sub/clip_copy.png" alt="link copy" width="15px"/><span style="color:#333333">URL 복사</span></a>
				</c:when>
				<c:otherwise>
			      	
			      	<a href="javascript:clip()" onfocus="blur();"><img src="/images/sub/clip_copy.png" alt="link copy" width="15px"/><span style="color:#333333">Copy Link</span></a>
				</c:otherwise>
			</c:choose>
    
     
     </li>
    
    <li>
		<c:out value="${boardModel.wr_content}" escapeXml="false"/>
					
		<p />
		
		<c:forEach var="base64FileList" items="${boardModel.base64FileList}">
			<img src="${base64FileList}" />
		</c:forEach>

    </li>
     </ul>
    </div>
    <!--//앱게시판 부분-->
    
    <!--코멘트부분-->
     <div class="viewcomment" >
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
             <dt class="font14_bold">${commentModel.mb_id}</dt>
             <dt class="font12">${commentModel.wr_datetime} </dt>
             <dt>
				<c:if test="${not empty commentModel.mb_id && commentModel.mb_id eq boardModel.sessionId|| boardModel.sessionId eq 'Admin'}">
					<span style="cursor:pointer" onclick="delete_comment('<c:out value = "${commentModel.wr_comment}" />');"> delete </span>
				</c:if>
             </dt>
           </dl>
           <dl class="md10">
            <dt >
				<c:out value = "${commentModel.wr_content_view}" escapeXml="false"/>
            </dt>
           </dl>
           
			</c:forEach>
            <!--//코멘트라인-->

             <!--코멘트라인-->
			<c:if test="${boardModel.login eq true}">

            <dl class="viewline02">
            <dt>
             <form:textarea path="comment_wr_content" class="txt_w780" /> 
            </dt>
           
           </dl>
           <dl class="md10 viewline02">
            <dt ></dt><dt >
            </dt> <dt ></dt><dt >
            </dt>
             <dt class="font12_b"></dt>
           <dt></dt>
           <dt ></dt>
              <dt><span><a href="javascript:create_comment();"><img src="/images/sub/btn_comment.gif" alt="Comment" width="101" height="24" /></a></span></dt>
           </dl>           
           
		</c:if>
           <!--//코멘트라인-->
           
         </li>
       </ul>
     </div>
    <!--//코멘트부분--> 
	
    <!--게시판버튼-->
    <div class="viewsearch03" > 
     <ul>
      <li>
			
		<c:if test="${boardModel.login eq true && not empty boardModel.mb_id && boardModel.mb_id eq boardModel.sessionId || boardModel.sessionId eq 'Admin'}">
			<a href="javascript:read();"><img src="/images/sub/btn_board03.gif" alt="edit" /></a>
			<a href="javascript:del();"><img src="/images/sub/btn_board04.gif" alt="delete" /></a> 
		</c:if>
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
