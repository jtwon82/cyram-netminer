<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<c:forEach var="editionpackageModel" items="${buyModel.editionpackageList}">
	editionsize =  "${editionpackageModel.licensesize}";
	editionterm = "${editionpackageModel.licenseterm}";
	editionPackArr.push('${editionpackageModel.packageid}');
</c:forEach>

</script>

