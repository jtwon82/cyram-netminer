<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript" src="/js/jquery-relation.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
<script type="text/javascript">
	function fn_Request_kr() {
		if(checkVal()) {
			//doAjax("saleModel", "/download_buy/buy/free-create.do", msg, "fn_Return()");

			$("form[id=saleModel]").ajaxSubmit({
				url : "/download_buy/buy/free-create.do",
				type : "post",
				success : function(data) {
					if (data == null || data == '') {
						alert('An error has occurred.');

					} else if(data=='NOT_FOUND_LOGINID'){
						if(confirm("<c:out value = '${msg_login_confirm}'/>")) {
							location.href = "/login/login-read.do";
						}
						
					} else if (data.indexOf("error_message") > -1) {
						//에러면
						$("#return_message").html(data);
						alert($("#error_message").html());
						$("#return_message").html("");
						return;
							
					} else if(data=='SUCCESS'){
						//성공이면
						alert("신청이 완료되었습니다.");
						
						location.replace('/download_buy/buy/buy-view.do');
						
					} else {
						console.log( 'fail' );
					}
				}
			});
		}
	}
	function checkVal(){
		var f= document.saleModel;

		if(f.APPLCNT_NM.value==''){	alert("신청자이름 을 입력해주세요."); f.APPLCNT_NM.focus();	return false;	}
		if(f.PSITN_INSTT.value==''){	alert("소속기관 을 입력해주세요."); f.PSITN_INSTT.focus(); return false;	}
		if(f.PSITN_SUBJCT.value==''){	alert("소속학과 을 입력해주세요."); f.PSITN_SUBJCT.focus();	return false;	}
		if(f.CHARGER_EMAIL.value==''){	alert("담당자이메일 을 입력해주세요."); f.CHARGER_EMAIL.focus();	return false;	}
		if(f.LCTRE_NM.value==''){	alert("강의이름 을 입력해주세요."); f.LCTRE_NM.focus();	return false;	}
		if(f.ATNLC_NMPR.value==''){	alert("수강인원 을 입력해주세요."); f.ATNLC_NMPR.focus();	return false;	}
// 		if(f.LCTRE_INTRCN.value==''){	alert("강의소개 을 입력해주세요."); f.LCTRE_INTRCN.focus();	return false;	}

		var chkCnt= 0;
		if(f.LCTRE_INTRCN.value.trim()==''){		chkCnt++;	}
		if(f.attach_files.value.trim()==''){		chkCnt++;	}
		if(chkCnt>1){	alert("강의내용또는 첨부파일을 입력해주세요.");	return false;	}
		
		if(!f.agree2.checked){		alert("개인정보 보호정책에 동의하셔야합니다.");	return false;	}
		//if(!f.agree3){		return false;	}
		
		return true;
	}
</script>
<style type="text/css">
	.select2-selection--single{ width:217px; }
</style>
</head>

<body onload="">
	<div id="editionpackage" style="display: none"></div>
	<!--하단컨텐츠-->
	<div id="container02">

		<form:form commandName="saleModel" name="saleModel" method="post"
			enctype="multipart/form-data">

			<div id="sale_id_div"></div>

			<div class="submain">
				<div class="buybox08" style="font-size: 26px;font-weight: bold;text-decoration-line: underline;"><img src="/images/sub/contitle_free_educational.png"/></div>
				<div class="buybox08">
						<ul>
							<li class=" font12_black" style="padding:20px 0;">Free Educational 은 교육 기관의 강사 또는 교수자를 위한 플랜입니다.<br>
								강의/수업을 목적으로 NetMiner를 무료로 이용할 수 있습니다.
							</li>
							<li class="content_table">
				<table width="610" border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">성함</td>
						<td class="mdt15 mdb10"><form:input path="APPLCNT_NM" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">국가</td>
						<td class="mdt15 mdb10"><form:select path="NATION_CODE" value="${NATION_CODE }"
							items="${saleModel.nationList}" itemLabel="NATION_NAME_KR" itemValue="NATION_CODE"
								class="" style="width:217px;"/><script>$("select").select2();</script></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">소속 기관</td>
						<td class="mdt15 mdb10"><form:input path="PSITN_INSTT" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">소속 학과</td>
						<td class="mdt15 mdb10"><form:input path="PSITN_SUBJCT" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">담당자 이메일</td>
						<td class="mdt15 mdb10"><form:input path="CHARGER_EMAIL" value=""
								class="input_w200" /> * 라이선스 발급용이며, 학교 이메일이어야 함</td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">강의/수업명</td>
						<td class="mdt15 mdb10"><form:input path="LCTRE_NM" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">수강 인원</td>
						<td class="mdt15 mdb10"><form:input path="ATNLC_NMPR" value="5"
							type="number" min="5" max="100"
								class="input_w200" /> * 라이선스 사용 인원. 최소 5인 이상</td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">강의소개</td>
						<td class="mdt15 mdb10"><form:textarea path="LCTRE_INTRCN" value=""
							placeholder="강의 내용 또는 강의 소개 URL(외부에서 접근 가능해야함)을 입력해 주세요.
또는 '파일 첨부'에서 강의계획서(Syllabus)를 첨부할 수도 있습니다."
								class="input_w600" style="height:150px;"/>
							<br><form:input type="file" path="attach_files" class="input_w300" /></td>
					</tr>
				</table>
							</li>
							<li class=" font12_black" style="padding:20px 0;">
<!-- 								<input type='checkbox' id="agree" name="agree" class="" value="Y" /> 모두 동의<br/> -->
								<input type='checkbox' id="agree2" name="agree2" class="agree" value="Y" /> 개인정보보호정책에 따라 귀하의 개인 정보를 서비스 제공 목적으로 활용하는 것에 동의합니다 . *<br/>
<!-- 								<input type='checkbox' id="agree3" name="agree3" class="agree" value="Y" /> 유용한 정보 , 혜택 안내 등을 위한 이메일 수신에 동의합니다.<br/> -->
							</li>
							<li class="mdl300">
								<a href="javascript:fn_Request_kr();"><img src="/images/sub/btn_request.gif" alt="Request"/></a>
							</li>
						</ul>
						<img src="/images/sub/buy_line.gif" style="margin: 0px;" />
				</div>
			</div>

		</form:form>
	</div>
	<!--//하단컨텐츠-->
<script type="text/javascript">
	$("#agree").click(function(){
		$(".agree").prop("checked", this.checked);
	});
	$("#agree2,#agree3").click(function(){
		var checkVal= $(".agree:checked").map(function(_,el){
			return $(el).val();
		}).get();
		if(checkVal.length==2){
			$("#agree").prop("checked", true);
		}
		else{
			$("#agree").prop("checked", false);
		}
	});
	$("#ATNLC_NMPR").bind("keyup", function(){
		var inputVal= parseInt(this.value);
		console.log( inputVal.isBetween(5,100) );
		if(inputVal.isBetween(5,100)==false){
			if(this.value>100)
				this.value= 100;
			else
				this.value= 5;
		}
	});
	if('${popup}'=='popup'){
		$("body").html('${saleModel.LCTRE_INTRCN}');
	}
</script>
</body>
</html>
