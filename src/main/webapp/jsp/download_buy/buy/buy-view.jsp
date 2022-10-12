<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
  <div id="container02" >
    <div class="submain" > <img src="/images/sub/contitle_Buy.gif" alt="appstore" />
      <div class="buybox" >
        <ul>
          <li> 
          	NetMiner is a premium software that has everything for exploratory analysis and visualization of network data.<br/>
			Choose your status and the right plan for your needs.<br/>
			</li>
        </ul>
      </div>
		<div class="buybox">
			<ul>
				<li style="text-align: center">Already own NetMiner? <a
					href="/download_buy/buy/upgradePackage-read.do">See Upgrade Options</a></li>
			</ul>
		</div>
			<div class="buybox">
				<dl>
					<dt>
						<a href="javascript:fn_moveBuy('6');"><img class="bottom"
							src="/images/sub/buy_student_en.png" alt="student" /></a>
					</dt>
					<dt>
						<a href="javascript:fn_moveBuy('7');"><img class="bottom"
							src="/images/sub/buy_academic_en.png" alt="academic" /></a>
					</dt>
					<dt>
						<a href="javascript:fn_moveBuy('8');"><img class="bottom"
							src="/images/sub/buy_commercial_en.png" alt="commercial" /></a>
					</dt>
				</dl>
				<dl>
					<dt>
						<a href="javascript:fn_moveUpgrage('9');"><img class="bottom"
							src="/images/sub/buy_trial_en.png" alt="trial" width="885" height="123" /></a>
					</dt>
				</dl>
			</div>
			<div class="buybox" style="margin-left: 15px;" id="plan">
				<hr />
				<div class="compare">Compare All Features</div>
				<div>
					<img src="/images/sub/buy_licenses_en.png" alt="license plan" width="885" height="818" />
				</div>
			</div>
			<div class="buybox" style="text-align: center;">
				<button class="estimate" onclick="fn_askEstimate();">Contact Sales</button>
			</div>
		</div>
	</div>
  <!--//하단컨텐츠-->

</body>
</html>
