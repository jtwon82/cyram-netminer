<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

<script type="text/javascript">
	function download(bf_file) {
		$('#downloadFileHTML')
				.html(
						"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/download_buy/download/download-read.do?language=english&askMail=false&fileName="
				+ bf_file + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}

	function download_free(bf_file) {
		$('#downloadFileHTML')
				.html(
						"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/download_buy/download/download-read.do?language=korean&&fileName="
				+ bf_file + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}

	function alertbuy() {
		alert("NetMiner user is allowed to access the service.");
	}
</script>
</head>

<body>

	<!--하단컨텐츠-->
	<div id="container02">
		<div class="submain">
			<img src="/images/sub/contitle07.gif" alt="appstore" />
			<div class="wrapdownbox">
				<div class="downboxsub">
					<!-- <h1><img src="/images/sub/downtitle01.gif" alt="retail version"></h1>-->
					<ul>
						<li class="mdt10">Download NetMiner Retail version if you
							purchase NetMiner license.</li>
						<li class="mdt10">NetMiner can be installed on Windows XP/
							Vista/ 7 / 8 (32 bit and 64 bit supported)</li>

						<li class="mdt10"><c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">

									<c:choose>
										<c:when test="${ downloadModel.account eq 'true' }">
											<a href="javascript:download('32');"> <img
												src="/images/sub/btn_download32.gif" alt="32bit download" />
											</a>
										</c:when>
										<c:otherwise>
											<img src="/images/sub/btn_download32.gif"
												alt="32bit download" onclick="alertbuy();" />
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:otherwise>
									<a href="javascript:d_login_move();"><img
										src="/images/sub/btn_download32.gif" alt="32bit download" /></a>
								</c:otherwise>
							</c:choose> &nbsp; <c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">

									<c:choose>
										<c:when test="${ downloadModel.account eq 'true' }">
											<a href="javascript:download('64');"> <img
												src="/images/sub/btn_download64.gif" alt="64bit download" />
											</a>
										</c:when>
										<c:otherwise>
											<img src="/images/sub/btn_download64.gif"
												alt="64bit download" onclick="alertbuy();" />
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:otherwise>
									<a href="javascript:d_login_move();"><img
										src="/images/sub/btn_download64.gif" alt="64bit download" /></a>
								</c:otherwise>
							</c:choose></li>

					</ul>
				</div>
				<div class="downboxsub27">
					<ul style="padding-top: 10px;">
						<li class="mdt10">NetMiner Extensions are small programs to
							extend the functionality of NetMiner. By adding 'NetMiner
							Extension', you can expand your research. After installation, the
							program will be added to NetMiner’s ‘Extension’ menu. Each
							Extensions have 7 days free trial period.<br />
						</li>
						<li class="mdt10">During 7-day free trial, Extension can
							import collections of maximum 5,000 nodes into NetMiner.</li>
						<li class="mdt10"><strong>① SNS Data Collector (1
								Year)</strong><br />NetMiner SNS Data Collector collects data from
							Facebook, Twitter, YouTube or Instagram for public opinion
							analysis.</li>
						<li class="mdt10"><c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">
									<a href="javascript:download('sns64');"> <img
										src="/images/sub/btn_download_sns_64.png"
										alt="sns data collector 64 bit" width="231" height="54" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:d_login_move();"><img
										src="/images/sub/btn_download_sns_64.png"
										alt="evaluation version" width="231" height="54" /></a>
								</c:otherwise>
							</c:choose></li>
						<li class="mdt10"><strong>② Biblio Data Collector (1
								Year)</strong><br /> Biblio Data Collector collects bibliographic
							information from online and offers a variety of preprocessing
							options to make it easier to deal with complicated and time
							consuming jobs.</li>
						<li class="mdt10 mdb10"><c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">
									<a href="javascript:download('bibl64');"> <img
										src="/images/sub/btn_bdc_64.png"
										alt="biblio data collector 64 bit" width="231" height="54" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:d_login_move();"> <img
										src="/images/sub/btn_bdc_64.png" alt="evaluation version"
										width="231" height="54" />
									</a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
				<div class="downboxsub01">
					<ul>
						<li class="mdt10">Get NetMiner 4-week Free Trial Version
							after NetMiner website sign-up.</li>
						<li class="mdt10">A variety of sample data sets and user
							manual are also included with Free Trial Version.</li>
						<li class="mdt10">It enable you to analyze up to 10,000
							nodes.</li>
						<li class="mdt10"><c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">
									<a href="javascript:download('eva');"> <img
										src="/images/sub/free_trial_version_download.png"
										alt="evaluation version" width="231" height="54" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:d_login_move();"><img
										src="/images/sub/free_trial_version_download.png"
										alt="evaluation version" width="231" height="54" /></a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
				<div class="downboxsub02" style="display: none">
					<ul>
						<li class="mdt10">Aren't you NetMiner user yet?<br /></li>
						<li class="mdt10">NetMiner Viewer lets you view everything
							created in NetMiner if you don't have NetMiner installed.</li>
						<li class="mdt10">So NetMiner users can share their analysis
							results with much more colleagues, web page visitors and clients.</li>
						<li class="mdt10">We have prepared some examples of NetMiner
							data file(.nmf) and Viewer manual.<br></br>
						</li>
						<li class="mdt10">Explore the network analysis results in
							these files with NetMiner Viewer.</li>
						<li class="mdt5"><a
							href="javascript:download_free('viewer');"> <img
								src="/images/sub/btn_download05.gif" alt="evaluation version"
								width="231" height="54" />
						</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
	</div>
	<!--//하단컨텐츠-->

</body>
</html>
