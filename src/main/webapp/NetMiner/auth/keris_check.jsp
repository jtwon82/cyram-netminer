<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@include file="/NetMiner/common.jsp"%>
<%
	String license = request.getParameter("license");
	String productId = request.getParameter("productId");
	response.sendRedirect(baseURL+"/auth/keris_check.jsp?license="+license+"&productId="+productId+"&ip="+request.getHeader("X-Forwarded-For"));
%>