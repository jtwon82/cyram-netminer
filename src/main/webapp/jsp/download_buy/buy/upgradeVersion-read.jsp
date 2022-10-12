<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script>
	function fn_Request() {
		if(checkVal()) {
			var msg = "Thank you very much!\n\n"
					+ "Your request has been completed.\n"
					+ "We will send you an estimate as soon as possible. Thank you very much.";
			
			doAjax("upgradeModel", "/download_buy/buy/upgradeVersion-create.do", msg, "fn_moveReturn()");
		}
	}
	
	function fn_moveReturn() {
		var upgradeModel = document.getElementById("upgradeModel");
		upgradeModel.action = "/download_buy/buy/buy-view.do";
		upgradeModel.submit();
	}
	
	function fn_keydown(obj) {
		if(obj.value != '' && obj.value != '0' && $("#error_msg_" + obj.id).html() == "required") {
			$("#error_msg_" + obj.id).html("");
		}
	}
	
	function _checkVal() {
		if($("#productid").val() == '') {
			return "productid";
		}
		
		if($("#payment").val() == '') {
			return "payment";
		}
		
		if($("#name").val() == '') {
			return "name";
		}

		if($("#email").val() == '') {
			return "email";
		}

		if($("#organization").val() == '') {
			return "organization";
		}

		if($("#department").val() == '') {
			return "department";
		}

		if($("#position").val() == '') {
			return "position";
		}

		if($("#contactinfo").val() == '') {
			return "contactinfo";
		}

		return "";
	}	

	function checkVal() {
		var objId = _checkVal();
		
		if(objId != '') {
			setErrorMsg("error_msg_" + objId, "red", "required");
			$("#" + objId).focus();
			return false;
		}
		
		return true;
	}
	</script>

</head>
	
<body>

	
  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > 
<!--     <img src="/images/sub/contitle17.gif" alt="Academic / Commercial"/> -->
      <div class="buybox" >
	      <ul>
	      		<li>
	      			<img src="/images/sub/buy_title02_version.png" alt="Version Upgrade"/>
	      		</li>
	      	</ul>
      	<h1 style="margin-top:20px;">Upgrade Options</h1>
        <ul> 
          <li> Thank you for your interest in NetMiner.<br/>

To meet Brand New NetMiner, complete the from below first with your NetMiner product ID you want to upgrade and click ‘Request’ button please. NetMiner Team will send you an estimate as soon as possible.</li>
          <li class="mdt15">

	<form:form commandName="upgradeModel">

          <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
   <tr>
    <td style="width:209px;" class="brline2">NetMiner Product ID <span style="color:red;">*</span></td>
    <td style="width:621px;"><form:input path="productid" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="productid"/> <span id="error_msg_productid" class="font12"></span>
    <br/>※ You can find your Product ID in NetMiner menu Help >> About NetMiner
    </td>
  </tr>
  <tr>
    <td class="brline2">
	   Payment Methods<span style="color:red;">*</span></td>
    <td>
    	<select id="payment" name="payment" onchange="javascript:fn_keydown(this);" class="input_w280">
			<option value="">- Select One -</option>
			<option value="CreditCard">Credit Card(PayPal)</option>
			<option value="BankTransfer">Bank Transfer</option>
    	</select>
    	 <span id="error_msg_payment" class="font12"></span>
    </td>
  </tr>
  <tr>
    <td style="width:209px;" class="brline2">Name <span style="color:red;">*</span></td>
    <td style="width:621px;"><form:input path="name" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="name"/> <span id="error_msg_name" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">e-mail <span style="color:red;">*</span></td>
    <td><form:input path="email" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="e-mail " /> <span id="error_msg_email" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">Company/Organization <span style="color:red;">*</span></td>
    <td><form:input path="organization" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="Company/Organization" /> <span id="error_msg_organization" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">Department <span style="color:red;">*</span></td>
    <td><form:input path="department" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="Department" /> <span id="error_msg_department" class="font12"></span> </td>
  </tr>
  <tr>
    <td  class="brline2">Job or position <span style="color:red;">*</span></td>
    <td><form:input path="position" onkeyup="javascript:fn_keydown(this);" class="input_w250" alt="Job or position" /> <span id="error_msg_position" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">Contact Number <span style="color:red;">*</span></td>
    <td><form:input path="contactinfo" onkeyup="javascript:fn_keydown(this);" class="input_w250" alt="Contact Number" /> <span id="error_msg_contactinfo" class="font12"></span></td>
  </tr>

  <tr>
    <td  class="brline2">Message(optional)</td>
    <td><form:textarea path="message" class="txt_w400"/></td>
  </tr>
</table>
          
	</form:form>

          </li>
           
      <li class="mdl300">
      <a href="javascript:fn_Request();">
       <img src="/images/sub/btn_request.gif" alt="Request"/>
      </a>
      </li>
         
        </ul>
      </div>
     <div class="buybox">
      <h1  class="mdt20">Contact Information</h1>
       <ul>
         
         <li>Tel: +82-31-739-8352 (09:00-11:30,13:00!18:30(KST),Weekdays)<br/>Fax: +82-31-739-8354<br/>
e-mail: <a href="mailto:netminer@cyram.com">netminer@cyram.com</a> <br/>
         Address: #904, U-Space 2B, 670, Daewangpangyo-ro, Bundang-gu, Seongnam-si, Gyeonggi-do, 13494, South Korea</li>
       </ul>
     </div>
     
     
      </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
