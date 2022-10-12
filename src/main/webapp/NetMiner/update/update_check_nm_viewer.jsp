<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@include file="/NetMiner/common.jsp"%>
<%
	String version = request.getParameter("version");
	String licenseKey = request.getParameter("licenseKey");
	response.sendRedirect(baseURL+"/update/update_check_nm_viewer.jsp?version="+version+"&licenseKey="+licenseKey);
%>