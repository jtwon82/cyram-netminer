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
	/*
	* iframe으로 결제창을 호출하시기를 원하시면 iframe으로 설정 (변수명 수정 불가)
	*/
	  var LGD_window_type = '<c:out value="${settlementModel.CST_WINDOW_TYPE}"/>';
	/*
/*
	* 수정불가
	*/
	
	function launchCrossPlatform(){
	      lgdwin = open_paymentwindow(document.getElementById('settlementModel'), '<c:out value="${settlementModel.CST_PLATFORM}"/>', LGD_window_type);
	}

	</script>

</head>

<body>
<div id="LGD_ACTIVEX_DIV"/>

<form:form commandName="settlementModel">
	<form:hidden path="CST_PLATFORM" /> <!-- 테스트, 서비스 구분 -->
	<form:hidden path="CST_MID" /> <!-- 상점아이디 -->
	<form:hidden path="CST_WINDOW_TYPE" />
	<form:hidden path="LGD_MID" /> <!-- 상점아이디 -->
	<form:hidden path="LGD_OID" /> <!-- 주문번호 -->
	<form:hidden path="LGD_BUYER" /> <!-- 구매자 -->
	<form:hidden path="LGD_PRODUCTINFO" /> <!-- 상품정보 -->
	<form:hidden path="LGD_AMOUNT" /> <!-- 결제금액 -->
	<form:hidden path="LGD_BUYEREMAIL" /> <!-- 구매자 이메일 -->
	<form:hidden path="LGD_CUSTOM_SKIN" /> <!-- 결제창 SKIN -->
	<form:hidden path="LGD_CUSTOM_PROCESSTYPE" /> <!-- 트랜잭션 처리방식 -->
	<form:hidden path="LGD_TIMESTAMP" /> <!-- 타임스탬프 -->
	<form:hidden path="LGD_HASHDATA" /> <!-- MD5 해쉬암호값 -->
	<form:hidden path="LGD_PAYKEY" /> <!-- LG데이콤 PAYKEY(인증후 자동셋팅)-->
	<form:hidden path="LGD_RESPCODE" />
	<form:hidden path="LGD_RESPMSG" />
	<form:hidden path="LGD_CUSTOM_USABLEPAY" />
	<form:hidden path="LGD_WINDOW_VER" />
	<form:hidden path="LGD_RETURNURL" />
	<form:hidden path="s_idx" />
</form:form>

<div class="order_pop">
 <div class="order_pop_con">
   <table  class="buss_tb7" border="0" cellspacing="0" cellpadding="0"  >

     <tr>
       <th width="183">구매품목</th>
       <td width="271" class="mdr10"><c:out value="${settlementModel.s_product }"/></td>
     </tr>
     <tr>
       <th class="btiline2">주문번호</th>
       <td class="mdr10"><c:out value="${settlementModel.s_poinvoice }"/></td>
     </tr>
     <tr>
       <th class="btiline2">걸제금액 (<span class="fot8">원,VAT포함</span>)</th>
       <td class="mdr10"><c:out value="${settlementModel.s_price }"/> 원</td>
     </tr>
   </table>
   <br />
   <a href="javascript:launchCrossPlatform();"><img src="/images/sub/btn_pay.gif" alt="결제하기" class="mdl200 mdt15" /></a>
   <!--<img src="../images/sub/btn_payment.gif" alt="payment" class="mdl200 mdt15" />-->
 </div>
 
</div>

<c:out value="${settlementModel.SCRIPT}" escapeXml="false"/>

</body>
</html>
