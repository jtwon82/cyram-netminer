<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javaScript">		
		function search() {
			document.getElementById('pageNo').value = 0;
			document.getElementById('nmUserModel').submit();
		}
		
		function view(loginid) {
			document.getElementById('loginid').value = loginid;
			
			var frm = document.getElementById('nmUserModel');
			frm.action = "/manager/nmuser/nmuser-read.do";
			frm.submit();
		}
		
		
	</script>

</head>
	
<body>
	
    <div class="board_01">
      <!--타이틀--><div class="btitle">사용자</div> <!--//타이틀-->

	<form:form commandName="nmUserModel" action="/manager/nmuser/nmuser-readList.do">
		<form:hidden path="pageNo" />
		<form:hidden path="loginid" />

     <div class="viewsearch  mdl10" > 
     <ul>
       <li class="mdt10 mdl10"><form:select path="searchKind" items="${nmUserModel.selectBoxModelList}" itemLabel="text" itemValue="value" />
         <form:input path="searchWord" class="input_w300" /><div class="btn_search"><a href="javascript:search();">SEARCH</a></div>
       </li>
     </ul>
     </div>

    <div class="viewlist mdt10 mdl10">
    <table  border="0" cellspacing="0" cellpadding="0" class="buss_tb">
  <tr>
    <th style="width:150px">Login ID</th>
    <th style="width:150px">Country</th>
    <th style="width:230px">Name(F-L)</th>
    <th style="width:180px">Company/Organization</th>
    <th style="width:180px">Industry</th>
    <th style="width:220px">Email</th>
    <th style="width:150px">Date</th>
    </tr>

			<c:forEach var="nmUserModel" items="${list}">
				<tr>
					<td>
						<a href="javascript:view('${nmUserModel.loginid}');">${nmUserModel.loginid}</a>
					</td>
					
					<td>${nmUserModel.country}

					</td>
					
					<td style="text-align:left;">
						<a href="javascript:view('${nmUserModel.loginid}');">${nmUserModel.firstname} ${nmUserModel.lastname}</a>
					</td>
					<td>${nmUserModel.organization}</td>
					<td><span>
<c:choose>
	<c:when test="${nmUserModel.industry eq '1'}">
      education
	</c:when>
	<c:when test="${nmUserModel.industry eq '2'}">
      research/consulting
	</c:when>
	<c:when test="${nmUserModel.industry eq '3'}">
      government
	</c:when>
	<c:when test="${nmUserModel.industry eq '4'}">
      legal services
	</c:when>
	<c:when test="${nmUserModel.industry eq '5'}">
      financial/banking/insurance/real estate
	</c:when>
	<c:when test="${nmUserModel.industry eq '6'}">
      medical/pharmaceutical/health care
	</c:when>
	<c:when test="${nmUserModel.industry eq '7'}">
      telecommunication
	</c:when>
	<c:when test="${nmUserModel.industry eq '8'}">
      consumer retail/whole sale
	</c:when>
	<c:when test="${nmUserModel.industry eq '9'}">
      distribution
	</c:when>
	<c:when test="${nmUserModel.industry eq '10'}">
      computer-related(IS, MIS, DP, Internet)
	</c:when>
	<c:when test="${nmUserModel.industry eq '11'}">
      computer-related(hardware)
	</c:when>
	<c:when test="${nmUserModel.industry eq '12'}">
      computer-related(software)
	</c:when>
	<c:when test="${nmUserModel.industry eq '13'}">
      engineering/construction
	</c:when>
	<c:when test="${nmUserModel.industry eq '14'}">
      business supplies or services
	</c:when>
	<c:when test="${nmUserModel.industry eq '15'}">
      entertainment/media/publishing
	</c:when>
	<c:when test="${nmUserModel.industry eq '16'}">
      hospitality(travel/accommodations)
	</c:when>
	<c:when test="${nmUserModel.industry eq '17'}">
      nonprofit/membership organizations
	</c:when>
	<c:when test="${nmUserModel.industry eq '18'}">
      none, not employed
	</c:when>
	<c:when test="${nmUserModel.industry eq '19'}">
      other
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>
      	
      </span>
      </td>
					<td style="text-align:left;">${nmUserModel.email}</td>
					<td style="text-align:left;">${nmUserModel.registerdate} ${nmUserModel.registertime}</td>
				</tr>
			</c:forEach>

		</table>

		 <ul>
         <li style="float:right" class="mdt10 mdr6"><a href="javascript:view('0');"><img src="/images/sub/btn_board02.gif" alt="Write"/></a></li>
        </ul>
    </div>
		
     <div class="viewlist  mdt10 mdl10" > 
		<c:out value = "${moveLinkPageScript}" escapeXml="false"/>
		<c:out value = "${moveLinkPagePrint}" escapeXml="false"/>
     </div>
		
	</form:form>

    </div>

</body>
</html>
