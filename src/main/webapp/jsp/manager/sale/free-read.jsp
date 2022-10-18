<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style>
.base_color{background-color:hotpink}
</style>

<script type="text/javaScript">
  $(document).ready(function() {
	  setUsage(false);
	  setTerm(false);
	  setSize();
	  setEdition();
	});

  $('input:checkbox[name="packages"]').click(function() {
	  alert("hihi");
    });
  
	function create() {
		doAjax("saleModel", "/manager/sale/free-create.do",
				"<c:out value = '${msg_save}'/>", "list_init()");
	}

	function create_copy() {
		doAjax("saleModel", "/manager/sale/free_copy-create.do",
				"<c:out value = '${msg_save}'/>", "list_init()");
	}

	function update() {
		doAjax("saleModel", "/manager/sale/free-update.do",
				"<c:out value = '${msg_save}'/>", "");
	}

	function updateLicense() {
		doAjax("saleModel", "/manager/sale/free_license-update.do",
				"<c:out value = '${msg_save}'/>", "fn_reload()");
	}
	
	function updateHardwareRegist() {
		doAjax("saleModel", "/manager/sale/free_hardwareRegist-update.do",
				"<c:out value = '${msg_save}'/>", "fn_reload()");
	}
	
	function updateHardwareReset() {
		if(confirm("등록된 사용자 기기 모두 삭제")){
			doAjax("saleModel", "/manager/sale/free_hardwareReset-update.do",
					"<c:out value = '${msg_save}'/>", "fn_reload()");	
		}else{
			return;
		}
	}
	
	function del() {
		doAjax("saleModel", "/manager/sale/free-delete.do",
				"<c:out value = '${msg_delete}'/>", "list_init()");
	}

	function list_init() {
		$("#pageNo").val("0");
		$("#searchKind").val("");
		$("#searchWord").val("");

		list();
	}

	function list() {
		var frm = document.getElementById('saleModel');
		frm.action = "/manager/sale/free-readList.do";
		frm.submit();
	}

	function downloadFile(bf_file, bf_source) {
		$("#downloadFileHTML")
				.html(
						"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_proof-read.do?bf_file="
				+ bf_file + "&bf_source=" + bf_source + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}

	function openWindow(action) {
		var saleModel = document.getElementById("saleModel");
		openPopup4Mail(saleModel, action);
	}

	function sendMailLicense() {
		if ($("#serialnum").val() == '') {
			alert("License Key를 먼저 등록하십시요.");
			return;
		}

		openWindow("/manager/sale/free_mailLicense-popup.do");
	}

	function sendMailApproval() {
		openWindow("/manager/sale/free_mailApproval-popup.do");
	}
	
	function setUsage(update = true) {
		$("#licenseusage_name").val($("#licenseusage option:selected").text());
//		if(update) {
//			var frm = document.getElementById('saleModel');
//			frm.action = "/manager/sale/sale-read.do";
//			frm.submit();
//		}
		if(update) { resetProductPackage();}
	}
	
	function setTerm(update = true) {
		$("#licenseterm_name").val($("#licenseterm option:selected").text());
		if(update) { resetProductPackage(); }
	}
	  
	function setSize(update = true) {
		$("#licensesize_name").val($("#licensesize option:selected").text());
		if(update) { resetProductPackage(); }
	}
	
	function setEdition() {
		$("#edition_name").val($("#edition option:selected").text());
		$("#licensesize option:eq("+editionsize+")").css("background", "#ffffff");
		if(editionPackArr==null){
			editionPackArr=[0,1,2,3,4,5,6,7,8,9];
		}

		for(var i in editionPackArr){
			$("#product_"+editionPackArr[i]).css("background", "#ffffff");
		}
		setTimeout(function(){
			setEditionPackage();
		},10);
	}
	
	function resetProductPackage(){

		$("form[id=saleModel]").ajaxSubmit({
			url : "/manager/sale/productPackage-ajax.do",
			type : "post",
			success : function(data){
				if(data == null || data == '') {
					alert('An error has occurred.');
					history.go(-1);
				} else {
					console.log(data);
					editionPackArr = new Array();
					$("#productPackageFlag").html(data);
					
					setPrice();
				}
			}
		});
	}
	
	function fn_getLicense(){
		alert($("return_data").val());
// 		$("licenseText").val($("return_data").val());
	}
	
	function createLicense(){
		var packageIds = $("input[name=packageIds]");
		var resultHtml;
		$('input:checkbox[name="packages"]').each(function(index){
			if(this.checked) {
				resultHtml +='<input type="hidden" name="editionpackages" path="editionpackages" value="'+packageIds.eq(index).val()+'"/>'
			}
		});
		
		$("#editionpackage").html(resultHtml );
		
		doAjaxForReturn("saleModel", "/manager/sale/free_license-create.do",
				"<c:out value = '${msg_save}'/>", "");
		
	}
	
	var editionPackArr;
	var editionsize;
	var selectEdition = 0;
	
	function setEditionPackage(){
		$("form[id=saleModel]").ajaxSubmit({
			url : "/manager/sale/editionPackage-ajax.do",
			type : "post",
			success : function(data){
				if(data == null || data == '') {
					alert('An error has occurred.');
					history.go(-1);
				} else {
					editionPackArr = new Array();
					$("#editionPackageFlag").html(data);
					$("#licensesize option:eq("+editionsize+")").css("background", "#e2eef3");
				}
			}
		});
		
	}
	var usdPrice = 0;
	var krwPrice = 0;
	
	function setPrice(){
		usdPrice = 0;
		krwPrice = 0;
		$('input:checkbox[name="packages"]').each(function(index){
			var usdid = "#usdPrices_"+index;
			var krwid = "#krwPrices_"+index;

			var usdPrice2= $(usdid).text();
			var krwPrice2= $(krwid).text();
			
			if(this.checked) {
				usdPrice+=parseInt(usdPrice2);
				krwPrice+=parseInt(krwPrice2);
			}
		});
		$("#usdPrice").val(usdPrice);
		$("#krwPrice").val(krwPrice);
	}
	
	$(function(){
		$('input:checkbox[name="packages"]').click(function(){
			var idx= parseInt(this.id.substring(8,9))-1;
			var usdid = "#usdPrices_"+idx;
			var krwid = "#krwPrices_"+idx;
			var usdPrice2= $(usdid).text();
			var krwPrice2= $(krwid).text();
			
			if(this.checked) {
				usdPrice+=parseInt(usdPrice2);
				krwPrice+=parseInt(krwPrice2);
			}else{
				usdPrice-=parseInt(usdPrice2);
				krwPrice-=parseInt(krwPrice2);
			}
			$("#usdPrice").val(usdPrice);
			$("#krwPrice").val(krwPrice);
		});
	});
</script>

</head>

<body>
<div id="editionPackageFlag" style="display:none;"></div>
<div id="productPackageFlag" style="display:none;"></div>
	<div class="board_01">

		<!--타이틀-->
		<div class="btitle">수업용 신청 내역</div>
		<!--//타이틀-->
		<form:form commandName="saleModel">
		<div id="editionpackage"></div>
		
			<form:hidden path="saleid" />
			<form:hidden path="pageNo" />
			<form:hidden path="searchKind" />
			<form:hidden path="searchWord" />

			<form:hidden path="s_year" />
			<form:hidden path="s_month" />
			<form:hidden path="s_day" />
			<form:hidden path="e_year" />
			<form:hidden path="e_month" />
			<form:hidden path="e_day" />
      
      
	<div class="viewlist">

		<ul>
			<li style="float: right; padding-bottom: 10px;" class="txtalign"><c:choose>
					<c:when
						test="${empty saleModel.saleid || saleModel.saleid eq '0'}">
						<a href="javascript:create();"><img
							src="/images/sub/btn_board06.gif"  /></a>
					</c:when>
					<c:otherwise>
						<c:if test="${not empty saleModel.sessionAdminId}">
							<a href="javascript:update();"><img
								src="/images/sub/btn_board06.gif" /></a>
							<a href="javascript:del();"><img
								src="/images/sub/btn_board04.gif" /></a>
						</c:if>
					</c:otherwise>
				</c:choose> <a href="javascript:list()"><img
					src="/images/sub/btn_board01.gif" /></a></li>
			<li>
				<table width="610" border="0" cellspacing="0" cellpadding="0"
					class="buss_tb2">
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">ID</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">신청일시</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">성함</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">국가</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">소속 기관</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">소속 학과</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">소속 기관 이메일</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">강의/수업명</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">수강 인원</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">강의소개</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">마케팅 동의</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>
					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">결과</td>
						<td class="mdt15 mdb10"><form:select path="RESULT"
							items="${saleModel.yesnoList}" itemLabel="text" itemValue="value"
								class="input_w200" /></td>
					</tr>
					
				</table>
			</li>

					<li style="float: right" class="txtalign"><c:choose>
							<c:when
								test="${empty saleModel.saleid || saleModel.saleid eq '0'}">
								<a href="javascript:create();"><img
									src="/images/sub/btn_board06.gif" /></a>
							</c:when>
							<c:otherwise>
								<c:if test="${not empty saleModel.sessionAdminId}">
									<a href="javascript:update();"><img
										src="/images/sub/btn_board06.gif" /></a>
									<a href="javascript:del();"><img
										src="/images/sub/btn_board04.gif" /></a>
								</c:if>
							</c:otherwise>
						</c:choose> <a href="javascript:list()"><img
							src="/images/sub/btn_board01.gif" /></a></li>

				</ul>
			</div>
		</form:form>

	</div>

</body>
</html>
