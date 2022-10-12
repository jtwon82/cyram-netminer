<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

<script type="text/javascript" src="/js/buy_view.js"></script>
<script>
	function fn_moveBuy(licenseusage) {
		<c:choose>
		<c:when test="${ buyModel.login eq 'false' }">
		if (confirm("<c:out value = '${msg_login_confirm}'/>")) {
			top.location.href = "/login/login-read.do";
		} else {
			return;
		}
		</c:when>
		<c:otherwise>
		$("#licenseusage").val(licenseusage);

		var buyModel = document.getElementById("buyModel");
		buyModel.action = "/download_buy/buy/buy-read.do";
		buyModel.submit();
		</c:otherwise>
		</c:choose>
	}
</script>

</head>

<body>

	<form:form commandName="buyModel">
		<form:hidden path="licenseusage" />
	</form:form>

	<!--하단컨텐츠-->
	<div id="container02">
		<div class="submain">
			<img src="/images/sub/contitle_Buy.gif" alt="appstore" />
			<div class="buybox">
				<ul>
					<li>NetMiner는 데이터를 분석하고 시각화 하는데 필요한 모든 것을 갖춘 소프트웨어 입니다.<br />먼저
						사용자 유형을 선택하고, 플랜을 결정하십시오.<br />
					</li>
				</ul>
			</div>
			<div class="buybox">
				<ul>
					<li style="text-align: center">이미 NetMiner를 사용하고 있습니까? <a
						href="/download_buy/buy/upgradePackage-read.do">업그레이드</a></li>
				</ul>
			</div>
			<div class="buybox">
				<dl>
					<dt>
						<a href="javascript:fn_moveBuy('6');"><img class="bottom"
							src="/images/sub/buy_student_ko.png" alt="student" /></a>
					</dt>
					<dt>
						<a href="javascript:fn_moveBuy('7');"><img class="bottom"
							src="/images/sub/buy_academic_ko.png" alt="academic" /></a>
					</dt>
					<dt>
						<a href="javascript:fn_moveBuy('8');"><img class="bottom"
							src="/images/sub/buy_commercial_ko.png" alt="commercial" /></a>
					</dt>
				</dl>
				<dl>
					<dt>
						<a href="javascript:fn_moveUpgrage('10');"><img class="bottom"
							src="/images/sub/buy_educational_ko.png" alt="trial" width="885" height="123"/></a>
					</dt>
				</dl>
				<dl>
					<dt>
						<a href="javascript:fn_moveUpgrage('9');"><img class="bottom"
							src="/images/sub/buy_trial_ko.png" alt="trial" width="885" height="123"/></a>
					</dt>
				</dl>
			</div>
			<div class="buybox" style="margin-left: 15px;" id="plan">
				<hr />
				<div class="compare">모든 플랜 비교</div>
				<div>
					<img src="/images/sub/buy_licenses_ko.png" alt="license plan" width="885" height="818" />
				</div>
			</div>
			<div class="buybox" style="text-align: center;">
				<button class="estimate" onclick="fn_askEstimate();">견적
					요청하기</button>
			</div>
		</div>
	</div>
	<!--//하단컨텐츠-->

</body>
</html>
