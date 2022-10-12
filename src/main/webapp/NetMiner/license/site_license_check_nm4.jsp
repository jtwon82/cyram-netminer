<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@include file="/NetMiner/common.jsp"%>
<%
	String data = request.getParameter("data");
	response.sendRedirect(baseURL+"/license/site_license_check_nm4.jsp?data="+data);
%>