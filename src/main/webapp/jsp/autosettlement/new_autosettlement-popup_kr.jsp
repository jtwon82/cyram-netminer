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
		function doPay_ActiveX(){
			var frm = document.getElementById("settlementModel");
			ret = xpay_check(frm, '<c:out value="${settlementModel.CST_PLATFORM}"/>');

			if (ret=="00"){     //ActiveX 로딩 성공
				var LGD_RESPCODE        = dpop.getData('LGD_RESPCODE');       //결과코드
				var LGD_RESPMSG         = dpop.getData('LGD_RESPMSG');        //결과메세지

				if( "0000" == LGD_RESPCODE ) { //인증성공
					var LGD_PAYKEY      = dpop.getData('LGD_PAYKEY');         //LG데이콤 인증KEY
					var msg = "인증결과 : " + LGD_RESPMSG + "\n";
					msg += "LGD_PAYKEY : " + LGD_PAYKEY +"\n\n";
					document.getElementById('LGD_PAYKEY').value = LGD_PAYKEY;
					alert(msg);
					
					frm.action = ".jsp";
					frm.submit();
				} else { //인증실패
					alert("인증이 실패하였습니다. " + LGD_RESPMSG);
				}
			} else {
				alert("LG U+ 전자결제를 위한 ActiveX Control이  설치되지 않았습니다. ");
				/*
				 * 인증실패 화면 처리
				 */
			}      
		}

		function isActiveXOK(){
			if(lgdacom_atx_flag == true){
				document.getElementById('LGD_BUTTON1').style.display='none';
				document.getElementById('LGD_BUTTON2').style.display='';
			}else{
				document.getElementById('LGD_BUTTON1').style.display='';
				document.getElementById('LGD_BUTTON2').style.display='none';	
			}
		}
	</script>

</head>

<body>
<div id="LGD_ACTIVEX_DIV"/>

<form:form commandName="settlementModel" id="settlementModel">
	<form:hidden path="CST_PLATFORM" /> <!-- 테스트, 서비스 구분 -->
	<form:hidden path="CST_MID" /> <!-- 상점아이디 -->
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
	<form:hidden path="LGD_VERSION" />
	<form:hidden path="LGD_CUSTOM_USABLEPAY" />
</form:form>

<form id="info" method="post" action="">
		<div>
			
			<input type="hidden" name="LGD_MID" value="<c:out value='${settlementModel.LGD_MID}' />"/>
			<input type="hidden" name="LGD_OID" value="<c:out value='${settlementModel.LGD_OID}' />"/>
			<input type="hidden" name="LGD_BUYER" value="<c:out value='${settlementModel.LGD_BUYER}' />"/>
			<input type="hidden" name="LGD_PRODUCTINFO" value="<c:out value='${settlementModel.LGD_PRODUCTINFO}' />"/>	
			<input type="hidden" name="LGD_AMOUNT" value="<c:out value='${settlementModel.LGD_AMOUNT}' />"/>
			<input type="hidden" name="LGD_CUSTOM_SKIN" value="<c:out value='${settlementModel.LGD_CUSTOM_SKIN}' />"/>
			<input type="hidden" name="LGD_TIMESTAMP" value="<c:out value='${settlementModel.LGD_TIMESTAMP}' />"/>
			<input type="hidden" name="LGD_HASHDATA" value="<c:out value='${settlementModel.LGD_HASHDATA}' />"/>
			<input type="hidden" name="LGD_TIMESTAMP" value="<c:out value='${settlementModel.LGD_TIMESTAMP}' />"/>
			<input type="hidden" name="LGD_PAYKEY" value="<c:out value='${settlementModel.LGD_PAYKEY}' />"/>
			<input type="hidden" name="LGD_CUSTOM_USABLEPAY" value="<c:out value='${settlementModel.LGD_CUSTOM_USABLEPAY}' />"/>
		</div>
</form>



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
   <a href="javascript:doPay_ActiveX();"><img src="/images/sub/btn_pay.gif" alt="결제하기" class="mdl200 mdt15" /></a>
   <!--<img src="../images/sub/btn_payment.gif" alt="payment" class="mdl200 mdt15" />-->
 </div>
 
</div>

<c:out value="${settlementModel.SCRIPT}" escapeXml="false"/>

</body>
</html>
