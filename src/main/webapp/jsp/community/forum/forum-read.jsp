<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
	<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
	
	<script type="text/javaScript">
	
	 tinymce.init({
	     selector: "textarea.txt_w800"
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
	 });
	
	
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
			doAjax("boardModel", "/community/forum/forum-create.do", "<c:out value = '${msg_save}'/>", "list_init()");
		}
	}
	
	function update() {
		if(checkVal()) {
			doAjax("boardModel", "/community/forum/forum-update.do", "<c:out value = '${msg_save}'/>", "view()");
		}
	}
	
	function del() {
		if(confirm("<c:out value = '${msg_delete_confirm}'/>")) {
			doAjax("boardModel", "/community/forum/forum-delete.do", "<c:out value = '${msg_delete}'/>", "list_init()");
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
		frm.action = "/community/forum/forum-readList.do";
		frm.submit();
	}
	
	function view() {
		var frm = document.getElementById('boardModel');
		frm.action = "/community/forum/forum-view.do";
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
		<form:hidden path="searchCa_name" />
		<form:hidden path="wr_comment" />
		<form:hidden path="wr_id" />

    <div class="submain" >
             <img src="/images/sub/contitle31.png" alt="forum" />
     <div class="viewsearch" > 
     <ul>
      
       <li>
         <table width="814" border="0" cellspacing="0" cellpadding="0">
         
              <tr>
             <td style="width:112px;height:28px;" class="mdt15 mdb10"><strong>Category</strong></td>
             <td style="width:702px;" class="mdt15 mdb10"><form:select path="ca_name" items="${boardModel.ca_nameList}" itemLabel="text" itemValue="value" class="input_w280" style="height:20px!important" alt="Category"/></td>
             </tr>
             
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
     <!--게시글 textarea 부분-->
    <div class="viewwrite" > 
     <ul>
    <li>
    	<form:textarea path="wr_content"  class="txt_w800"/>
    </li>
     </ul>
    </div>
    <!--//게시글 textarea 부분-->

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
				<a href="javascript:view();"> <img src="/images/sub/btn_board05.gif" alt="view" /> </a>
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
