<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
	var NEW_STUDENT = "6";
	var NEW_ACADEMIC = "7";
	var NEW_COMMERCIAL = "8"; 
	var NEW_ONE_YEAR = "5"; // 이용기간 1년
	var NEW_FREE_PLAN = "5"; // 무료 플랜
	var NEW_PREMIUM_PLAN = "7"; // 프리미엄 플랜

	$(document).ready(function() {
		if ($("#licenseusage").val() == '') {
			moveReturn();
		} else {
			$("#sale_id_div").html("");

			setEdition();
			setPackage();
			setExtension();
			setQty();
			setShipping();
			// 			setShipping_table($("#licenseterm").val());
			setItem();
			setEditionPackage();
			if ($("#proofUrl").val() == '') {
				$("#proofUrl").focus();
			}

			nodisplay();
		}
	});

	function moveReturn() {
		var buyModel = document.getElementById("buyModel");

		buyModel.action = "/download_buy/buy/buy-view.do";
		buyModel.submit();
	}

	function setTerm() {
		setEdition();
		setPackage();
		setExtension();
		setItem();
		setTimeout(function() {
			$('#edition_' + NEW_PREMIUM_PLAN).click();
		}, 100);
		checkEditionPackage();
		setShipping();
	}

	function setSize() {
		setPackage();
		setItem();
		checkEditionPackage();
	}

	function setQty() {
		$("#order_qty").html($("#qty").val());
		$("#extension_qty").html($("#qty").val());

		setPrice();
	}

	function setPackage() {
		$("form[id=buyModel]").ajaxSubmit({
			url : "/download_buy/buy/buy_package-ajax.do",
			type : "post",
			success : function(data) {
				if (data == null || data == '') {
					alert('An error has occurred.');
					history.go(-1);
				} else {
					$("#buy_package_table tr:not(:first)").remove();
					$("#buy_package_table_head").after(data);
					$("#packages_all").attr("checked", false);
					// 					setPrice();
				}
			}
		});
	}

	function setEdition() {
		$("form[id=buyModel]").ajaxSubmit({
			url : "/download_buy/buy/buy_edition-ajax.do",
			type : "post",
			success : function(data) {
				if (data == null || data == '') {
					alert('An error has occurred.');
					history.go(-1);
				} else {
					$("#buy_edition_table tr:not(:first)").remove();
					$("#buy_edition_table_head").after(data);
				}
			}
		});
	}

	function setExtension() {
		$("form[id=buyModel]").ajaxSubmit({
			url : "/download_buy/buy/buy_extension-ajax.do",
			type : "post",
			success : function(data) {
				if (data == null || data == '') {
					alert('An error has occurred.');
					history.go(-1);
				} else {
					$("#buy_extension_table tr:not(:first)").remove();
					$("#buy_extension_table_head").after(data);
					$("#extensions_all").attr("checked", false);
				}
			}
		});
	}

	var editionPackArr;
	var editionterm;
	var selectEdition = 0;

	function setEditionPackage(edition) {
		selectEdition = edition;
		$("form[id=buyModel]").ajaxSubmit({
			url : "/download_buy/buy/buy_editionpackage-ajax.do",
			type : "post",
			success : function(data) {
				if (data == null || data == '') {
					alert('An error has occurred.');
					history.go(-1);
				} else {
					editionPackArr = new Array();
					$("#editionpackage").html(data);
					$("#licensesize").val(editionsize);
					
					setSize();
					if(edition && edition !== NEW_PREMIUM_PLAN) {
						$('input:checkbox[name="extensions"]').each(function() {
							$(this).attr("checked", false);
							$(this).attr("disabled", true);
						});
						$("#extensions_all").attr("checked", false);
						$("#extensions_all").attr("disabled", true);
					} else {
						$('input:checkbox[name="extensions"]').each(function() {
							$(this).attr("disabled", false);
						});
						$("#extensions_all").attr("disabled", false);
					}
				}
			}
		});
	}

	<c:if test="${ buyModel.licenseusage eq '0'}">
	function nodisplay() {
		$('.nodisplay').css("display", "none");
		$("#collapseExample").removeClass("collapse");
	}
	</c:if>

	function checkEditionPackage() {
		setTimeout(function() {
			var packages = $('input:checkbox[name="packages"]');

			$('input[name="editionpackages"]').each(function(index) {
				var checkboxid = '#' + packages.eq(index).val();

				for (var i = 0; i < editionPackArr.length; i++) {
					if (this.value == editionPackArr[i]) {
						$(checkboxid).attr('checked', true);
					}
				}
			});
			setPrice();
		}, 100);
	}
	<c:if test="${ buyModel.licenseusage ne '0'}">
	function setPackageCheckAll() {
		if ($("#packages_all").prop("checked")) {
			$('input:checkbox[name="packages"]').each(function() {
				if (!this.disabled) {
					this.checked = true;
				}
			});
		} else {
			$('input:checkbox[name="packages"]').each(function() {
				if (!this.disabled) {
					this.checked = false;
				}
			});
		}

		setPrice();
	}

	function setExtensionsCheckAll() {
		if ($("#extensions_all").prop("checked")) {
			$('input:checkbox[name="extensions"]').each(function() {
				if (!this.disabled) {
					this.checked = true;
				}
			});
		} else {
			$('input:checkbox[name="extensions"]').each(function() {
				if (!this.disabled) {
					this.checked = false;
				}
			});
		}
		setPrice();
	}
	</c:if>

	function setOptionsCheckAll() {
		if ($("#options_all").prop("checked")) {
			/* 매뉴얼 구매 숨김
			$('input:checkbox[name="manual"]').each(function(){
			    if(!this.disabled) {
			        this.checked = true;
			      }
			    });
			 */
			$('input:checkbox[name="education"]').each(function() {
				if (!this.disabled) {
					this.checked = true;
				}
			});
		} else {
			/* 매뉴얼 구매 숨김
			$('input:checkbox[name="manual"]').each(function(){
			  if(!this.disabled) {
			      this.checked = false;
			    }
			  });
			 */
			$('input:checkbox[name="education"]').each(function() {
				if (!this.disabled) {
					this.checked = false;
				}
			});
		}
		setPrice();
	}

	function setItem() {
		var item = "NetMiner";
		var licenseusage = $("#licenseusage").val();
		
		var licenseterm = selectEdition === NEW_FREE_PLAN ? "6 Months" : $("#licenseterm option:selected").text();
		var licensesize = $("#licensesize option:selected").text();

		if (licenseusage == NEW_ACADEMIC) {
			licenseusage = "Academic";
		} else if (licenseusage === NEW_STUDENT) {
			licenseusage = "Student";
		} else if (licenseusage === NEW_COMMERCIAL) {
			licenseusage = "Commercial";
		}

		$("#order_items").html(
				item + " (" + licenseusage + ", " + licenseterm + ")");
	}

	function setPrice(packageid, id) {
		if (packageid == 7 ) {
			var checkboxid = '#' + id;
			var checkboxid2 = '#' + (++id);
			if ($(checkboxid).prop("checked")) {
				$(checkboxid2).prop("checked", true);
				$(checkboxid2).attr("disabled", "disabled");
			} else {
				$(checkboxid2).removeAttr("disabled");
			}
		}
		var discounts = {
			"1" : 0,
			"2" : 0.05,
			"3" : 0.09,
			"4" : 0.12,
			"5" : 0.14,
			"6" : 0.16,
			"7" : 0.17,
			"8" : 0.18,
			"9" : 0.19,
			"10" : 0.20,
			"11" : 0.21,
			"12" : 0.22,
			"13" : 0.23,
			"14" : 0.24,
			"15" : 0.25,
			"16" : 0.26,
			"17" : 0.27,
			"18" : 0.28,
			"19" : 0.29,
			"20" : 0.3,
			"21" : 0.31,
			"22" : 0.32,
			"23" : 0.33,
			"24" : 0.34,
			"25" : 0.35,
			"26" : 0.36,
			"27" : 0.37,
			"28" : 0.38,
			"29" : 0.39,
			"30" : 0.4
		}
		var qty = $("#qty").val();
		var prices = $("input[name=prices]");
		var editionpackages = $("input[name=editionpackages]");
		var price = 0;
		var extensionPrice = 0; // 선택한 익스텐션들의 가격
		var extensionSum = 0; // 선택한 익스텐션들의 가격 * 수량
		var extensionPrices = $("input[name=extensionprices]"); // 익스텐션 개별 가격 리스트
		var sum = 0;
		var surtax = 0;
		var discount = 0;
		var discountRate = 0;
		var manual = 0;
		var delivery = getDeliveryPrice();
		var total = 0;
		var education = "false";

		
		var useScriptpackage = false;
		$('input:checkbox[name="packages"]').each(function(index) {
			if (this.checked) {
				if (editionpackages.eq(index).val() == 7) {
					useScriptpackage = true;
				}
				if (useScriptpackage && editionpackages.eq(index).val() == 8) {

				} else {
					price = price + new Number(prices.eq(index).val());
				}

			}
		});

		/* 매뉴얼 구매 숨김
		if($('input:checkbox[name="manual"]')[0].checked) {
			  manual = 24000;
		}
		 */

		/* 추가 선택 사항 숨김
		if ($('input:checkbox[name="education"]')[0].checked) {
			education = "true";
		}
		 */

		var licenseusage = $("#licenseusage").val();

		var showExtension = false;
		$('input:checkbox[name="extensions"]').each(
				function(index) {
					if (this.checked) {
						// 익스텐션의 체크박스가 선택되어 있는 경우
						extensionPrice = extensionPrice
								+ new Number(extensionPrices.eq(index).val())
						showExtension = true;
					}
				});
		if (showExtension) {
			$("#extension_pricelist").show();
		} else {
			$("#extension_pricelist").hide();
			// 익스텐션이 아무것도 선택되어 있지 않다면 최상위 체크박스를 해제한다
			$("#extensions_all").attr("checked", false);
		}

		extensionSum = extensionPrice * new Number(qty);
		sum = price * new Number(qty);

		if (licenseusage == '0') {
			discountRate = 1;
		}
		if (licenseusage == '2') {
			discountRate = discounts[qty];
		}

		/* 할인액을 100원 단위로 끊음 */
		discount = -(Math.ceil(((sum + extensionSum) * discountRate) / 100)) * 100;
		discounted = sum + extensionSum + discount;
		surtax = discounted / 10;
		total = discounted + surtax + delivery + manual;

		var checkout = total > 0 ?
			`
			<a href="javascript:fn_save(1);" style="text-decoration: none;">
				<img src="/images/sub/btn_pay03.gif" alt="계좌이체" class="mdl25" />
			</a>

			<a href="javascript:fn_save(2);" style="text-decoration: none;">
				<img src="/images/sub/btn_paypal_K.png" alt="lg+" />
			</a>
			<br />
			<ul style="float: right">
				<li class="font12">* 카드 결제를 통해 구매하시는 경우에는 팝업창 차단을 해제해 주시기 바랍니다.</li>
			</ul>
			` : 
			`
			<a href="javascript:fn_save(0);"><img
				src="/images/sub/btn_pay04.gif" alt="무료" class="mdl25" /></a>
			`;
		$("#checkout").html(checkout)

		$("#order_price").html(comma(price));
		$("#price").val(price);

		$("#extension_price").html(comma(extensionPrice));
		$("#extensionPrice").val(extensionPrice);

		$("#order_sum").html(comma(sum));
		$("#sum").val(sum);

		$("#extension_sum").html(comma(extensionSum));
		$("#extensionSum").val(extensionSum);

		// 할인가
		$("#order_discount").html(comma(discount));
		$("#discount").val(discount);

		// 부가세
		$("#order_surtax").html(comma(surtax));
		$("#surtax").val(surtax);

		// 부가세포함가
		$("#order_surtax_sum").html(comma(discounted + surtax));
		$("#surtax_sum").val(discounted + surtax);

		// 매뉴얼
		/* 매뉴얼 구매 숨김
		$("#order_manual").html(comma(manual));
		 */
		$("#manual").val(manual.toString());

		// 포장/발송비
		/*
		$("#order_delivery").html(comma(delivery));
		*/
		$("#delivery").val(delivery);

		// 합계
		$("#order_total").html(comma(total));
		$("#total").val(total);

		// 교육(모델에만 반영)
		$("#education").val(education);

	}

	function setShipping() {
		var esd = "ESD (Electronic Software Delivery)";

		$("#shipping_kind_td").html(esd);
		$("#shipping_notice_1")
				.html(
						"<font class='fontred'>[주의]</font> 라이선스 키를 e-mail 로 전달받게 되므로 e-mail 주소를 정확하게 입력해주셔야 합니다.");
		$("#shipping_notice_2").html("");
	}

	function setShipping_table(licenseterm) {
		var tr_tel = "<tr>"
				+ "<td width='152'>전화</td>"
				+ "<td colspan='3'><input type='text' class='input_w200'/></td>"
				+ "</tr>";
		var tr_zip = "<tr>"
				+ "<td width='152'>우편번호</td>"
				+ "<td colspan='3'><input type='text' class='input_w200'/></td>"
				+ "</tr>";
		var tr_addr = "<tr>"
				+ "<td width='152'>주소</td>"
				+ "<td colspan='3'><input type='text' class='input_w500'/></td>"
				+ "</tr>";

		$("#shipping_info_table tr:not(:first)").remove();

		if (licenseterm == '2') {
			$("#shipping_notice_1")
					.html(
							"<font class='fontred'>[주의]</font> 라이선스 키를 e-mail 로 전달받게 되므로 e-mail 주소를 정확하게 입력해주셔야 합니다.");
			$("#shipping_notice_2").html(
					"&nbsp; 정확한 배송을 위해 주소와 전화번호를 정확하게 기입해 주십시오.");
			$("#shipping_info_table_head").after(tr_addr);
			$("#shipping_info_table_head").after(tr_zip);
			$("#shipping_info_table_head").after(tr_tel);
		} else {
			$("#shipping_notice")
					.html(
							"<font color='red'>[주의]</font> 라이선스 키를 Email로 전달받게 되므로 Email 주소를 정확하게 입력해주셔야 합니다.");
		}
	}

	function setCD() {
		if ($("#shipping_cd_check").prop("checked")) {
			// 			$("#shipping").val("1");
			$('#collapseExample2').collapse('show');
		} else {
			// 			$("#shipping").val("0");
			$('#collapseExample2').collapse('hide');
		}

		setPrice();
	}

	function setUserEmail() {
		if ($("#user_update").prop("checked")) {
			$("#email").val("");
			$("#email").val($("#email2").text());
			$("#email").attr("readonly", true);
		} else {
			$("#email").attr("readonly", false);
		}
	}

	function getDeliveryPrice() {
		var licenseusage = $("#licenseusage").val();

		if (licenseusage == '0') {
			return 0;
		} else {
			if ($("#shipping_cd_check").prop("checked")) {
				return 10000;
			} else {
				return 0;
			}
		}
		// 		else {
		// 			var licenseterm = $("#licenseterm").val();

		// 			if(licenseterm == '1') {
		// 				if($("#shipping_cd_check").prop("checked")) {
		// 					return 10000;
		// 				} else {
		// 					return 0;
		// 				}
		// 			} else {
		// 				return 10000;
		// 			}
		// 		}
	}

	//disabled 풀었던 checkbox들 다시 disabled 시키기
	function fn_pay_return() {
		$('input:checkbox[name="packages"]').each(function(index) {
			for (var i = 0; i < arrCheckDisabled.length; i++) {
				if (index == arrCheckDisabled[i]) {
					this.disabled = true;
					break;
				}
			}
		});
	}

	//disabled checkbox 임시로 담아놓는 배열
	var arrCheckDisabled = new Array();

	function fn_check() {
		if ($("#proofUrl").val() == '' && $("#attach_files").val() == '') {
			alert("웹페이지 주소나 이미지 파일을 입력하세요.");
			$("#proofUrl").focus();
			return false;
		}
		return true;
	}

	function fn_save(pay) {
		if (!fn_check()) {
			return;
		}

		// licenseterm이 disabled인 경우 Sale Query에 값이 전달되지 않아 오류가 발생한다.
		// $("#licenseterm").attr("disabled", false);
		
		$("#pay").val(pay);

		// 		$("#shipping").val("0");

		if ($("#shipping_cd_check").prop("checked")) {
			$("#shipping").val("1");
		} else {
			$("#shipping").val("0");
		}

		if ($("#licenseterm").val() == '2') {
			$("#shipping").val("1");
		}

		//checkbox disabled 인 것들 풀어서 값 넘기기
		var i = 0;
		arrCheckDisabled = new Array();

		$('input:checkbox[name="packages"]').each(function(index) {
			if (this.disabled) {
				arrCheckDisabled[i] = index;
				i++;
				this.disabled = false;
			}
		});

		//초기화
		$("#sale_id_div").html("");

		$("form[id=buyModel]").ajaxSubmit({
			url : "/download_buy/buy/buy-create.do",
			type : "post",
			success : function(data) {
				fn_pay_return();

				if (data == null || data == '') {
					alert('An error has occurred.');
				} else {

					//에러면
					if (data.indexOf("error_message") > -1) {
						$("#return_message").html(data);
						alert($("#error_message").html());
						$("#return_message").html("");
						return;

					}

					//성공이면
					$("#sale_id_div").html(data);
				}

				//무료
				if (pay == 0) {
					fn_moveReturn_Student_courcework();

					//계좌이체
				} else if (pay == 1) {
					fn_moveReturn_Account_transfer();

					//카드
				} else if (pay == 2) {
					if ($('input[name="saleids"]').length > 0) {
						fn_pay();
					}
				}
			}
		});
		// disableLicenseTerm();
	}

	function fn_pay_end_update() {
		doAjax("buyModel", "/download_buy/buy/buy-update.do", "",
				"fn_moveReturn_Research_academic()");
	}

	function fn_moveReturn_Student_courcework() {
		var buyModel = document.getElementById("buyModel");

		buyModel.action = "/download_buy/buy/buy_ok_Student_courcework-view.do";
		buyModel.submit();
	}

	function fn_moveReturn_Research_academic() {
		alert("fn_moveReturn_Research_academic");
		var buyModel = document.getElementById("buyModel");

		buyModel.action = "/download_buy/buy/buy_ok_Research_academic-view.do";
		buyModel.submit();
	}

	function fn_moveReturn_Account_transfer() {
		var buyModel = document.getElementById("buyModel");

		buyModel.action = "/download_buy/buy/buy_ok_Account_transfer-view.do";
		buyModel.submit();
	}

	function fn_pay() {
		var sWin = window
				.open("about:blank", "netminer_dacom_popup",
						"menubar=no,toolbar=no,scrollbars=no,resizable=no,width=725,height=740,status");

		var buyModel = document.getElementById("buyModel");

		buyModel.target = "netminer_dacom_popup";
		buyModel.action = "/download_buy/buy/lg-popup.do";
		buyModel.submit();
		sWin.focus();
	}

	function comma(val) {
		while (/(\d+)(\d{3})/.test(val.toString())) {
			val = val.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
		}
		return val;
	}
