<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script>
	function fn_Request() {
		if(checkVal()) {
			var msg = "NetMiner 견적 요청이 완료되었습니다.\n\n"
				+ "신청하신 내용을 참고하여 빠른 시일 내에 연락을 드리겠습니다.\n"
				+ "감사합니다.";
			
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
<!--     	 <img src="/images/sub/contitle17.gif" alt="Academic / Commercial"/> -->
      <div class="buybox" >
      	<ul>
      		<li>
      			<img src="/images/sub/buy_title02_version.png" alt="Version Upgrade"/>
      		</li>
      	</ul>
      	
      	<h1 style="margin-top:20px;">Upgrade Options</h1>
        <ul> 
          	<li> 최신의 NetMiner를 사용하시려면, 현재 구입하신 라이선스의 Product ID(CYNMXXXXX)와 아래의 항목을 작성 하신 후 Request 버튼을 클릭해 주시기 바랍니다.
          	<br/>빠른 시간 내에 요청하신 내용에 대해 견적서를 발송해 드리도록 하겠습니다.
			</li>
	        <li class="mdt15">

	<form:form commandName="upgradeModel">

          <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
    <tr>
    <td style="width:209px;" class="brline2">기존 Product ID <span style="color:red;">*</span></td>
    <td style="width:621px;"><form:input path="productid" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="productid"/> <span id="error_msg_productid" class="font12"></span>
    <br/>※ Product ID는 프로그램 실행 후 Help >> About NetMiner 에서 확인할 수 있습니다.</td>
  </tr>
  <tr>
    <td class="brline2">
	    결제방법<span style="color:red;">*</span></td>
    <td>
    	<select id="payment" name="payment" onchange="javascript:fn_keydown(this);" class="input_w280">
			<option value="">- Select One -</option>
			<option value="CreditCard">카드결제</option>
			<option value="BankTransfer">계좌이체</option>
    	</select>
    	 <span id="error_msg_payment" class="font12"></span>
    </td>
  </tr>
  
  <tr>
    <td style="width:209px;" class="brline2">이름 <span style="color:red;">*</span></td>
    <td style="width:621px;"><form:input path="name" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="name"/> <span id="error_msg_name" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">e-mail <span style="color:red;">*</span></td>
    <td><form:input path="email" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="e-mail " /> <span id="error_msg_email" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">회사명/기관명 <span style="color:red;">*</span></td>
    <td><form:input path="organization" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="Company/Organization" /> <span id="error_msg_organization" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">부서명 <span style="color:red;">*</span></td>
    <td><form:input path="department" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="Department" /> <span id="error_msg_department" class="font12"></span> </td>
  </tr>
  <tr>
    <td  class="brline2">직책/직위 <span style="color:red;">*</span></td>
    <td><form:input path="position" onkeyup="javascript:fn_keydown(this);" class="input_w250" alt="Job or position" /> <span id="error_msg_position" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">연락처 <span style="color:red;">*</span></td>
    <td><form:input path="contactinfo" onkeyup="javascript:fn_keydown(this);" class="input_w250" alt="Contact Number" /> <span id="error_msg_contactinfo" class="font12"></span></td>
  </tr>
    
  <tr>
    <td  class="brline2">추가 메시지(optional)</td>
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
         
         <li>전화 : 031-739-8352 <br/> 팩스 : 031-739-8354<br/>
이메일 : <a href="mailto:netminer@cyram.com">netminer@cyram.com</a>  <br/>
         (13494) 경기도 성남시 분당구 대왕판교로 670 유스페이스2 B동 904호</li>
       </ul>
     </div>
     
      </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
