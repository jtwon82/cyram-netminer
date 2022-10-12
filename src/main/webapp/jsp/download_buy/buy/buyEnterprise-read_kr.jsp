<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script>

	function fn_Request_kr() {
		if(checkVal()) {
			var msg = "NetMiner 견적 요청이 완료되었습니다.\n\n"
					+ "신청하신 내용을 참고하여 빠른 시일 내에 연락을 드리겠습니다.\n"
					+ "감사합니다.";
			
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
          
          <li> NetMiner의 견적 문의에 감사드립니다.<br></br>
                        				 더욱 새로워진 NetMiner를 만나기 위해 아래의 항목을 작성 하신 후 Request 버튼을 클릭해 주시기 바랍니다. 빠른 시간 내에 요청하신 내용에 대해 견적서를 발송해 드리도록 하겠습니다.</li>
          <li class="mdt15">

	<form:form commandName="buyEnterpriseModel">

          <table border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
 
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
    <td  class="brline2">사용기간 <span style="color:red;">*</span></td>
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
    <td  class="brline2">플랜 <span style="color:red;">*</span></td>
    <td>
    	<select id="edition" name="edition" onchange="javascript:fn_keydown(this);" class="input_w280" style="height:20px!important">
			<option value="">- Select One -</option>
			<option value="Standard">Standard: 네트워크 분석에 적합</option>
			<option value="Premium">Premium: Standard의 모든 기능 + 텍스트 마이닝 및 머신 러닝</option>
    	</select>
    	 <span id="error_msg_edition" class="font12"></span>
    </td>
  </tr>
  <tr>
    <td  class="brline2">확장 프로그램</td>
    <td>
    	<input id="sns" name="sns" type="checkbox" disabled="true"/>SNS Data Collector: 소셜 미디어 데이터 수집 및 분석<br/>
    	<input id="bibl" name="bibl" type="checkbox" disabled="true"/>Biblio Data Collector: 학술 문헌 데이터 수집 및 분석<br/>
    	<div style="font-size: 12px;">※ 데이터 제공 기관의 운영 정책이 변경되면 서비스가 중단되거나 변경될 수 있습니다.</div>
    </td>
  </tr>
  <tr>
    <td  class="brline2">사용자 수 <span style="color:red;">*</span></td>
    <td><form:input path="numberofusers" onkeyup="javascript:fn_keydown(this);" class="input_w250" alt="Number of Users" /> <span id="error_msg_numberofusers" class="font12"></span></td>
  </tr>
  <tr>
    <td  class="brline2">사용용도 <span style="color:red;">*</span></td>
    <td>
    	<select id="licenseusage" name="licenseusage" onchange="javascript:fn_keydown(this);" class="input_w280" style="height:20px!important">
			<option value="">------- 사용용도를 선택하세요. -------</option> 
			<option value="인사관리">인사관리</option>
			<option value="지식관리">지식관리</option>
			<option value="IT 관리">IT 관리</option>
			<option value="리스크관리">리스크관리</option>
			<option value="사기적발">사기적발</option>
			<option value="첩보분석/범죄수사">첩보분석/범죄수사</option>
			<option value="고객관리">고객관리</option>
			<option value="마케팅">마케팅</option>
			<option value="파트너관리">파트너관리</option>
			<option value="SNS 분석">SNS 분석</option>
			<option value="인물정보관리">인물정보관리</option>
			<option value="학술문헌정보관리">학술문헌정보관리</option>
			<option value="일반연계정보시각화">일반연계정보시각화</option>                                  
			<option value="지급결제시스템 관리">지급결제시스템 관리</option>
			<option value="가격예측/상품추천시스템">가격예측/상품추천시스템</option>
			<option value="E-Learning">E-Learning</option>
			<option value="기타/일반분석">기타/일반분석</option>
    	</select>
    	 <span id="error_msg_licenseusage" class="font12"></span>
    </td>
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
         주소 : (13494) 경기도 성남시 분당구 대왕판교로 670 유스페이스2 B동 904호</li>
       </ul>
     </div>
      </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
