<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">

	$(document).ready(function() {
		if($("#wr_id").val() == '' || $("#wr_id").val() == '0') {
			list();
		} else {
			if('<c:out value="${fn:length(boardModel.wr_subject)}"/>' == '0' && '<c:out value="${fn:length(boardModel.wr_content)}"/>' == '0') {
				list();
			}
		}
	});
	
	
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


	function list() {
		var frm = document.getElementById('boardModel');
		frm.action = "/aboutus/notice/notice-readList.do";
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
            <div> <img src="/images/sub/contitle28.gif" alt="Notice" /></div>
     <div class="viewsearch" > 

     <ul>
       <li><h1><c:out value="${boardModel.wr_subject}" /></h1>
       </li>
       <li class="mdt10">
         <table style="width:814px;" border="0" cellspacing="0" cellpadding="0">
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
    
    <!--게시판버튼-->
    <div class="viewsearch03" > 
     <ul>
      <li>
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
