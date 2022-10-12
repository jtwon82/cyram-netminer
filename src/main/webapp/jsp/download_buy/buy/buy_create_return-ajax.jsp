<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach var="saleid" items="${saleids}">
 		<input type="hidden" name="saleids" value="<c:out value='${saleid}' />"/>
	</c:forEach>
	
	<input type="hidden" name="mid" value="<c:out value='${buyModel.mid}' />"/>
	<input type="hidden" name="encrypted_oid" value="<c:out value='${buyModel.encrypted_oid}' />"/>
	<input type="hidden" name="buyer" value="<c:out value='${buyModel.buyer}' />"/>
	<input type="hidden" name="productinfo" value="<c:out value='${buyModel.productinfo}' />"/>	
	<input type="hidden" name="currency" value="<c:out value='${buyModel.currency}' />"/>
	<input type="hidden" name="encrypted_amount" value="<c:out value='${buyModel.encrypted_amount}' />"/>
	<input type="hidden" name="home_url" value="<c:out value='${buyModel.home_url}' />"/>
	<input type="hidden" name="encrypted_ret_url" value="<c:out value='${buyModel.encrypted_ret_url}' />"/>
	<input type="hidden" name="encrypted_fail_url" value="<c:out value='${buyModel.encrypted_fail_url}' />"/>
	<input type="hidden" name="encrypted_note_url" value="<c:out value='${buyModel.encrypted_note_url}' />"/>
	<input type="hidden" name="hashdata" value="<c:out value='${buyModel.hashdata}' />"/>
	<input type="hidden" name="timestamp" value="<c:out value='${buyModel.timestamp}' />"/>
	<input type="hidden" name="returnurl" value="<c:out value='${buyModel.returnurl}' />"/>
<%-- 	<input type="hidden" name="shipping" value="<c:out value='${buyModel.shipping}' />"/> --%>

	