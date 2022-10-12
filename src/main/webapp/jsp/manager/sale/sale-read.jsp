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
		doAjax("saleModel", "/manager/sale/sale-create.do",
				"<c:out value = '${msg_save}'/>", "list_init()");
	}

	function create_copy() {
		doAjax("saleModel", "/manager/sale/sale_copy-create.do",
				"<c:out value = '${msg_save}'/>", "list_init()");
	}

	function update() {
		doAjax("saleModel", "/manager/sale/sale-update.do",
				"<c:out value = '${msg_save}'/>", "");
	}

	function updateLicense() {
		doAjax("saleModel", "/manager/sale/sale_license-update.do",
				"<c:out value = '${msg_save}'/>", "fn_reload()");
	}
	
	function updateHardwareRegist() {
		doAjax("saleModel", "/manager/sale/sale_hardwareRegist-update.do",
				"<c:out value = '${msg_save}'/>", "fn_reload()");
	}
	
	function updateHardwareReset() {
		if(confirm("등록된 사용자 기기 모두 삭제")){
			doAjax("saleModel", "/manager/sale/sale_hardwareReset-update.do",
					"<c:out value = '${msg_save}'/>", "fn_reload()");	
		}else{
			return;
		}
	}
	
	function del() {
		doAjax("saleModel", "/manager/sale/sale-delete.do",
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
		frm.action = "/manager/sale/sale-readList.do";
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

		openWindow("/manager/sale/sale_mailLicense-popup.do");
	}

	function sendMailApproval() {
		openWindow("/manager/sale/sale_mailApproval-popup.do");
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
		
		doAjaxForReturn("saleModel", "/manager/sale/sale_license-create.do",
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
		<div class="btitle">판매관리</div>
		<!--//타이틀-->
		<form:form commandName="saleModel">
		<div id="editionpackage"></div>
		
			<form:hidden path="pageNo" />
			<form:hidden path="searchKind" />
			<form:hidden path="searchWord" />

			<form:hidden path="licenseKeyYN" />
			<form:hidden path="shippingYN" />

			<form:hidden path="s_year" />
			<form:hidden path="s_month" />
			<form:hidden path="s_day" />
			<form:hidden path="e_year" />
			<form:hidden path="e_month" />
			<form:hidden path="e_day" />
			
			<form:hidden path="licenseusagefactor" />
			<form:hidden path="licensetermfactor" />
			<form:hidden path="licensesizefactor" />
			<form:hidden path="filename" />
			<form:hidden path="wintype" />

			<form:hidden path="saleid" />
			<form:hidden path="pay" value="A" />
      <form:hidden path="licenseusage_name" />
      <form:hidden path="licenseterm_name" />
      <form:hidden path="licensesize_name" />
      <form:hidden path="edition_name" />
<%--       <form:hidden path="edition"/> --%>
      <form:hidden path="education" />
      
      
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
						<td style="width:130px;height:28px;" class="mdt15 mdb10">saleid</td>
						<td class="mdt15 mdb10"><c:out value="${saleModel.saleid}" />
							<div class="btn_search">
								<a href="javascript:create_copy();">업그레이드 추가하기</a>
							</div></td>
					</tr>

					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">loginid</td>
						<td class="mdt15 mdb10"><form:input path="loginid"
								class="input_w200" /></td>
					</tr>

					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">order id</td>
						<td class="mdt15 mdb10"><form:input path="oid"
								class="input_w200" /></td>
					</tr>

					<tr>
						<td style="width:130px;height:28px;" class="mdt15 mdb10">License</td>
						<td class="mdt15 mdb10">
						  <form:select onchange="javascript:setUsage();" path="licenseusage" items="${saleModel.licenseusagesList}" itemLabel="text" itemValue="value" />
						  <form:select onchange="javascript:setSize();" path="licensesize" items="${saleModel.licensesizesList}" itemLabel="text" itemValue="value" />
						  <form:select onchange="javascript:setTerm();" path="licenseterm" items="${saleModel.licensetermsList}" itemLabel="text" itemValue="value" />
						  <form:select onchange="javascript:setEdition();" path="edition" items="${saleModel.editionList}" itemLabel="label" itemValue="id" />
						</td>
					</tr>

					<!-- packages 목록 시작 -->
					<tr>
						<td style="width:130px;" class="mdt15 mdb10"
							style="min-height: 28; max-height: 200">Plan</td>
						<td class="mdt15 mdb10" >
									<table id="productTable" border="1" width="70%"
										style="float: left">
										<c:forEach var="productpackageModel"
											items="${saleModel.productpackageModelList}">
											<tr id="product_${productpackageModel.packageid}">
												<td style="width: 30px;">
													<!-- saleModel의 packages(path로 사용됨)에 있는 값들을 value(productpackageModel.id)로 가지는 경우에만 체크됨  -->
													<form:checkbox path="packages" name="packages"
														value="${productpackageModel.id}" /> <input type="hidden"
													name="packageIds" value="${productpackageModel.packageid}" />
												</td>
												<td style="width: 50px;"><c:out
														value="${productpackageModel.category}" /></td>
												<td style="width: 180px;"><c:out
														value="${productpackageModel.subcategory}" /></td>
												<td style="width: 180px;"><c:out
														value="${productpackageModel.name}" escapeXml="false" /></td>
												<td style="width: 40px;"
													id="usdPrices_${productpackageModel.packageid}"><c:out
														value="${productpackageModel.usdprice}" /> <input
													type="hidden" name="usdPrices"
													value="${productpackageModel.usdprice}" /></td>
												<td style="width: 60px;"
													id="krwPrices_${productpackageModel.packageid}"><c:out
														value="${productpackageModel.krwprice}" /> <input
													type="hidden" name="krwPrices"
													value="${productpackageModel.krwprice}" /></td>
											</tr>
										</c:forEach>

									</table> <input id="krwPrice" type="text" class="input_w160" style="float:right" /><input id="usdPrice" type="text" class="input_w100" style="float:right" />
							<div style="clear:both"></div>
						</td>
					</tr>
					<!-- packages 목록 끝 -->
					
					<!-- extensions 목록 시작 -->
					<tr>
						<td style="width:130px;" class="mdt15 mdb10"
							style="min-height: 28; max-height: 200">Extensions</td>
						<td class="mdt15 mdb10" >
							<table id="extenionsTable" border="1" width="70%" style="float:left">
								<c:forEach var="extensionModel" varStatus="extensionStatus"
									items="${saleModel.availableExtensions}">
								<tr id="extension_${extensionModel.extensionId}">
									<td style="width: 30px;">
										<!-- saleModel의 extensions(path로 사용됨)에 있는 값들을 value(extensionModel.extensionId)로 가지는 경우에만 체크됨  -->
										<form:checkbox path="extensions" name="extensions" value="${extensionModel.extensionId}" />
										<input type="hidden" name="availableExtensions[${extensionStatus.index}].extensionId" value="${extensionModel.extensionId}" />
									</td>
									<td><c:out value="${extensionModel.labelEn}" /></td>
									<td id="extensionPriceUsd_${extensionModel.extensionId}">
										<c:out value="${extensionModel.priceUsd}" />
									</td>
									<td id="extensionPriceKrw_${extensionModel.extensionId}">
										<c:out value="${extensionModel.priceKrw}" />
									</td>
									<td id="extensionExpireDate_${extensionmodel.extensionId}">
										<form:input path="availableExtensions[${extensionStatus.index}].expireDate" />
									</td>
								</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<!-- extensions 목록 끝 -->
											
	              	<tr>
	                <td style="width:130px;height:28px;" class="mdt15 mdb10">한글 매뉴얼</td>
	                <td class="mdt15 mdb10">
	                <input type="text" class="input_w200" value="${saleModel.manual}" />
	                </td>
	              </tr>
	
	              <tr>
	                <td style="width:130px;" class="mdt15 mdb10">License Key</td>
	                <td class="mdt15 mdb10">
	                <input type="radio" name="hardwareType" value="0">Hardware Key(old)</input>
	                <input type="radio" name="hardwareType" value="1">Free</input>
	                <input type="radio" name="hardwareType" value="2" checked="checked">On-line Registration</input>
	                <input type="radio" name="hardwareType" value="3">Off-line Registration</input>
					<form:input path="offlinecode"
											class="input_w200" />
	                <div class="btn_search">
	                    <a href="javascript:createLicense();">License 생성하기</a>
	                  </div>
	                <br/>
	                <p id="return_data" name="return_data" ></p>
	                <br/>
	                <p />
	                <form:textarea path="serialnum" id="licenseText" name="licenseText"
	                    class="txt_w580" style="height:100px;" />
	                  <p />
	                  <br />
	                  <div class="btn_search">
	                    <a href="javascript:sendMailLicense();">License 메일 발송하기</a>
	                  </div>
	                  <div class="btn_search">
	                    <a href="javascript:updateLicense();">License 등록하기</a>
	                  </div>
	                  <p /></td>
	              </tr>

							<tr>
								<td style="width:130px; height:28px;" class="mdt15 mdb10">ProductID</td>
								<td class="mdt15 mdb10">CYNM4 <form:input
										path="productserial" class="input_w200" /> (Next available
									product id : <c:out value="${saleModel.next_productserial}" />)
								</td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Hardware
									Key</td>
								<td class="mdt15 mdb10"><form:input path="hardwarekey"
										class="input_w200" /> (Next available hardware key : <c:out
										value="${saleModel.next_hardwarekey}" />)</td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Upgraded
									SaleID</td>
								<td class="mdt15 mdb10"><form:input path="replacedid"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Academic
									Approval</td>
								<td class="mdt15 mdb10"><form:select path="academicauth"
										items="${saleModel.academicApprovalList}" itemLabel="text"
										itemValue="value" />
									<div class="btn_search">
										<a href="javascript:sendMailApproval();">신분 입증 요청 메일 발송</a>
									</div>

									<table>
										<tr>
											<td>confirmdate</td>
											<td><c:if test="${not empty saleModel.confirmdate}">
													<c:out value="${saleModel.confirmdate}" />
												</c:if></td>
										</tr>
										<tr>
											<td>URL</td>
											<td><c:if test="${not empty saleModel.proofUrl}">
													<c:out value="${saleModel.proofUrl}" />
												</c:if></td>
										</tr>
										<tr>
											<td>Image</td>
											<td><c:if test="${not empty saleModel.proofImage}">
													<a
														href="javascript:downloadFile('<c:out value="${saleModel.proofImage}"/>', '<c:out value="${saleModel.prooforg}"/>');"><c:out
															value="${saleModel.prooforg}" /></a>
												</c:if></td>
										</tr>
									</table></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">결제</td>
								<td class="mdt15 mdb10"><form:select path="currency"
										items="${saleModel.currencyList}" itemLabel="text"
										itemValue="value" />
									<table>
										<tr>
											<td>단가</td>
											<td><form:input path="price" class="input_w200" /></td>
										</tr>
										<tr>
											<td>익스텐션</td>
											<td><form:input path="extensionPrice" class="input_w200" /></td>
										</tr>
										<tr>
											<td>부가세</td>
											<td><form:input path="surtax" class="input_w200" /></td>
										</tr>
                    <tr>
                      <td>한글매뉴얼</td>
                      <td><form:input path="manual" class="input_w200" /></td>
                    </tr>
										<tr>
											<td>배송비</td>
											<td><form:input path="delivery" class="input_w200" /></td>
										</tr>
										<tr>
											<td>합계</td>
											<td><form:input path="total" class="input_w200" /></td>
										</tr>
									</table></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Product
									Version</td>
								<td class="mdt15 mdb10"><form:input path="productid"
										class="input_w200"/></td>
							</tr>

							<!--            <tr> -->
							<!--              <td width="130" height="28" class="mdt15 mdb10">filename</td> -->
							<!--              <td  class="mdt15 mdb10"> -->
							<%--               <form:input path="filename" class="input_w200"/> --%>
							<!--              </td> -->
							<!--            </tr> -->

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Sale Date</td>
								<td class="mdt15 mdb10"><form:input path="saledate"
										class="input_w200" /> <form:input path="saletime"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Expire Date</td>
								<td class="mdt15 mdb10"><form:input path="expiredate"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Shipping
									Request</td>
								<td class="mdt15 mdb10"><c:choose>
										<c:when test="${saleModel.shipping eq '0'}">
						
											<form:select path="shipping">
												<form:option value="0" label="Not to Ship" />
												<form:option value="1" label="Ship It" />

											</form:select>

										</c:when>
										<c:when test="${saleModel.shipping eq '1'}">
											<form:select path="shipping">
												<form:option value="1" label="Ship It" />
												<form:option value="0" label="Not to Ship" />

											</form:select>
										</c:when>
									</c:choose></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Shippihg
									Status</td>
								<td class="mdt15 mdb10"><form:select path="isshipped"
										items="${saleModel.shippihgStatusList}" itemLabel="text"
										itemValue="value" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Shipping ID</td>
								<td class="mdt15 mdb10"><form:input path="shippingid"
										class="input_w200" /></td>
							</tr>

							<!--            <tr> -->
							<!--              <td width="130" height="28" class="mdt15 mdb10">licenseusagefactor</td> -->
							<!--              <td  class="mdt15 mdb10"> -->
							<%--               <form:input path="licenseusagefactor" class="input_w200"/> --%>
							<!--              </td> -->
							<!--            </tr> -->

							<!--            <tr> -->
							<!--              <td width="130" height="28" class="mdt15 mdb10">licensetermfactor</td> -->
							<!--              <td  class="mdt15 mdb10"> -->
							<%--               <form:input path="licensetermfactor" class="input_w200"/> --%>
							<!--              </td> -->
							<!--            </tr> -->

							<!--            <tr> -->
							<!--              <td width="130" height="28" class="mdt15 mdb10">licensesizefactor</td> -->
							<!--              <td  class="mdt15 mdb10"> -->
							<%--               <form:input path="licensesizefactor" class="input_w200"/> --%>
							<!--              </td> -->
							<!--            </tr> -->

<!-- 							<tr> -->
<!-- 								<td width="130" height="28" class="mdt15 mdb10">Windows -->
<!-- 									Type</td> -->
<%-- 								<td class="mdt15 mdb10"><form:input path="wintype" --%>
<%-- 										class="input_w200" /></td> --%>
<!-- 							</tr> -->

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">On/Offline</td>
								<td class="mdt15 mdb10"><form:select path="on_offline"
										items="${saleModel.onOffLineList}" itemLabel="text"
										itemValue="value" /></td>
							</tr>

<!-- 							<tr> -->
<!-- 								<td style="width:130px;height:28px;" class="mdt15 mdb10">OfflineCode(Validation)</td> -->
<%-- 								<td class="mdt15 mdb10"><form:input path="offlinecode" --%>
<%-- 										class="input_w200" /></td> --%>
<!-- 							</tr> -->

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">fullname</td>
								<td class="mdt15 mdb10"><form:input path="fullname"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Organization
									Name</td>
								<td class="mdt15 mdb10"><form:input path="orgname"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">address</td>
								<td class="mdt15 mdb10"><form:input path="address1"
										class="input_w400" /> <form:input path="address2"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">city</td>
								<td class="mdt15 mdb10"><form:input path="city"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">state</td>
								<td class="mdt15 mdb10"><form:input path="state"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">zipcode</td>
								<td class="mdt15 mdb10"><form:input path="zipcode"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">country</td>
								<td class="mdt15 mdb10"><form:input path="country"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">phone</td>
								<td class="mdt15 mdb10"><form:input path="phone"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">email</td>
								<td class="mdt15 mdb10"><form:input path="email"
										class="input_w200" /></td>
							</tr>
							
<!-- 							hardware regist -->
							<tr>
								<td style="width:130px;height:28px;" class="mdt15 mdb10">Regist hardware</td>
								<td class="mdt15 mdb10"><form:input path="registered" class="input_w70" /> / <form:input path="registercount"
										class="input_w70"/>
								
								  <div class="btn_search">
				                    <a href="javascript:updateHardwareRegist();">hardware 등록 가능 수 변경</a>
				                  </div>
				                  <div class="btn_search">
				                    <a href="javascript:updateHardwareReset();">등록된 hardware 모두 삭제</a>
				                  </div>
								
								</td>
															
							</tr>
							
							
							<tr>
								<td style="width:130px;" class="mdt15 mdb10">Note</td>
								<td class="mdt15 mdb10"><form:textarea path="note"
										class="txt_w580" /></td>
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
