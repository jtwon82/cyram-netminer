<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > <img src="/images/sub/contitle_Buy.gif" alt="appstore"/>
     <div class="buybox" >
        <h1 >주문완료</h1>
        <ul>
         <li>NetMiner 라이선스를 주문해주셔서 감사합니다. <br/>
           <br/>
           주문하신 라이선스에 대한 계좌 정보 및 결제 금액은 다음과 같습니다.<br/>
           <table  class="buss_tb4" border="0" cellspacing="0" cellpadding="0" style="margin:20px 0 20px 20px;" >
            
             <tr>
               <th style="width:151px;" rowspan="4" class="brline2  blline">결제계좌안내</th>
               <td style="width:151px;" class="brline2  blline">은행</td>
               <td style="width:372px;" class="brline2">우리은행</td>
              </tr>
             <tr>
               <td class="brline2 blline">계좌번호</td>
               <td class="brline2">570-276494-13-005</td>
              </tr>
             <tr>
               <td class="brline2 blline">예금주</td>
               <td class="brline2">㈜사이람&nbsp;(대표:&nbsp;김기훈)</td>
              </tr>
             <tr>
               <td class="brline2 blline">결제금액</td>
               <td class="brline2"><span class="font12_red"><c:out value="${buyModel.total}"/>원 </span>(부가세 포함)</td>
              </tr>
           </table>


           <br/>
           참고로 계좌이체의 경우에는 영업일 기준 1~2일 정도 소요될 수 있으며, 
확인 및 결제가 확인되면 주문하신 이메일로 라이선스 키가 발급됩니다. 
<br/>
<br/>
감사합니다.<br/>
<br/>
</li>
  <li class=" mdt15"><strong>NetMiner Team</strong>( <a href="mailto:netminer@cyram.com">netminer@cyram.com</a> )</li>
        </ul>
      </div>
      
      
    </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
