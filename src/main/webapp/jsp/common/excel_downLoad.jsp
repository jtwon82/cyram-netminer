<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class='main' id ="result" style="display: none;">
		<thead>
			<tr>
						<th style="width: 100px;">신청일</th>
						<th style="width: 100px;">성함</th>
						<th style="width: 100px;">국가</th>
						<th style="width: 100px;">소속 기관</th>
						<th style="width: 100px;">소속 학과</th>
						<th style="width: 100px;">Email</th>
						<th style="width: 100px;">강의명</th>
						<th style="width: 100px;">수강인원</th>
						<th style="width: 100px;">강의소개</th>
						<th style="width: 100px;">첨부자료</th>
						<th style="width: 100px;">마케팅동의</th>
						<th style="width: 100px;">결과</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="item" varStatus="status">
					<tr>
							<td>${item.saledate}</td>
							<td>${item.APPLCNT_NM}</td>
							<td>${item.NATION_NAME_KR}</td>
							<td>${item.PSITN_INSTT}</td>
							<td>${item.PSITN_SUBJCT}</td>
							<td>${item.CHARGER_EMAIL}</td>
							<td>${item.LCTRE_NM}</td>
							<td>${item.ATNLC_NMPR}</td>
							<td>[상세보기]</td>
							<td>${item.orgname}</td>
							<td>${item.agree3}</td>
							<td>${item.RESULT}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>