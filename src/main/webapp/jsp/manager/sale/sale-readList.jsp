<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

<script type="text/javaScript">
	function search() {
		$("#pageNo").val("0");

		var frm = document.getElementById('saleModel');
		frm.action = "/manager/sale/sale-readList.do";
		frm.submit();
	}

	function search_date() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");

		var frm = document.getElementById('saleModel');
		frm.action = "/manager/sale/sale-readList.do";
		frm.submit();
	}

	function view(saleid) {
		document.getElementById('saleid').value = saleid;

		var frm = document.getElementById('saleModel');
		frm.action = "/manager/sale/sale-read.do";
		frm.submit();
	}

	function changeTrColor(trObj, oldColor, newColor) {
		trObj.style.backgroundColor = newColor;
		trObj.onmouseout = function() {
			trObj.style.backgroundColor = oldColor;
		};
	}
</script>

</head>

<body>

	<div class="board_01">
		<!--타이틀-->
		<div class="btitle">판매관리</div>
		<!--//타이틀-->

		<form:form commandName="saleModel"
			action="/manager/sale/sale-readList.do">
			<form:hidden path="pageNo" />
			<form:hidden path="saleid" />

			<div class="viewsearch  mdl10">
				<ul>
					<li class="mdt10 mdl10"><form:input path="s_year"
							class="input_w70" style="width:40px"
							onkeydown="javascript:if(event.keyCode == 13) search_date();" />년
						<form:input path="s_month" style="width:20px"
							onkeydown="javascript:if(event.keyCode == 13) search_date();" />월
						<form:input path="s_day" class="input_w70" style="width:20px"
							onkeydown="javascript:if(event.keyCode == 13) search_date();" />일
						~ <form:input path="e_year" class="input_w70" style="width:40px"
							onkeydown="javascript:if(event.keyCode == 13) search_date();" />년
						<form:input path="e_month" class="input_w70" style="width:20px"
							onkeydown="javascript:if(event.keyCode == 13) search_date();" />월
						<form:input path="e_day" class="input_w70" style="width:20px"
							onkeydown="javascript:if(event.keyCode == 13) search_date();" />일
						<div class="btn_search">
							<a href="javascript:search_date();">SEARCH</a>
						</div></li>
					<li class="mdt10 mdl10"><form:checkbox path="licenseKeyYN"
							label="라이선스 키 미발급자" value="Y" /> <form:checkbox
							path="shippingYN" label="배송 대기자" value="Y" /></li>
					<li class="mdt10 mdl10"><form:select path="searchKind"
							items="${saleModel.selectBoxModelList}" itemLabel="text"
							itemValue="value" /> <form:input id="searchWord"
							path="searchWord" class="input_w300"
							onkeydown="javascript:if(event.keyCode == 13) search();" />
						<div class="btn_search">
							<a href="javascript:search();">SEARCH</a>
						</div></li>
				</ul>
			</div>

			<div class="viewlist mdt10 mdl10">
				<table border="0" cellspacing="0" cellpadding="0" class="buss_tb">

					<tr>
						<th style="width: 50px">키발급</th>
						<th style="width: 40px">최신</th>
						<th style="width: 50px">Sale ID</th>
						<th style="width: 80px">사용자 ID</th>
						<th style="width: 150px">이름</th>
						<th style="width: 200px">소속</th>
						<th style="width: 180px">Email</th>
						<th style="width: 80px">Producct ID</th>
						<th style="width: 130px">License</th>
						<th style="width: 70px">term</th>
						<th style="width: 120px">size</th>
						<th style="width: 85px">sale date</th>
						<th style="width: 85px">expire date</th>
						<!--       <th style="width:200px">Order ID</th> -->
					</tr>

					<c:forEach var="saleModel" items="${list}">
						<tr>
							<c:choose>
								<c:when test="${saleModel.serialnum == '미발급'}">
									<td style="color: red">${saleModel.serialnum}</td>
								</c:when>
								<c:otherwise>
									<td>${saleModel.serialnum}</td>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${saleModel.replacedid == '최신'}">
									<td>${saleModel.replacedid}</td>
								</c:when>
								<c:otherwise>
									<td><a href="javascript:view('${saleModel.replacedid}');"
										style="color: red">${saleModel.replacedid}</a></td>
								</c:otherwise>
							</c:choose>

							<td><a href="javascript:view('${saleModel.saleid}');">${saleModel.saleid}</a>
							</td>
							<td>${saleModel.loginid}</td>
							<td>${saleModel.fullname}</td>
							<td>${saleModel.orgname}</td>
							<td>${saleModel.email}</td>
							<td>CYNM4${saleModel.productserial}</td>
							<td>${saleModel.licenseusage_name}</td>
							<td>${saleModel.licenseterm_name}</td>
							<td>${saleModel.licensesize_name}</td>
							<td>${saleModel.saledate}</td>
							<td>${saleModel.expiredate}</td>
							<!--         <td> -->
							<%--           ${saleModel.oid} --%>
							<!--         </td> -->
						</tr>
					</c:forEach>

				</table>

				<ul>
					<li style="float: right" class="mdt10 mdr6"><a
						href="javascript:view('0');"><img
							src="/images/sub/btn_board02.gif" alt="Write" /></a></li>
				</ul>
			</div>

			<c:out value="${moveLinkPageScript}" escapeXml="false" />
			<c:out value="${moveLinkPagePrint}" escapeXml="false" />

		</form:form>

	</div>

</body>
</html>
