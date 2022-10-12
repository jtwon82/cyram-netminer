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
			
			doAjax("buyEnterpriseModel", "/download_buy/buy/buyEnterprise-create.do", msg, "fn_moveReturn()");
		}
	}
	
	function fn_moveReturn() {
		var buyEnterpriseModel = document.getElementById("buyEnterpriseModel");
		buyEnterpriseModel.action = "/download_buy/buy/buy-view.do";
		buyEnterpriseModel.submit();
	}
	
	function fn_keydown(obj) {
		if(obj.value != '' && obj.value != '0' && $("#error_msg_" + obj.id).html() == "required") {
			$("#error_msg_" + obj.id).html("");
		}
		if(obj.id === "edition") {
			if(obj.value === "Premium") {
				$('input:checkbox').each(function() {
					$(this).attr("disabled", false);
				});
			} else {
				$('input:checkbox').each(function() {
					$(this).attr("checked", false);
					$(this).attr("disabled", true);
				});
			}
		}
	}
	
	function _checkVal() {
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

		if($("#licenseterm").val() == '') {
			return "licenseterm";
		}

		if($("#edition").val() == '') {
			return "edition";
		}

		if($("#numberofusers").val() == '') {
			return "numberofusers";
		}

		if($("#licenseusage").val() == '') {
			return "licenseusage";
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
    <div class="submain" > <img src="/images/sub/contitle_contact_sales.gif" alt="Institute / Commercial / Enterprise"/>
      <div class="buybox" >
        <ul> 
          
          <li> Thank you for your interest in NetMiner.

To meet Brand New NetMiner, complete the form below first and click ‘Request’ button please. NetMiner Team will send you an estimate as soon as possible.</li>
          <li class="mdt15">

	<form:form commandName="buyEnterpriseModel">

          <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
 
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
    <td  class="brline2">Term <span style="color:red;">*</span></td>
    <td>
    	<select id="licenseterm" name="licenseterm" onchange="javascript:fn_keydown(this);" class="input_w280" style="height:20px!important">
			<option value="">- Select One -</option>
			<option value="1year">1 year</option>
			<option value="Perpetual">Perpetual</option>
    	</select>
    	 <span id="error_msg_licenseterm" class="font12"></span>
    </td>
  </tr>
  <tr>
    <td  class="brline2">Plan <span style="color:red;">*</span></td>
    <td>
    	<select id="edition" name="edition" onchange="javascript:fn_keydown(this);" class="input_w280" style="height:20px!important">
			<option value="">- Select One -</option>
			<option value="Standard">Standard: Suitable for Network Analysis</option>
			<option value="Premium">Premium: All features of Standard plan + Machine Learning & Text Mining</option>
    	</select>
    	 <span id="error_msg_edition" class="font12"></span>
    </td>
  </tr>
  <tr>
    <td  class="brline2">Extension</td>
    <td>
    	<input id="sns" name="sns" type="checkbox" disabled="true"/>SNS Data Collector: SNS data collection from Facebook, Twitter and Youtube<br/>
    	<input id="bibl" name="bibl" type="checkbox" disabled="true"/>Biblio Data Collector: Bibliographic data collection from online<br/>
    	<div style="font-size: 12px;">※ All or part of the service could be suspended or terminated by data provider company.</div>
    </td>
  </tr>
  <tr>
    <td  class="brline2">Number of Users <span style="color:red;">*</span></td>
    <td><form:input path="numberofusers" onkeyup="javascript:fn_keydown(this);" class="input_w250" alt="Number of Users" /> <span id="error_msg_numberofusers" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">Usage Purpose <span style="color:red;">*</span></td>
    <td>
    	<select id="licenseusage" name="licenseusage" onchange="javascript:fn_keydown(this);" class="input_w280" style="height:20px!important">
			<option value="">------- Select a Usages of License -------</option> 
			<option value="HRM/HRD">HRM/HRD</option>
			<option value="Knowledge Management">Knowledge Management</option>
			<option value="IT Management">IT Management</option>
			<option value="Risk & Compliance">Risk &amp; Compliance</option>
			<option value="Fraud Management">Fraud Management</option>
			<option value="Criminal Intelligence">Criminal Intelligence</option>
			<option value="Customer Intelligence">Customer Intelligence</option>
			<option value="Marketing">Marketing</option>
			<option value="Partnet Intelligence">Partnet Intelligence</option>
			<option value="SNS Analytics">SNS Analytics</option>
			<option value="Personal information management(PIM)">Personal information management(PIM)</option>
			<option value="Scientometrics">Scientometrics</option>
			<option value="Network Visualization">Network Visualization</option>                                  
			<option value="Payment System Management">Payment System Management</option>
			<option value="Price Forecasting / Goods Recommendation">Price Forecasting / Goods Recommendation</option>
			<option value="E-Learning">E-Learning</option>
			<option value="General-Purpose / etc.">General-Purpose / etc.</option>
    	</select>
    	 <span id="error_msg_licenseusage" class="font12"></span>
    </td>
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
<!--      <div class="buybox05"> -->
<!--       <h1  class="mdt20">License</h1> -->
<!--        <ul> -->
         
<!--          <li>1. Institute Use<br/> -->
<!-- (1) Licensee: The licensee must be an institution, which performs research and development activities, a government agency, or a not-for-profit organization and must not be affiliated with any commercial corporations.<br/> -->
<!-- (2) Usage: Not specifically restricted.</li> -->
<!--          <li class="mdt10">2. Commercial Use<br/> -->
<!-- (1) Licensee: Not specifically restricted.<br/> -->
<!-- (2) Usage: Not specifically restricted.</li> -->
<!-- <li class="mdt10">3. Enterprise Use<br/> -->
<!-- (1) Licensee: Not specifically restricted.<br/> -->
<!-- (2) Usage: Not specifically restricted.<br/> -->
<!-- (3) Data Size: Unlimited.<br/> -->
<!-- (4) Network License Version</li> -->
      
<!--        </ul> -->
<!--      </div> -->
     
     
      </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
