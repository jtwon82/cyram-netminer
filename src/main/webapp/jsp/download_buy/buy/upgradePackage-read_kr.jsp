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

	
	function fn_Request_kr() {
		if(checkVal()) {
			var msg = "NetMiner 견적 요청이 완료되었습니다.\n\n"
					+ "신청하신 내용을 참고하여 빠른 시일 내에 연락을 드리겠습니다.\n"
					+ "감사합니다.";
			
			doAjax( "upgradeModel", "/download_buy/buy/upgradePackage-create.do", msg, "fn_moveReturn()");
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

			if ($("#payment").val() == '') {
				return "payment";
			}

			if ($("#name").val() == '') {
				return "name";
			}

			if ($("#name").val() == '') {
				return "name";
			}

			if ($("#email").val() == '') {
				return "email";
			}

			if ($("#organization").val() == '') {
				return "organization";
			}

			if ($("#department").val() == '') {
				return "department";
			}

			if ($("#position").val() == '') {
				return "position";
			}

			if ($("#contactinfo").val() == '') {
				return "contactinfo";
			}

			return "";
		}

		function checkVal() {
			var objId = _checkVal();

			if (objId != '') {
				setErrorMsg("error_msg_" + objId, "red", "required");
				$("#" + objId).focus();
				return false;
			}

			return true;
		}

		function setData() {
			if ($("#data_check").prop("checked")) {
				$("select[name='datasize']").attr("disabled", false);
				$("#datasize").attr("style",
						"border:1px solid #333; color:#000;");
			} else {
				$("select[name='datasize']").val("");
				$("select[name='datasize']").attr("disabled", true);
				$("#datasize")
						.attr("style", "border:1px solid; color:#bbbbbb;");

			}
		}

		function setPackage() {
			if ($("#package_check").prop("checked")) {
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
          	현재보다 더 나은 기능의 NetMiner를 사용하시려면, 현재 구입하신 라이선스의 Product ID(CYNMXXXXX)와 추가/변경하려는 항목을 선택하고 추가 정보를 작성하여 Request 버튼을 클릭해 주시기 바랍니다.<br/> 
			빠른 시간 내에 요청하신 내용에 대해 결제 안내 또는 견적서를 발송해 드리도록 하겠습니다.
          </li>
          <li class="mdt15">

	<form:form commandName="upgradeModel" method="post" enctype="multipart/form-data">

          <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
     <tr>
    <td style="width:209px;" class="brline2">기존 Product ID <span style="color:red;">*</span></td>
    <td style="width:621px;"><form:input path="productid" onkeyup="javascript:fn_keydown(this);" class="input_w200" alt="productid"/> <span id="error_msg_productid" class="font12"></span>
    <br/>※ Product ID는 프로그램 실행 후 Help >> About NetMiner 에서 확인할 수 있습니다.</td>
  </tr>

  <tr>
  	<td style="width:209px; border-bottom:0;" class="brline2">사양 변경 <span style="color:red;">*</span></td>
  	<td style="border-bottom:0"></td>
  </tr>
 
  <tr >
    <td  class="brline2" style="padding-left:50px;">
	  <input type='checkbox' id='data_check' onclick='javascript:setData();'/>  
	    플랜</td>
    <td>
    	<select id="datasize" name="datasize" onchange="javascript:fn_keydown(this);" class="input_w280" DISABLED>
			<option id="selectData" value="">- Select One -</option>
			<option value="Standard">Standard: 네트워크 분석에 적합</option>
			<option value="Premium">Premium: Standard의 모든 기능 + 텍스트 마이닝 및 머신 러닝</option>
    	</select>
    	 <span id="error_msg_datasize" class="font12"></span>
    </td>
  </tr>
 
  <tr hidden='true'>
    <td  class="brline2"  style="padding-left:50px;">
    	<input type='checkbox' id='package_check' onclick='javascript:setPackage();'/>
   	 	패키지 추가 </td>
    <td>
    	<table border="0" width="100%">
				<c:forEach var="packageModel"
					items="${upgradeModel.packageModelList}">
	
					<tr>
						<td style="width:30px;"><input type="checkbox" path="packages" name="packages"
								value="${packageModel.label}" disabled/></td>
						<td style="width:250px;"><c:out value="${packageModel.label}"
								escapeXml="false" /></td>
					</tr>
	
				</c:forEach>
	
			</table>
    	 <span id="error_msg_packages" class="font12"></span>
    </td>
  </tr>
  <tr>
  	<td class="brline2" style="padding-left:50px;">
  		<input type="checkbox" id="extension_check" onclick="setExtension();"/>
  		확장프로그램 추가</td>
  	<td>
  		<div>
  			<ul>
  				<li><input type="checkbox" id="sns" name="sns" disabled/> SNS Data Collector: 소셜 미디어 데이터 수집 및 분석</li>
  				<li><input type="checkbox" id="bibl" name="bibl" disabled/> Biblio Data Collector: 학술 문헌 데이터 수집 및 분석</li>
  			</ul>
  		</div>
  	</td>
  </tr>

  <tr>
    <td  class="brline2">
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
    <td><form:input path="organization" onkeyup="javascript:fn_keydown(this);" class="input_w100" alt="Company/Organization" /> <span id="error_msg_organization" class="font12"></span></td>
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
    <td  class="brline2">추가 메세지(optional)</td>
    <td><form:textarea path="message" class="txt_w400"/></td>
  </tr>
</table>
          
	</form:form>

          </li>
        <li class="mdl300">
      <a href="javascript:fn_Request_kr();">
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
