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
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/download_buy/download/download-read.do?language=korean&askMail=false&fileName="
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
		alert("해당 서비스는 NetMiner를 구매하신 경우에만 제공됩니다.");
	}
</script>
</head>

<body>

	<!--하단컨텐츠-->
	<div id="container02">
		<div class="submain">
			<img src="/images/sub/contitle07.gif" alt="Download" />
			<div class="wrapdownbox">
				<div class="downboxsub">
					<!-- <h1><img src="/images/sub/downtitle01.gif" alt="retail version"></h1>-->
					<ul>
						<li class="mdt10"><strong>NetMiner의 라이선스를 구매하시면 프로그램
								설치파일을 다운로드 할 수 있습니다.</strong></li>
						<li class="mdt10">NetMiner는 Microsoft Windows
							2000/XP/Vista/7/8 (32bit &amp; 64bit) 운영체제에서 설치 가능하며, 사용자 매뉴얼, 모듈
							레퍼런스, 샘플 데이터 파일 등이 함께 제공되어 활용법을 쉽고 빠르게 습득할 수 있습니다.</li>
						<li class="mdt10" style="font-size: 12px; float: right;">※ 각종
							매뉴얼 및 샘플 데이터 파일은 웹사이트(→ <a
							href="http://www.netminer.com/aboutus/publications.do#manual"
							target="_blank">바로가기</a>) 또는 NetMiner 설치 폴더<br />(기본 C: >
							Program Files > Cyram > NetMiner > Document) 에서 확인할 수 있습니다.
						</li>
						<li class="mdt10" style="float: left;"><c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">

									<c:choose>
										<c:when test="${ downloadModel.account eq 'true' }">
											<a href="javascript:download('ko_32');"> <img
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
											<a href="javascript:download('ko_64');"> <img
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
					<ul style="padding-top: 15px;">
						<li class="mdt10"><strong>NetMiner의 확장
								프로그램(Extension)은 NetMiner를 원하는 대로 사용할 수 있도록 도와주는 부가 프로그램입니다.</strong><br /></li>
						<li class="mdt10">확장 프로그램을 통해 NetMiner에 새로운 기능을 추가해 보십시오. 확장
							프로그램을 설치한 후, NetMiner를 실행하면 메뉴 Extension이 나타납니다. 확장 프로그램은 설치 후 7일
							간 무료로 사용할 수 있습니다.</li>
						<li class="mdt10">※ 무료 사용 기간에는 NetMiner에 전송되는 데이터의 양이 제한됩니다.</li>
						<li class="mdt10"><strong>① SNS 데이터 수집 (1년)</strong><br />온라인
							여론 동향 분석에 필요한 페이스북, 트위터, 유튜브, 인스타그램 데이터를 NetMiner로 수집합니다.</li>
						<!-- 이 부분은 onlineedu.cyram.com에 SDC 관련 교육이 생길 때 까지 숨겨둡니다.
						<li ><a href="http://edu.cyram.com" style="text-decoration:underline">SNS Data Collector 활용 교육 보기 >></a></li>
					 -->
						<li class="mdt10 mdb10"><c:choose>
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
						<li class="mdt10"><strong>② 학술 문헌 데이터 수집 및 분석 (1년)</strong><br />온라인에서
							학술 문헌 서지 데이터를 수집하고, 몇 번의 클릭으로 쉽게 데이터를 전처리 할 수 있습니다.</li>
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
				<div class="downboxsub02" style="display: none;">
					<ul>
						<li class="mdt10"><strong>NetMiner 사용자가 아니십니까?</strong><br /></li>
						<li class="mdt10">NetMiner Viewer를 통해 사용자가 아니더라도 NetMiner의 분석
							결과를 확인할 수 있습니다.</li>
						<li class="mdt10">또한 NetMiner 사용자는 분석 결과를 NetMiner Viewer를
							이용하여 다른 연구자 혹은 고객에게 공유할 수 있습니다.<br />
						</li>
						<li class="mdt10">샘플 분석결과 파일과 매뉴얼을 통해 NetMiner Viewer를 체험해
							보시기 바랍니다.</li>
						<li class="mdt10"><a
							href="javascript:download_free('viewer');"> <img
								src="/images/sub/btn_download05.gif" alt="evaluation version"
								width="231" height="54" />
						</a></li>
					</ul>
				</div>
				<div class="downboxsub01">
					<ul>
						<li class="mdt10"><strong>웹사이트에 회원으로 가입하시면,
								NetMiner를 4주간 무료로 체험할 수 있으며, 백서, 활용사례 등 다양한 자료들을 열람할 수 있습니다.</strong><br /></li>
						<li class="mdt10">평가판 프로그램을 설치하시면 NetMiner의 모든 기능과 Extension을
							모두 사용할 수 있으며, NetMiner 입문자를 위한 기초 매뉴얼 및 샘플 데이터가 함께 제공됩니다.</li>
						<li class="mdt10">평가판 프로그램은 최대 10,000개 이하의 노드로 구성된 네트워크 데이터를
							수집/분석할 수 있습니다.</li>
						<li class="mdt10"><c:choose>
								<c:when test="${ downloadModel.login eq 'true' }">
									<a href="javascript:download('ko_eva');"> <img
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
			</div>

		</div>
	</div>
	<!--//하단컨텐츠-->

</body>
</html>
