<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="lgdacom.XPayClient.XPayClient"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Review your order</title>
<link rel="stylesheet" type="text/css" href="/css/common.css" />

<%
	/*
	 * [최종결제요청 페이지(STEP2-2)]
	 *
	 * LG텔레콤으로 부터 내려받은 LGD_PAYKEY(인증Key)를 가지고 최종 결제요청.(파라미터 전달시 POST를 사용하세요)
	 */

  // 개발용
  // String configPath = "C:/dev/netminerhome/PayTest/src/main/webapp/lgdacom"; //LG텔레콤에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
  // 운영용
  String configPath = request.getAttribute("configPath").toString();
  
	/*
	 *************************************************
	 * 1.최종결제 요청 - BEGIN
	 *  (단, 최종 금액체크를 원하시는 경우 금액체크 부분 주석을 제거 하시면 됩니다.)
	 *************************************************
	 */

	String CST_PLATFORM = request.getAttribute("platform").toString();
	String CST_MID = request.getAttribute("mid").toString();
	String LGD_MID = ("test".equals(CST_PLATFORM.trim()) ? "t" : "") + CST_MID;
	String LGD_PAYKEY = request.getParameter("LGD_PAYKEY");

	//해당 API를 사용하기 위해 WEB-INF/lib/XPayClient.jar 를 Classpath 로 등록하셔야 합니다. 
	XPayClient xpay = new XPayClient();
	StringBuffer result = new StringBuffer();
	
	boolean isInitOK = xpay.Init(configPath, CST_PLATFORM);

	if (!isInitOK) {
		//API 초기화 실패 화면처리
    result.append("<span style='font-weight:bold;color:#338700;font-size:1.5em;'>결제 실패</span><br/><br/>");
    result.append("죄송합니다. 요청하신 서비스가 정상 처리되지 않았습니다.<br/><br/>");
    result.append("NetMiner Team <a style='color:blue;text-decoration:underline;' href='mailto:netminer@cyram.com'>netminer@cyram.com</a>, 031-739-8352<br/><br/>");
    result.append("상기 연락처로 문의 주시면 신속하게 처리해 드리도록 하겠습니다.<br/><br/>");
    result.append("불편을 드려 죄송합니다.<br/><br/>");
    result.append("감사합니다.");
		return;

	} else {
		try {
			/*
			 *************************************************
			 * 1.최종결제 요청(수정하지 마세요) - END
			 *************************************************
			 */
			xpay.Init_TX(LGD_MID);
			xpay.Set("LGD_TXNAME", "PaymentByKey");
			xpay.Set("LGD_PAYKEY", LGD_PAYKEY);

			//금액을 체크하시기 원하는 경우 아래 주석을 풀어서 이용하십시요.
			//String DB_AMOUNT = "DB나 세션에서 가져온 금액"; //반드시 위변조가 불가능한 곳(DB나 세션)에서 금액을 가져오십시요.
			//xpay.Set("LGD_AMOUNTCHECKYN", "Y");
			//xpay.Set("LGD_AMOUNT", DB_AMOUNT);

		} catch (Exception e) {
		    result.append("<span style='font-weight:bold;color:#338700;font-size:1.5em;'>결제 실패</span><br/><br/>");
		    result.append("죄송합니다. 요청하신 서비스가 정상 처리되지 않았습니다.<br/><br/>");
		    result.append("NetMiner Team <a style='color:blue;text-decoration:underline;' href='mailto:netminer@cyram.com'>netminer@cyram.com</a>, 031-739-8352<br/><br/>");
		    result.append("상기 연락처로 문의 주시면 신속하게 처리해 드리도록 하겠습니다.<br/><br/>");
		    result.append("불편을 드려 죄송합니다.<br/><br/>");
		    result.append("감사합니다.");
			return;
		}
	}

	/*
	 * 2. 최종결제 요청 결과처리
	 *
	 * 최종 결제요청 결과 리턴 파라미터는 연동메뉴얼을 참고하시기 바랍니다.
	 */
	if (xpay.TX()) {
        result.append("<span style='font-weight:bold;color:#338700;font-size:1.5em;'>결제 완료</span><br/><br/>");
        result.append("주문하신 내역에 대한 결제가 완료되었습니다.<br/>");
        result.append("결제가 확인 되는 대로 라이선스가 발급될 예정이며,<br/>");
        result.append("라이선스 발급까지는 영업일 기준 1~2일 정도 소요됩니다.<br/><br/>");
        result.append("감사합니다.<br/><br/>");
        result.append("<ul><li style='list-style-type:disc;float:right;'>NetMiner Team <a style='color:blue;text-decoration:underline;' href='mailto:netminer@cyram.com'>netminer@cyram.com</a></li></ul>");
		if ("0000".equals(xpay.m_szResCode)) {
	//최종결제요청 결과 성공 DB처리
			//TODO
			//			DbFromJsp dfj=new DbFromJsp();
			//			dfj.updateSettlementPaidStatus(request);         	
		} else {
			//최종결제요청 결과 실패 DB처리
			  result = new StringBuffer();
			    result.append("<span style='font-weight:bold;color:#338700;font-size:1.5em;'>결제 실패</span><br/><br/>");
			    result.append("죄송합니다. 요청하신 서비스가 정상 처리되지 않았습니다.<br/><br/>");
			    result.append("NetMiner Team <a style='color:blue;text-decoration:underline;' href='mailto:netminer@cyram.com'>netminer@cyram.com</a>, 031-739-8352<br/><br/>");
			    result.append("상기 연락처로 문의 주시면 신속하게 처리해 드리도록 하겠습니다.<br/><br/>");
			    result.append("불편을 드려 죄송합니다.<br/><br/>");
			    result.append("감사합니다.");
		}
	} else {
		//2)API 요청실패 화면처리
	    result.append("<span style='font-weight:bold;color:#338700;font-size:1.5em;'>결제 실패</span><br/><br/>");
	    result.append("죄송합니다. 요청하신 서비스가 정상 처리되지 않았습니다.<br/><br/>");
	    result.append("NetMiner Team <a style='color:blue;text-decoration:underline;' href='mailto:netminer@cyram.com'>netminer@cyram.com</a>, 031-739-8352<br/><br/>");
	    result.append("상기 연락처로 문의 주시면 신속하게 처리해 드리도록 하겠습니다.<br/><br/>");
	    result.append("불편을 드려 죄송합니다.<br/><br/>");
	    result.append("감사합니다.");
	}
%>
</head>

<body>
<div class="order_pop2">
 <div class="order_pop_con">
	<%=result.toString() %>
 </div>
 <div style='margin-top:20px;'>
   <a style='margin-left:270px' href='javascript:self.close()'><img src="/images/sub/btn_close.gif"></img></a>
 </div>
</div>
</body>
</html>

