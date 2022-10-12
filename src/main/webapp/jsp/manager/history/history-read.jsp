<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>

	<script type="text/javaScript">

	 tinymce.init({
	     selector: "textarea"
	     , menubar: false
	     , toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons"
	     , style_formats: [
	                     {title: 'Bold text', inline: 'b'},
	                     {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
	                     {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
	                     {title: 'Example 1', inline: 'span', classes: 'example1'},
	                     {title: 'Example 2', inline: 'span', classes: 'example2'},
	                     {title: 'Table styles'},
	                     {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
	                 ]
	 	, plugins: ["link", "image", "preview"]
	    , link_list: [
	        {title: 'My page 1', value: 'http://www.tinymce.com'},
	        {title: 'My page 2', value: 'http://www.moxiecode.com'}
	    ]	 
		, image_list: [ 
	              {title: 'My image 1', value: 'http://www.tinymce.com/my1.gif'}, 
	              {title: 'My image 2', value: 'http://www.moxiecode.com/my2.gif'} 
		]	 
//	     , language : 'ko_KR'
	 });

	function checkVal() {
		if($("#wr_subject").val() == '') {
			alert("Enter the Version.");
			$("#wr_subject").focus();
			return false;
		}
		
		var contents = tinyMCE.activeEditor.getDoc().body.innerHTML; 
		
		$("#wr_content").val(contents);
		
		if($("#wr_content").val() == '') {
			alert("Enter the Content.");
			$("#wr_content").focus();
			return false;
		}
		
		return true;
	}

	function create() {
		if(checkVal()) {
			doAjax("boardModel", "/manager/history/history-create.do", "<c:out value = '${msg_save}'/>.", "list_init()");
		}
	}

	function update() {
		if(checkVal()) {
			doAjax("boardModel", "/manager/history/history-update.do", "<c:out value = '${msg_save}'/>", "list()");
		}
	}
	
	function del() {
		doAjax("boardModel", "/manager/history/history-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
	}
	
	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");
		
		list();
	}
	
	function list() {
		var frm = document.getElementById('boardModel');
		frm.action = "/manager/history/history-readList.do";
		frm.submit();
	}
	
	</script>

</head>
	
<body>
	
    <div class="board_01">

      <!--타이틀--><div class="btitle">History</div> <!--//타이틀-->
	
	<form:form commandName="boardModel" method="post" enctype="multipart/form-data">
		<form:hidden path="pageNo" />
		<form:hidden path="searchKind" />
		<form:hidden path="searchWord" />
		<form:hidden path="wr_id" />
		<form:hidden path="wr_parent" />
	
    <div class="viewsearch mdl10" > 
	
     <ul>
      
       <li>
         <table width="610" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td  style="width:100px;" class="mdt15 mdb10"><strong>Version</strong></td>
             <td  class="mdt15 mdb10"><form:input path="wr_subject" class="input_w300" /></td>
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
