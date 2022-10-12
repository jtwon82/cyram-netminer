<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script language="javascript"
	src="http://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js"
	type="text/javascript"></script>

<script type="text/javaScript">
	const NEW_COMMERCIAL = "8";

	function fn_onload() {
		lgdwin = open_paymentwindow(document.getElementById('info'),
				"<c:out value='${buyModel.platform}' />", 'submit');
		opener.parent.location = "${buyModel.licenseusage}" === NEW_COMMERCIAL 
				? "/download_buy/buy/buy_ok_commercial-view.do"
				: "/download_buy/buy/buy_ok_Research_academic-view.do";
	}
</script>

</head>

<body onload="fn_onload();">
	<form id="info" method="post" action="">
		<div>
			<input type="hidden" name="CST_PLATFORM"
				value="<c:out value='${buyModel.platform}' />" /> <input
				type="hidden" name="CST_MID"
				value="<c:out value='${buyModel.mid}' />" /> <input type="hidden"
				name="CST_WINDOW_TYPE" value='submit' /> <input type="hidden"
				name="LGD_MID" value="<c:out value='${buyModel.mid}' />" /> <input
				type="hidden" name="LGD_OID"
				value="<c:out value='${buyModel.encrypted_oid}' />" /> <input
				type="hidden" name="LGD_BUYER"
				value="<c:out value='${buyModel.buyer}' />" /> <input type="hidden"
				name="LGD_PRODUCTINFO"
				value="<c:out value='${buyModel.productinfo}' />" /> <input
				type="hidden" name="LGD_AMOUNT"
				value="<c:out value='${buyModel.encrypted_amount}' />" /> <input
				type="hidden" name="LGD_BUYEREMAIL" value='' /> <input
				type="hidden" name="LGD_CUSTOM_SKIN" value='red' /> <input
				type="hidden" name="LGD_CUSTOM_PROCESSTYPE" value='TWOTR' /> <input
				type="hidden" name="LGD_TIMESTAMP"
				value="<c:out value='${buyModel.timestamp}' />" /> <input
				type="hidden" name="LGD_HASHDATA"
				value="<c:out value='${buyModel.hashdata}' />" /> <input
				type="hidden" name="LGD_PAYKEY" value='' /> <input type="hidden"
				name="LGD_RESPCODE" value='' /> <input type="hidden"
				name="LGD_RESPMSG" value='' /> <input type="hidden"
				name="LGD_CUSTOM_USABLEPAY" value='SC0010' /> <input type="hidden"
				name="LGD_WINDOW_VER" value='2.5' /> <input type="hidden"
				name="LGD_RETURNURL" value="<c:out value='${buyModel.returnurl}' />" />
		</div>
	</form>
</body>
</html>
