<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<style type="text/css">
		select#datasize{
			border : 1px solid;
			color : #BBBBBB;
			
		}
		
	</style>
	<script>
	function fn_Request() {
		if(checkVal()) {
			var msg = "Thank you very much!\n\n"
					+ "Your request has been completed.\n"
					+ "We will send you an estimate as soon as possible. Thank you very much.";
			
			doAjax("upgradeModel", "/download_buy/buy/upgradePackage-create.do", msg, "fn_moveReturn()");
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
		
		if (!$("#data_check").prop("checked")
				&& !$("#package_check").prop("checked")
				&& (!$("#extension_check").prop("checked") || (!$("#sns").prop("checked") && !$("#bibl").prop("checked")))) {
			return "data_check";
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
	
	function setData() {
		if($("#data_check").prop("checked")) {
			 $("select[name='datasize']").attr("disabled",false);
			 $("#datasize").attr("style", "border:1px solid #333; color:#000;");
		} else {
			$("select[name='datasize']").val("");
			 $("select[name='datasize']").attr("disabled",true);
			 $("#datasize").attr("style", "border:1px solid; color:#bbbbbb;");
			 
			 
		}
	}
	
	function setPackage() {
		if($("#package_check").prop("checked")) {
			$("input:checkbox[name='packages']").attr("disabled", false);
		} else {
			$("input:checkbox[name='packages']").attr("checked", false);
			$("input:checkbox[name='packages']").attr("disabled", true);
		}
	}
	
	function setExtension() {
		if ($("#extension_check").prop("checked")) {
			$("input:checkbox[name='sns']").attr("disabled", false);
			$("input:checkbox[name='bibl']").attr("disabled", false);
		} else {
			$("input:checkbox[name='sns']").attr("disabled", true);
			$("input:checkbox[name='bibl']").attr("disabled", true);
			$("input:checkbox[name='sns']").attr("checked", false);
			$("input:checkbox[name='bibl']").attr("checked", false);
		}
	}
	</script>

</head>
	
<body>

	
  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > 
<!--     <img src="/images/sub/contitle17.gif" alt="Institute / Commercial / Enterprise"/> -->
      <div class="buybox" >
      	<ul>
      		<li>
      			<img src="/images/sub/contitle_contact_sales.gif" alt="Package&Data Upgrade"/>
      		</li>
      	</ul>	
      	<h1 style="margin-top:20px;">Upgrade Options</h1>
        <ul> 
          <li>
          Thank you for your interest in NetMiner. To meet Brand New NetMiner, complete the form below first with your NetMiner product ID you want to upgrade and click ‘Request’ button please.
          <br/> NetMiner Team will send you an estimate as soon as possible
          </li>
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
  	<td style="width:209px; border-bottom:0;" class="brline2">Upgrade Options <span style="color:red;">*</span></td>
  	<td style="border-bottom:0"></td>
  </tr>
 
  <tr>
    <td  class="brline2" style="padding-left:50px;">
	  <input type='checkbox' id='data_check' onclick='javascript:setData();'/>  
	    Plan </td>
    <td>
    	<select id="datasize" name="datasize" onchange="javascript:fn_keydown(this);" class="input_w280" DISABLED>
			<option id="selectData" value="">- Select One -</option>
			<option value="Standard">Standard: Suitable for Network Analysis</option>
			<option value="Premium">Premium: All features of Standard plan + Machine Learning & Text Mining</option>
    	</select>
    	 <span id="error_msg_datasize" class="font12"></span>
    </td>
  </tr>
 
  <tr hidden='true'>
    <td  class="brline2" style="padding-left:50px;">
    	<input type='checkbox' id='package_check' onclick='javascript:setPackage();'/>
   	 	Add Packages </td>
    <td>
    	<table border="0" width="100%">
				<c:forEach var="packageModel" items="${upgradeModel.packageModelList}">
					<tr>
						<td style="width:30px;"><input type="checkbox" path="packages" name="packages" value="${packageModel.label}" DISABLED/></td>
						<td style="width:250px;"><c:out value="${packageModel.label}" escapeXml="false" /></td>
					</tr>
	
				</c:forEach>
	
			</table>
    	 <span id="error_msg_packages" class="font12"></span>
    </td>
  </tr>
  
    <tr>
  	<td class="brline2" style="padding-left:50px;">
  		<input type="checkbox" id="extension_check" onclick="setExtension();"/>
  		Add Extension</td>
  	<td>
  		<div>
  			<ul>
  				<li><input type="checkbox" id="sns" name="sns" disabled/> SNS Data Collector: SNS data collection from Facebook, Twitter and Youtube</li>
  				<li><input type="checkbox" id="bibl" name="bibl" disabled/> Biblio Data Collector: Bibliographic data collection from online</li>
  			</ul>
  		</div>
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
