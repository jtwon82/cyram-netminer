<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="extensionModel" items="${buyModel.extensionModelList}">
	<tr class="h20">
		<td><c:out value="${extensionModel.label}" /><!-- SNS Data Collector (1년) --></td>
		<td>${extensionModel.description}</td>
		<td style="text-align: right"><c:out value="${extensionModel.priceFormatted}"/>
	    	<input type="hidden" name="extensionprices" value="${extensionModel.price}"/>
		</td>

		<td style="width: 50px; text-align: center;">
			<input name="extensions" type="checkbox" value="${extensionModel.extensionId}" onclick="javascript:setPrice();"></input>
		</td>
	</tr>
</c:forEach>