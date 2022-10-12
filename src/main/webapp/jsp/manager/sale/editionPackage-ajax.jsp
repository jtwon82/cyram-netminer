<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

<c:forEach var="editionpackageModel" items="${saleModel.edtionpackageModelList}">
	
	editionsize =  "${editionpackageModel.licensesize}";
	editionPackArr.push('${editionpackageModel.packageid}');
	
	$("#product_"+"${editionpackageModel.packageid}").css("background", "#e2eef3");
</c:forEach>

</script>

