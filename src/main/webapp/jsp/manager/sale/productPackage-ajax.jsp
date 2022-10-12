<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var j=0;
<c:forEach var="productpackagePrice" items="${saleModel.productpackagePriceList}">
	$("#productTable tr:eq("+j+") td:eq(4)").html("${productpackagePrice.usdprice}");
	$("#productTable tr:eq("+j+") td:eq(5)").html("${productpackagePrice.krwprice}");
	j++;
</c:forEach>

</script>

