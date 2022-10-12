<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	int i = 0;
%>

	<c:forEach var="productpackageModel" items="${buyModel.productpackageModelList}">
  <tr>
    <td class="h20"><c:out value="${productpackageModel.category}" />
    <input type="hidden" name="editionpackages" value="${productpackageModel.packageid}"/></td>
    <td class="h20"><c:out value="${productpackageModel.subcategory}" /></td>
    <td align="left" class="h20" style="padding-left:80px;"><c:out value="${productpackageModel.name}" escapeXml="false" /></td>
<%--     <td class="h20"><c:out value="${productpackageModel.note}" /></td> --%>
    
<c:choose>
	<c:when test="${ buyModel.kor eq 'false' }">
	    <td align="right" class="h20">
	    	<c:choose>
				<c:when test="${ productpackageModel.usdprice eq '0' }">
			    	 	-
				</c:when>
				<c:otherwise>
			    	 <c:out value="${productpackageModel.usdprice}" />
				</c:otherwise>
			</c:choose>
	    	<input type="hidden" name="prices" value="${productpackageModel.usdprice}"/>
	    </td>
	</c:when>
	<c:otherwise>
	    <td align="right" class="h20" id="aa<%=i%>">
			<script type="text/javascript">
				if("${productpackageModel.krwprice}"==0){
					$("#aa<%=i%>").append('-');
				}else{
					var aa = comma("${productpackageModel.krwprice}");
					$("#aa<%=i%>").append(aa);	
				}
			</script>    
	    	<input type="hidden" name="prices" value="${productpackageModel.krwprice}"/>
	    </td>
	</c:otherwise>
</c:choose>

    <td class="h20">

<c:choose>
	<c:when test="${ (productpackageModel.licenseusage eq '0' && productpackageModel.id ne 317)|| productpackageModel.category eq 'Basic' }">
    	<input type="checkbox" name="packages" id="${productpackageModel.id}" value="${productpackageModel.id}" DISABLED CHECKED>
	</c:when>
	<c:when test="${ productpackageModel.licenseusage eq '0' || productpackageModel.category eq 'Basic' }">
    	<input type="checkbox" name="packages" id="${productpackageModel.id}" value="${productpackageModel.id}" DISABLED>
	</c:when>
	<c:otherwise>
    	<input type="checkbox" name="packages" id="${productpackageModel.id}" value="${productpackageModel.id}" onclick="javascript:setPrice('${productpackageModel.packageid}', value);">
	</c:otherwise>
</c:choose>
    
    </td>
  </tr>
  <%i++; %>
	</c:forEach>

	