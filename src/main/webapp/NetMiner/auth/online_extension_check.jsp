<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@include file="/NetMiner/common.jsp"%>
<%
	String extension = request.getParameter("extension");
	response.sendRedirect(baseURL+"/auth/online_extension_check.jsp?extension="+extension);
%>