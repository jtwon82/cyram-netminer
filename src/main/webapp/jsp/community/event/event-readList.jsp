<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
   


	<script type="text/javaScript">
		
		function search() {
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
		
		function view(wr_id) {
			document.getElementById('wr_id').value = wr_id;
			
			var frm = document.getElementById('boardModel');
			frm.action = "/community/event/event-view.do";
			frm.submit();
		}
		
		function read() {
			document.getElementById('wr_id').value = '0';
			
			var frm = document.getElementById('boardModel');
			frm.action = "/community/event/event-read.do";
			frm.submit();
		}
		
		function read2(wr_id) {
			document.getElementById('wr_id').value = wr_id;
			
			var frm = document.getElementById('boardModel');
			frm.action = "/community/event/event-read.do";
			frm.submit();
		}
		function list() {
			var frm = document.getElementById('boardModel');
			frm.action = "/community/event/event-readList.do";
			frm.submit();
		}
		function search2(ca_name) {
		
			$("#searchWord").val("");
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
		
		function modal(url){
			
			switch(url){
			case 1:
				doGridPreview("http://www.netminer.com/NetMiner_Data/product/diffusion1.png");
				break;
			case 2:
				doGridPreview("http://www.netminer.com/NetMiner_Data/product/diffusion2.png");
				break;
			case 3:
				doGridPreview("http://www.netminer.com/NetMiner_Data/product/diffusion3.png");
				break;
						
		
			
			}
			$('div.modal').modal();
		}
		function modalClose(){

			$('div.modal').modal('hide');
		}
		

		function doGridPreview(text){
			var resultHtml = "";
			
			
			
		    resultHtml +='<a href="javascript:modalClose();" style="text-decoration:none;"><img src="'+text +'" width="550px" /></a>';
		 
			$("#prev_body").html(resultHtml);	
		}
	
	</script>

</head>
	
<body>

<!-- modal -->
	
	<div class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
			
			<div class="modal-header">
				<button type="button" class="close" >
					<span >&times;</span>
				</button>
<!-- 				<h4 id="modal-title" class="modal-title"></h4> -->
			</div>
			<div class="modal-body" style="overflow: auto;">
				<table class="table">
					<tbody id="prev_body">
					</tbody>
				</table>
			</div>
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 			</div> -->
			
			</div>
		</div>
	</div>     
  <!-- modal -->
  
    

  <!--하단컨텐츠-->
  <div id="container02" >
    
    <div class="submain" >
             <img src="/images/sub/mers2.png" alt="MERS" />
<!--      <div class="viewsearch" >  -->
<!--      <ul> -->
<!--        <li> -->

<div class="buybox" >
        
        <ul>
          <li> Since May 2015, the government of Republic of Korea has been investigating an outbreak of MERS.<br/>
It is the largest known outbreak of MERS outside the Arabian Peninsula. <a href="http://www.who.int/csr/don/12-june-2015-mers-korea/en/" target="_blank">(http://www.who.int/csr/don/12-june-2015-mers-korea/en/)</a>
</li>
  <li class="mdt15"> Korean Ministry of Health and Welfare has been releasing ‘Daily MERS Statistics’ report on  
 </li>
 <li class="mdl20">-&nbsp;&nbsp;<a href="http://www.mers.go.kr" target="_blank">http://www.mers.go.kr</a> (Korean language)
<br/>
-&nbsp;&nbsp;<a href="http://goo.gl/mtURM4" target="_blank">http://goo.gl/mtURM4</a> (English language)
</li>
 <li class="mdt15">We’re transforming this report (unstructured text) to structured data, especially network data, for further analysis and research.<br/>
And we share this data with Infectious diseases researchers or network researchers for doing developmental research.<br/>
The data will be updated on daily basis until the end of diffusion.
 </li>
 
 <li class="mdt15">
 Note: This data is partly incomplete because some infected people are under epidemiological investigation and the source report include  unclear texts.
 </li>
 
 <li class="mdt25">
 ※ Data formats</li>
 <li class="mdl20">
	-&nbsp;&nbsp;Microsoft Excel: incrementally updated day by day (3 Sheets: Nodes’ attributes / 1-mode network / 2-mode network)<br/>
	-&nbsp;&nbsp;NMF (Cyram NetMiner File format): incrementally updated day by day and includes daily work files (integrated network data)<br/>
   <strong>
	-&nbsp;&nbsp;For NMF file, we provides temporarily NetMiner 4 for free until 30 September, 2015. </strong>
	</li>
	
	<li class="mdl20 mdt20">

	You can download NetMiner setup file on following URL and open NMF file.  <br/>
	
	&nbsp;&nbsp;Ÿ&nbsp;  Windows(32bit) <a href="http://www.netminer.com/NetMiner_Data/product/Setup(Windows_x86).zip" target="_blank">http://www.netminer.com/NetMiner_Data/product/Setup(Windows_x86).zip</a>  <br/>

	&nbsp;&nbsp;Ÿ&nbsp;  Windows(64bit) <a href="http://www.netminer.com/NetMiner_Data/product/Setup(Windows_x64).zip" target="_blank">http://www.netminer.com/NetMiner_Data/product/Setup(Windows_x64).zip</a>
 </li>
 
  <li class="mdt25">
※ Meaning of links
</li>
 <li class="mdl20">
    -&nbsp;&nbsp;1-mode network: who infected whom? (person-to-person)<br/>
   -&nbsp;&nbsp;2-mode network: who visited which hospital? (person-to-hospital)
 </li>
 <li class="mdt25">
 ※  Network Map</li>
   <li><a href="javascript:modal(1);" style="text-decoration:none;"><img src="http://www.netminer.com/NetMiner_Data/product/diffusion1.png" width="260px" /></a>
   <a href="javascript:modal(2);" style="text-decoration:none;"><img class="mdl20" src="http://www.netminer.com/NetMiner_Data/product/diffusion2.png" width="260px" /></a>
   <a href="javascript:modal(3);" style="text-decoration:none;"><img class="mdl20" src="http://www.netminer.com/NetMiner_Data/product/diffusion3.png" width="260px" /></a></li>
<!--   <li style="text-align:center;"><img src="/images/sub/diffusion.png" width="550px" /></li> --> 
<!--   <li style="text-align:center;"><img src="/images/mers_map/29-06-2015_map.jpg" width="580px" /></li> -->
<!--     <li class="mdl100 fot12"> -->
<!-- 	Red: Under Treatment<br/> -->
<!-- Blue: Discharge<br/> -->
<!-- Gray: Death<br/> -->
<!-- Isolate: Epidemiologic Survey is In Progress -->
<!-- </li> -->

 </ul>
      </div>
 
	
	<form:form commandName="boardModel" action="/community/event/event-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="wr_id" />

	</form:form>
    <div class="buybox">
    
	<table  border="0" cellspacing="0" cellpadding="0" class="buss_tb2 mdt25">
	  <tr>
	    <th width="5%">No</th>
	    <th width="25%">Subject</th>
	    <th width="70%">Data</th>
      </tr>
      
	<c:if test="${fn:length(list) <= 0}">
		<tr>
			<td colspan="2">There are no results.</td>
		</tr>
	</c:if>
	    
	<c:forEach var="boardModel" items="${list}">
		<tr>
	    <td align="center">${boardModel.wr_id}</td>
	    <td align="center">
	    <b>
	    			<c:choose>
				<c:when test="${boardModel.sessionId eq 'jm' || boardModel.sessionId eq 'Admin'}">
				 	<a href="javascript:read2('${boardModel.wr_id}');">${boardModel.wr_subject}</a>
				</c:when>
				<c:otherwise>
			      	${boardModel.wr_subject}
				</c:otherwise>
			</c:choose>

		</b>
		</td>
	    <td>
				<c:out value = "${boardModel.attachFilePrint}" escapeXml="false"/>
        </td>
	    
	    
<%-- 	    <td>${boardModel.wr_last}</td> --%>
		</tr>
<!-- 		<tr> -->
<!-- 		<td colspan="4" background-color="gray"> -->
<%-- 		${boardModel.wr_content}</td> --%>
<!-- 		</tr> -->
		
	</c:forEach>
	</table>

    </div>
    
     <div class="viewsearch02" > 
		<c:out value = "${moveLinkPageScript}" escapeXml="false"/>
		<c:out value = "${moveLinkPagePrint}" escapeXml="false"/>
     </div>
     
      <div class="buybox">
      <ul><li  class="center">
      If you have any questions about MERS spread data or NetMiner, please contact us at <a href="http://netminer@cyram.com" target="_blank">netminer@cyram.com</a></li>
      </ul></div>
<!--게시판버튼-->
    <div class="viewsearch03" > 
     <ul>
    
      <li>


	<c:if test="${boardModel.sessionId eq 'jm' || boardModel.sessionId eq 'Admin'}">
	<a href="javascript:read();"><img src="/images/sub/btn_board02.gif" alt="write" /></a>
	</c:if>

<!-- 	<a href="javascript:search2();"><img src="/images/sub/btn_board01.gif" alt="list" /></a>  -->
	  </li>
	  
     </ul>

    </div>
    <!--//게시판버튼-->
   
   
   

     
    </div>
    
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
