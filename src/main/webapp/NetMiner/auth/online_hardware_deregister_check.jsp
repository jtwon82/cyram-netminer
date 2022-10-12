<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@include file="/NetMiner/common.jsp"%>
<%
	String version = request.getParameter("version");
	String licenseKey = request.getParameter("licenseKey");
	response.sendRedirect(baseURL+"/auth/online_hardware_deregister_check.jsp?version="+version+"&licenseKey="+licenseKey);
%>