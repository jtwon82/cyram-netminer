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
						alert("Thank you for applying for Free Educational license. \nWe will issue a license key by e-mail when your application is reviewed.");
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

		if(f.APPLCNT_NM.value==''){	alert("Please complete all fields."); f.APPLCNT_NM.focus();	return false;	}
		if(f.PSITN_INSTT.value==''){	alert("Please complete all fields."); f.PSITN_INSTT.focus(); return false;	}
		if(f.PSITN_SUBJCT.value==''){	alert("Please complete all fields."); f.PSITN_SUBJCT.focus();	return false;	}
		if(f.CHARGER_EMAIL.value==''){	alert("Please complete all fields."); f.CHARGER_EMAIL.focus();	return false;	}
		if(f.LCTRE_NM.value==''){	alert("Please complete all fields."); f.LCTRE_NM.focus();	return false;	}
		if(f.ATNLC_NMPR.value==''){	alert("Please complete all fields."); f.ATNLC_NMPR.focus();	return false;	}
// 		if(f.LCTRE_INTRCN.value==''){	alert("Please complete all fields."); f.LCTRE_INTRCN.focus();	return false;	}

		var chkCnt= 0;
		if(f.LCTRE_INTRCN.value.trim()==''){		chkCnt++;	}
		if(f.attach_files.value.trim()==''){		chkCnt++;	}
		if(chkCnt>1){	alert("Please agree to using your personal data with our privacy policy.");	return false;	}
		
		if(!f.agree2.checked){		alert("Please agree to using your personal data with our privacy policy.");	return false;	}
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
							<li class=" font12_black" style="padding:20px 0;">Educators and professors from qualified educational institutions can apply Free Educational License.</br>
Free Educational License must only be used for teaching.
							</li>
							<li class="content_table">
				<table width="610" border="0" cellspacing="0" cellpadding="0" class="buss_tb2">
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Name</td>
						<td class="mdt15 mdb10"><form:input path="APPLCNT_NM" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Country</td>
						<td class="mdt15 mdb10"><form:select path="NATION_CODE" value="${NATION_CODE }"
							items="${saleModel.nationList}" itemLabel="NATION_NAME_EN" itemValue="NATION_CODE"
								class="" style="width:217px;" /><script>$("select").select2();</script></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Organization</td>
						<td class="mdt15 mdb10"><form:input path="PSITN_INSTT" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Department</td>
						<td class="mdt15 mdb10"><form:input path="PSITN_SUBJCT" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Email</td>
						<td class="mdt15 mdb10"><form:input path="CHARGER_EMAIL" value=""
								class="input_w200" /> * Educational institution email</td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Course Title</td>
						<td class="mdt15 mdb10"><form:input path="LCTRE_NM" value=""
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Number of users </td>
						<td class="mdt15 mdb10"><form:input path="ATNLC_NMPR" value=""
							type="number" min="5" max="100"
								class="input_w200" /> * At least 5</td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;border-right: 1px solid #dfdfdf;" class="mdt15 mdb10">Course Description</td>
						<td class="mdt15 mdb10"><form:textarea path="LCTRE_INTRCN" value=""
							placeholder="Describe your course. Or attach a course syllabus file."
								class="input_w600" style="height:150px;"/>
							<br><form:input type="file" path="attach_files" class="input_w300" /></td>
					</tr>
				</table>
							</li>
							<li class=" font12_black" style="padding:20px 0;">
<!-- 								<input type='checkbox' id="agree" name="agree" class="" value="Y" /> Agree to All<br/> -->
								<input type='checkbox' id="agree2" name="agree2" class="agree" value="Y" /> I agree to use my personal information for applying 'Free Education' with the privacy policy *<br/>
<!-- 								<input type='checkbox' id="agree3" name="agree3" class="agree" value="Y" /> I agree to receive informations and commercial offers by email<br/> -->
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
