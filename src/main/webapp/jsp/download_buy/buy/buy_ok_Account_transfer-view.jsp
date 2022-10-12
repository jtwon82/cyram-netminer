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
        <ul>
         <li>Thank you for purchasing NetMiner<br/>
           <br/>
           Here is the bank information for your payment.<br/>
           <table  class="buss_tb4" border="0" cellspacing="0" cellpadding="0" style="margin:20px 0 20px 20px;" >
            
             <tr>
               <th style="width:151px;" rowspan="6" class="brline2  blline">Bank Information</th>
               <td style="width:151px;" class="brline2  blline">Account</td>
               <td style="width:372px;" class="brline2">570-276494-13-005</td>
              </tr>
             <tr>
               <td class="brline2 blline">Company Name</td>
               <td class="brline2">Cyram Inc.</td>
              </tr>
             <tr>
               <td class="brline2 blline">Swift Code</td>
               <td class="brline2">HVBKKRSEXXX</td>
              </tr>
             <tr>
               <td class="brline2 blline">Bank Name</td>
               <td class="brline2">WOORI BANK</td>
              </tr>
             <tr>
               <td class="brline2 blline">Bank Address</td>
               <td class="brline2">HAPCHONG-DONG Br. 373-4, hapchong-dong, mapo-ku, Seoul, South Korea</td>
              </tr>
             <tr>
               <td class="brline2 blline">Due total</td>
               <td class="brline2"><span class="font12_red">USD <c:out value="${buyModel.total}"/></span></td>
              </tr>
           </table>

           <br/>
           Due Total has included fee imposed by our bank.
           <br/>
           And international bank transfer would take around 1 to 5 working days to be successfully
           <br/>
           After making your payment, we’ll send your License key by e-mail.
<br/>
<br/>
Thank you.<br/>
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