</script>

</head>

<body>
	<div id="editionpackage" style="display: none"></div>
	<!--하단컨텐츠-->
	<div id="container02">

		<form:form commandName="buyModel" method="post"
			enctype="multipart/form-data">
			<form:hidden path="licenseusage" />
			<form:hidden path="pay" />
			<form:hidden path="shipping" />
			<form:hidden path="status" value="TMP" />
			<form:hidden path="on_offline" value="online" />
			<form:hidden path="price" />
			<form:hidden path="sum" />
			<form:hidden path="surtax" />
			<form:hidden path="surtax_sum" />
			<form:hidden path="discount" />
			<form:hidden path="delivery" />
			<form:hidden path="total" />
			<form:hidden path="manual" />
			<form:hidden path="country" value="Korea, Republic of" />
			<form:hidden path="education" />
			<form:hidden path="registercount" value="2" />
			<form:hidden path="registered" value="0" />
			<form:hidden path="extensionPrice" />
			<form:hidden path="extensionSum" />

			<div id="dbemail2" style="display: none;">
				<ul>
					<li id="email2">${buyModel.email}</li>
				</ul>
			</div>
			<div id="sale_id_div"></div>

			<div class="submain">
				<img src="/images/sub/contitle_Buy.gif" alt="NetMiner Buy_Student" />
				<div class="buybox08">

					<ul>
						<li><c:choose>
								<c:when test="${ buyModel.licenseusage eq '6' }">
									<img src="/images/sub/buy_title02.gif" alt="Student" />
								</c:when>
								<c:when test="${ buyModel.licenseusage eq '7' }">
									<img src="/images/sub/buy_title03.gif" alt="Academic" />
								</c:when>
								<c:otherwise>
									<img src="/images/sub/buy_title04.gif" alt="Commercial" />
								</c:otherwise>
							</c:choose></li>
					</ul>

					<c:if test="${ buyModel.licenseusage ne '8'}">
						<h1 class="hfont_33" style="margin-top: 20px;">신분입증</h1>
						<ul>
							<li class=" font12_red">해당 라이선스는 신청자가 교육기관 소속이며, 특정 용도(수업 및
								학술 연구 등)로 라이선스를 활용할 경우에만 신청이 가능합니다.<br />교육기관 소속 확인을 위해 다음 방법 중
								한 가지만 선택하여 적절한 정보를 제공해주세요.
							</li>
							<li>
								<table
									style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px;"
									class="buss_tb8">
									<tr>
										<td class=" alignl ">신청자의 교육기관 소속 여부를 확인할 수 있으며 <br />동시에
											외부에서 접속 가능한 웹 페이지 주소(URL)
										</td>
										<td style="width: 365px;" class=" alignl "><form:input
												path="proofUrl" class="input_w300" /></td>
									</tr>
									<tr>
										<td class="alignl">신청자의 교육기관 소속 여부를 확인할 수 있는 파일 <br />(예.
											재직증명서 등. 파일크기는 3MB 이하)
										</td>
										<td class="alignl"><form:input type="file"
												path="attach_files" class="input_w300" /></td>
									</tr>
								</table>
							</li>
						</ul>
						<img src="/images/sub/buy_line.gif" style="margin: 0px;" />
					</c:if>
				</div>

				<div class="buybox12 nodisplay" id="nodisplay">
					<table
						style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; height: 30px">
						<tr>
							<td style="width: 82px;">
								<h1 class="hfont_33" style="padding-top: 10px;">이용기간</h1>
							</td>
							<td style="width: 30px;" class="mdb10"><img
								src="/images/sub/btn_question.gif" alt="question" align="middle"
								onclick="openLayer('poster01',{top:305, left:80});"
								style="cursor: pointer" class="mdb10" /></td>
							<td style="width: 165px;"><form:select
									onchange="javascript:setTerm();" path="licenseterm"
									items="${buyModel.licensetermsList}" itemLabel="text"
									itemValue="value" class="input_w130" /></td>
							<td style="width: 48px;">
								<h1 class="hfont_33" style="padding-top: 10px;">수량</h1>
							</td>
							<td style="width: 36px;"><img
								src="/images/sub/btn_question.gif" alt="question"
								onclick="openLayer('poster04',{top:305, left:300});"
								style="cursor: pointer" class="mdb10" /></td>
							<td style="width: 96px;"><form:select
									onchange="javascript:setQty();" path="qty"
									items="${buyModel.qtyList}" itemLabel="text" itemValue="value"
									class="input_w70" /></td>
						</tr>
					</table>
				</div>
				<div class="subday mdb10"></div>

				<div id="poster01" class="layer-popupexe">
					<div class="buybox03">
						<h1>이용기간 유형</h1>
						<ul>
							<li>이용기간은 6개월, 1년 그리고 영구로 나뉩니다. <br /> 6개월은 수업용 에서만 가능합니다.
							</li>
							<li>1년은 학생(연구)용과 교육용 에서 가능합니다.</li>
							<li>영구는 교육용, 기관용, 상업용, 기업용 에서 가능합니다.</li>
							<li>요약하면 다음과 같습니다.</li>
							<li class="mdl10 mdt10"><strong>수업용</strong> : 6개월</li>
							<li class="mdl10"><strong>학생(연구)용</strong> : 1년</li>
							<li class="mdl10"><strong>교육용</strong> : 1년, 영구</li>
							<li class="mdl10"><strong>기관/상업/기업용</strong> : 1년, 영구</li>
							<li class=" mdt5"><strong>주의</strong> :이용기간이 영구이면 보안상의 이유로
								ESD(온라인 다운로드)는 제공되지 않으며, 프로그램의 설치와 실행을 위해서는 라이선스 키와 함께 하드웨어 키가
								함께 있어야 합니다. 하드웨어 키는 CD와 함께 포장되어 택배로 배달됩니다.</li>
						</ul>
					</div>
					<a href="#" class="close"><img
						src="/images/main/layer_close.gif" alt="close" /></a>
				</div>
				<div id="poster02" class="layer-popupexe">
					<div class="buybox03">
						<h1>데이터 크기 유형</h1>
						<ul>
							<li>NetMiner의 라이선스 프로그램은 데이터의 사이즈(노드 개수)와 관련하여 다양한 선택범위를
								제공합니다. 그것은 4단계의 데이터 크기입니다: Small, Medium, Large, Huge. 각각의 최대 노드
								개수는 다음과 같습니다</li>
							<li class="mdl10 mdt10"><strong>Small</strong> :1,000</li>
							<li class="mdl10"><strong>Medium</strong> : 10,000</li>
							<li class="mdl10"><strong>Large</strong> : 100,000</li>
							<li class="mdl10" style="margin-bottom: 18px;"><strong>Huge</strong>
								:1,000,000</li>
							<li>각 이용 용도에 따라 가용한 데이터의 크기는 다음과 같습니다.</li>
							<li class="mdl10 mdt10">수업용: Small</li>
							<li class="mdl10 ">학생(연구)용: Small, Medium, Large</li>
							<li class="mdl10 ">교육용: Small, Medium, Large, Huge</li>
							<li class="mdl10 ">기관 및 상업용: Small, Medium, Large, Huge</li>
							<li class="mdl10 ">기업용: Unlimited</li>
							<li class=" mdt5"><strong>주의</strong> :라이선스에서 데이터의 크기가
								소프트웨어의 성능을 직접 보장해주는 것은 아닙니다. 데이터의 크기는 NetMiner에서 허용된 최대한의 노드 개수를
								의미합니다. NetMiner의 성능은 NetMiner가 설치된 시스템의 성능에 의존합니다.</li>
						</ul>
					</div>
					<a href="#" class="close"><img
						src="/images/main/layer_close.gif" alt="close" /></a>
				</div>
				<!--레이어팝업/설명부분-->
				<div id="poster04" class="layer-popupexe">
					<div class="buybox03">
						<h1>수량</h1>
						<ul>
							<li>NetMiner의 License 구매 개수를 선택할 수 있습니다.<br /> 구매하는 라이선스
								개수에 따라 추가 할인이 적용됩니다.<br /> 단, 구매 수량은 Academic, Institute,
								Commercial에서만 선택 가능합니다.
							</li>
						</ul>
					</div>
					<a href="#" class="close"><img
						src="/images/main/layer_close.gif" alt="close" /></a>
				</div>
				<!--//레이어팝업/설명부분-->

				<!-- 플랜 -->
				<div class="buybox11 nodisplay" id="nodisplay">

					<!--레이어팝업/패키지설명부분-->
					<div id="poster05" class="layer-popupexe">
						<div class="buybox03">
							<h1>라이선스 플랜</h1>
							<ul>
								<li>NetMiner 라이선스는 이용 용도 및 소속 기관, 포함 기능에 따라 구성되어 있습니다.<br />
									필요에 맞는 플랜을 선택해보세요. <br /> <br />
								</li>
								<li><a href="/download_buy/buy/buy-view.do#plan"
									target="_blank">플랜 비교</a></li>
							</ul>
						</div>
						<a href="#" class="close"><img
							src="/images/main/layer_close.gif" alt="close" /></a>
					</div>
					<!--//레이어팝업/패키지설명부분-->
					<ul>
						<li>
							<h1 class="mdt10 hfont_33">플랜</h1> <span><img
								src="/images/sub/btn_question.gif" alt="question"
								style="cursor: pointer"
								onclick="openLayer('poster05',{top:355, left:513});" /></span>
						</li>
						<li>
							<table id="buy_edition_table" class="buss_tb8"
								style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px;">
								<tr id="buy_edition_table_head">
									<th>플랜</th>
									<th style="width: 550px; padding: 0 50 0 70px;">설명</th>
									<th style="width: 100px;">가격(원)</th>
									<th style="width: 50px;">&nbsp;</th>
								</tr>
							</table>
						</li>
					</ul>
				</div>
				<div class="buybox04 nodisplay" id="nodisplay" style="display: none">
					또는 에디션이 아닌 별도의 프로그램 구성을 원하십니까? <span> <a
						data-toggle="collapse" href="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample"
						style="text-decoration: underline; color: #006699"> 에디션 직접 선택
					</a>
					</span>
				</div>
				<img class="nodisplay" src="/images/sub/buy_line.gif" />
				<!-- // 에디션 -->
				<div class="collapse" id="collapseExample" aria-expanded="false"
					style="height: 0px;">
					<div class="buybox12">
						<table
							style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; height: 30px">
							<tr>
								<td style="width: 105px;">
									<h1 class="hfont_33" style="padding-top: 10px;">데이터 크기</h1>
								</td>
								<td style="width: 34px;"><img
									src="/images/sub/btn_question.gif" alt="question"
									onclick="openLayer('poster02',{top:605, left:80});"
									style="cursor: pointer" class="mdb10" /></td>
								<td style="width: 224px;"><form:select
										onchange="javascript:setSize();" path="licensesize"
										items="${buyModel.licensesizesList}" itemLabel="text"
										itemValue="value" class="input_w200" /></td>
							</tr>
						</table>
					</div>
					<!-- 패키지 -->
					<div class="buybox11">

						<!--레이어팝업/패키지설명부분-->
						<div id="poster03" class="layer-popupexe">
							<div class="buybox03">
								<h1>NetMiner의 패키지</h1>
								<ul>
									<li>NetMiner의 패키지는 고객의 다양한 요구를 충족시켜 드립니다. 필요에 따라 자신에게 꼭 맞는
										패키지를 구성하실 수 있으며, 추가도 가능합니다. <br /> <br /> 개별 패키지의 가격과 사양은 사전
										고지 없이 변경될 수 있습니다. 부가가치세 미포함 가격입니다.<br /> 부가가치세 및 배송료 등이 포함된
										최종 가격은 결제방법 선택 페이지에서 확인할 수 있습니다.
									</li>

									<li><a href="/product/package01.do" target="_blank">패키지
											설명 상세 보기</a></li>

								</ul>
							</div>
							<a href="#" class="close"><img
								src="/images/main/layer_close.gif" alt="close" /></a>
						</div>
						<!--//레이어팝업/패키지설명부분-->
						<ul>
							<li>
								<h1 class="mdt10 hfont_33">패키지</h1> <span><img
									src="/images/sub/btn_question.gif" alt="question"
									style="cursor: pointer"
									onclick="openLayer('poster03',{top:755, left:513});" /></span>
							</li>
							<li>
								<table id="buy_package_table" class="buss_tb8"
									style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px;">
									<tr id="buy_package_table_head">
										<th style="width: 100px;">&nbsp;</th>
										<th style="width: 220px;">패키지</th>
										<th>설명</th>
										<!-- 					    <th style="width:100px;">설명</th> -->
										<th style="width: 80px;">가격(원)</th>
										<th style="width: 50px;"><c:choose>
												<c:when test="${ buyModel.licenseusage eq '0'}">
									&nbsp;
								</c:when>
												<c:otherwise>
													<input type="checkbox" id="packages_all"
														onclick="javascript:setPackageCheckAll();" />
												</c:otherwise>
											</c:choose></th>
									</tr>
								</table>
							</li>
						</ul>
					</div>
					<img src="/images/sub/buy_line.gif" />
				</div>
				<!-- //패키지 -->
				<!-- 익스텐션 -->
				<c:choose>
					<c:when test="${ buyModel.licenseusage ne '0' }">
						<div class="buybox11">
							<ul>
								<li>
									<h1 class="mdt10 hfont_33" style="float: left">확장 프로그램</h1> <span
									style="margin-top: 12px; font-size: 12px; float: left;">&nbsp;※
										데이터 제공 기관의 운영 정책이 변경되면 서비스가 중단되거나 변경될 수 있습니다.</span>
								</li>
								<li>
									<table id="buy_extension_table" class="buss_tb8"
										style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px;">
										<tr id="buy_extension_table_head">
											<th style="width: 20%">확장 프로그램</th>
											<th style="width: 64%; padding: 0 50 0 70px;">설명</th>
											<th style="width: 10%;">가격(원)</th>
											<th style="width: 6%;"><input type="checkbox"
												id="extensions_all"
												onclick="javascript:setExtensionsCheckAll();;" /></th>
										</tr>
										<!-- 여기서부터 Extension의 정보는 setExtension()에서 구현한다 -->
									</table>
								</li>
							</ul>
						</div>
						<img class="nodisplay" src="/images/sub/buy_line.gif" />
					</c:when>
				</c:choose>
				<!-- //익스텐션 -->
				<!--     추가선택사항 -->
				<!-- 
				<div class="buybox11">
					<h2 class="mdt10">추가 선택 사항</h2>
					<table id="buy_optional_table" class="buss_tb8"
						style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px;">
						<tr id="buy_optional_table_head">
							<th style="width: 300px;">추가 선택 사항</th>
							<th style="width: 370px;">설명</th>
							<th style="width: 70px;">가격(원)</th>
							<th style="width: 50px;" style="padding: 5px 5px 5px 15px;"><input
								type="checkbox" id="options_all"
								onclick="javascript:setOptionsCheckAll();" /></th>
						</tr>
						 매뉴얼 구매 메뉴 숨김
    <tr>
      <td>NetMiner를 이용한 소셜 네트워크 분석(2015)</td>
      <td>NetMiner 1권에 끝내기<br/>NetMiner와 함께 구매하시면 시중가의 20% 할인</td>
      <td style="text-align:right">24,000</td>
      <td style="width:50px; text-align:center;"><input name='manual' type='checkbox' onclick='javascript:setPrice();'></input></td>
    </tr>
    
						<tr>
							<td>사이람 교육 과정</td>
							<td>① 필수과정(네트워크 분석 입문 및 NetMiner 기초 사용법)<br /> ② 선택과정<br />
								- 연구동향 분석<br /> - 텍스트 분석 (뉴스, 트위터, 연설문)<br /> - 소셜 미디어 수집과 분석<br />
								- 네트워크 역할 분석(중개자, 등위성)<br /> - 네트워크의 통계적 분석<br /> - 파이썬을 이용한
								소셜 빅데이터 분석<br /> <br /> * 해당 항목을 체크하시면, 라이선스 발급시<br /> 교육 할인
								혜택을 함께 안내해 드립니다.<br /> <br />
								<div style="text-align: right; font-size: 10px;">
									<a href="http://edu.cyram.com" target="_blank">사이람 교육 자세히
										보기 ></a>
								</div>
							</td>
							<td></td>
							<td style="width: 50px; text-align: center;"><input
								name="education" type="checkbox"></input></td>

						</tr>
					</table>
				</div>
				<img src="/images/sub/buy_line.gif" />
				 -->

				<div class="buybox11">
					<h2 class="mdt10">배송방법 및 정보입력</h2>
					<ul>
						<li id="shipping_notice_1"></li>
						<li id="shipping_notice_2" class="mdl32 mdb10"></li>
						<li>
							<table id="shipping_info_table" class="buss_tb9"
								style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; margin: 0 auto;">
								<tr id="shipping_info_table_head">
									<td style="width: 50px;">배송방법</td>
									<td style="width: 330px;" id="shipping_kind_td"></td>
									<td style="width: 50px;">이메일</td>
									<td><form:input id="email" path='email' class='input_w160' />
										<input type='checkbox' id="user_update" name="user_update"
										value="Y" /> 회원정보로 저장</td>
								</tr>
							</table>
							<div class="collapse" id="collapseExample2" aria-expanded="false"
								style="height: 0px;">
								<table class="buss_tb9"
									style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; margin: 0 auto;">
									<tr>
										<td style="width: 152px;">전화</td>
										<td colspan='3'><form:input type='text' id="phone"
												path="phone" class='input_w200' /></td>
									</tr>
									<tr>
										<td style="width: 152px;">우편번호</td>
										<td colspan='3'><form:input type='text' id="zipcode"
												path="zipcode" class='input_w200' /></td>
									</tr>

									<tr>
										<td style="width: 152px;">주소</td>
										<td colspan='3'><form:input type='text' id="address1"
												path="address1" class='input_w500' /></td>
										<%-- 	<td colspan='3'><form:input type='text' id="address2" path="address2" class='input_w500' /></td> --%>
									</tr>
								</table>
							</div>
						</li>
					</ul>
				</div>

				<!--//선택부분-->

				<div class="buybox11">
					<h2 class="mdt10">
						<span class="mdt20">주문항목</span>
					</h2>
					<ul>
						<li>
							<table class="buss_tb9"
								style="border: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px;">
								<tr>
									<th>항목</th>
									<th style="width: 100px;">단가</th>
									<th style="width: 100px;">수량</th>
									<th style="width: 150px;">가격(원)</th>
								</tr>
								<tr>
									<td class="brline2" id="order_items">NetMiner</td>
									<td align="right" id="order_price"></td>
									<td align="center" id="order_qty"></td>
									<td align="right" id="order_sum"></td>
								</tr>
								<tr id="extension_pricelist">
									<td class="brline2">확장 프로그램</td>
									<td align="right" id="extension_price"></td>
									<td align="center" id="extension_qty"></td>
									<td align="right" id="extension_sum"></td>
								</tr>
								<tr>
									<td>할인가</td>
									<td align="right">&nbsp;</td>
									<td align="center">&nbsp;</td>
									<td align="right" id="order_discount"></td>
								</tr>
								<tr>
									<td>부가세</td>
									<td align="right">&nbsp;</td>
									<td align="center">&nbsp;</td>
									<td align="right" id="order_surtax"></td>
								</tr>
								<tr>
									<td>부가세 포함가</td>
									<td align="right">&nbsp;</td>
									<td align="center">&nbsp;</td>
									<td align="right" id="order_surtax_sum"></td>
								</tr>
								<!-- 매뉴얼 구매 숨김
					             <tr>
					               <td>한글 매뉴얼</td>
					               <td align="right">&nbsp;</td>
					               <td align="center">&nbsp;</td>
					               <td align="right" id="order_manual"></td>
					             </tr>
								<tr>
									<td>포장/발송비</td>
									<td align="right">&nbsp;</td>
									<td align="center">&nbsp;</td>
									<td align="right" id="order_delivery"></td>
								</tr>
					             -->
								<tr>
									<td>합계</td>
									<td align="right">&nbsp;</td>
									<td align="center">&nbsp;</td>
									<td align="right" id="order_total"></td>
								</tr>

							</table>
						</li>
					</ul>
				</div>


				<div class="buybox11">
					<h2 class="mdt10">결제방법 선택</h2>
					<ul>
						<li class=" font12">결제 진행 중 오류가 있거나 문의 사항이 있으시면 <a
							href="mailto:netminer@cyram.com">netminer@cyram.com</a> 으로 메일을
							주시기 바랍니다.
						</li>
						<li style="float: right" id="checkout"></li>
					</ul>
				</div>


				<div class="buybox10">
					<h2>Address</h2>
					<ul>
						<li>(13494) 경기도 성남시 분당구 대왕판교로 670 유스페이스2 B동 904호</li>
					</ul>
				</div>

			</div>


		</form:form>

	</div>
	<!--//하단컨텐츠-->

</body>
</html>
