<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<link rel="stylesheet" type="text/css" href="/css/admin.css" />
	
	<script type="text/javascript" src="/js/netminer.js"></script>
	<script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>

	<script type="text/javaScript">
	$(document).ready(function() {
		var pagemoveflag = true;
		var date = new Date();
		var url = "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&";
		params = "business=netminer@cyram.com"
			+"&return=http://www.netminer.com/NetMiner/payment_review.jsp"
			+"&notify_url=http://www.netminer.com/NetMiner/payment_review.jsp"
			+"&cancel_return=http://www.netminer.com/NetMiner/payment_review.jsp?test=cancel"
			+"&quantity=1"
			+"&item_number="+date.getTime()
			+"&amount=<c:out value='${buyModel.total}'/>"
			+"&item_name=NetMiner"
			+"&no_shipping=1"
			+"&no_note=0"
			+"&currency_code=USD";
		if(pagemoveflag) {
			location.href = url + params;
		}
		opener.parent.location = "/download_buy/buy/buy_ok_Research_academic-view.do";
		
	});

	</script>


</head>
	
<body>
<!-- 
// 11_Payment_pop.htpl
// payment_review.jsp
// TODO item_name = NetMiner
// TODO			startRequest();
// TODO onUnLoad="checkSentMsg()"
 -->
</body>
</html>
