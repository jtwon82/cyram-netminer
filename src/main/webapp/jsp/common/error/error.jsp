<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<script>
	function fn_onload() {
		alert("An error has occurred. If the same error continues to occur, contact your administrator.");
	}
	</script>
    
</head>
	
<body onload="fn_onload();">
	<div id="error_message" style="display:none"><c:out value='${exception.message}'/></div>
</body>
</html>
