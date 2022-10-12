<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Review your order</title>
<link rel="stylesheet" type="text/css" href="/css/common.css" />

	<script type="text/javascript">
	function openpaypal() {
		var url = "https://www.paypal.com/cgi-bin/webscr";
		var sWin = window.open("about:blank", 'netminer_paypal', '');
		var settlementModel = document.getElementById("settlementModel");
		
		settlementModel.target = "netminer_paypal";
		settlementModel.action = url;
		settlementModel.submit();
		sWin.focus();
	}
	</script>

</head>

<body>
<div id="LGD_ACTIVEX_DIV"/>

<form:form commandName="settlementModel">
	<input type="hidden" name="business" value="netminer@cyram.com"/> 
	<!-- Specify a Buy Now button. --> 
	<input type="hidden" name="cmd" value="_xclick"/> 
	<!-- Specify details about the item that buyers will purchase. --> 
	<input type="hidden" name="item_name" value="Cyram NetMiner Settlement Payment"/> 
	<input type="hidden" name="item_number" value='<c:out value="${settlementModel.s_idx}"/>'/>
	<input type="hidden" name="amount" value='<c:out value="${settlementModel.s_price}"/>'/> 
	<input type="hidden" name="currency_code" value="USD"/> 
	<input type="hidden" name="charset" value="utf-8"/>
</form:form>

<div class="order_pop">
 <div class="order_pop_con">
   <table  class="buss_tb7" border="0" cellspacing="0" cellpadding="0"  >

     <tr>
       <th width="183">Product</th>
       <td width="271" class="mdr10"><c:out value="${settlementModel.s_product }"/></td>
     </tr>
     <tr>
       <th class="btiline2">Po #(Invoice #)</th>
       <td class="mdr10"><c:out value="${settlementModel.s_poinvoice }"/></td>
     </tr>
     <tr>
       <th class="btiline2">Total Price</th>
       <td class="mdr10">USD <c:out value="${settlementModel.s_price }"/></td>
     </tr>
   </table>
   <br />
   <a href="javascript:openpaypal();"><img src="/images/sub/btn_payment.gif" alt="Pay now" class="mdl200 mdt15" /></a>
   <!--<img src="../images/sub/btn_payment.gif" alt="payment" class="mdl200 mdt15" />-->
 </div>
 
</div>

</body>
</html>
