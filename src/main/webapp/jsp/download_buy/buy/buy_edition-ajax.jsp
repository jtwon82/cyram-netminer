<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	int i = 0;
%>

<c:set var="NEW_PREMIUM" value="7"/>
<c:forEach var="editionModel" items="${buyModel.editionModelList}">
	<tr>
		<td class="h20"><div>${editionModel.label}</div></td>
	    <c:choose>
		<c:when test="${ buyModel.kor eq 'false' }">
	    	 	<td class="h20" style=" word-break:keep-all;"><c:out value="${editionModel.description}" escapeXml="false" /></td>
	    	 	<td align="right" >
			    	 <c:out value="${editionModel.usdprice}" />
	    	 	</td>
		</c:when>
		<c:otherwise>
	    	 	<td class="h20" style=" word-break:keep-all;"><c:out value="${editionModel.descriptionkr}" escapeXml="false" /></td>
	    	 	<td class="h20" align="right" id="bb<%=i%>">
		    	 	<script type="text/javascript">
						var bb = comma(parseInt("${editionModel.krwprice}"));
						$("#bb<%=i%>").append(bb);	
					</script>  
		   		</td>
		</c:otherwise>
		</c:choose>

		<td class="h20"><c:choose>
				<c:when test="${ editionModel.id eq NEW_PREMIUM }">
					<input type="radio" name="edition" id="edition_${editionModel.id}"
						value="${editionModel.id}"
						onclick="javascript:setEditionPackage(value);" checked />
				</c:when>
				<c:otherwise>
					<input type="radio" name="edition" id="edition_${editionModel.id}"
						value="${editionModel.id}"
						onclick="javascript:setEditionPackage(value);">
				</c:otherwise>
			</c:choose></td>
	</tr>
	<%
		i++;
	%>
</c:forEach>

