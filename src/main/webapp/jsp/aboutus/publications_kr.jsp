<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript">
	function _download(bf_file) {
		var bf_source = bf_file.split('/')[1];
		$('#downloadFileHTML')
				.html(
						"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_download_storage-read.do?bf_file="
				+ bf_file + "&bf_source=" + bf_source + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}

	function download(bf_file) {
		<c:choose>
		<c:when test="${isLogin eq 'true'}">
		_download(bf_file);
		</c:when>
		<c:otherwise>
		d_login_move();
		</c:otherwise>
		</c:choose>
	}

	/* 구매 사용자에게 허용된 다운로드 */
	function download_buyer(bf_file) {
		<c:choose>
		<c:when test="${isLogin eq 'true'}">
		<c:choose>
		<c:when test="${isBuyer eq 'true'}">
		_download(bf_file);
		</c:when>
		<c:otherwise>
		alert("해당 서비스는 NetMiner를 구매하신 경우에만 제공됩니다.");
		</c:otherwise>
		</c:choose>
		</c:when>
		<c:otherwise>
		d_login_move();
		</c:otherwise>
		</c:choose>
	}

	function autoResize(i) {
		var iframeHeight = (i).contentWindow.document.body.scrollHeight;
		(i).height = iframeHeight + 20;
	}

	function modal(url) {
		// 	  		alert($('#'+url).attr('value'));

		var sub_url = url.replace(/_/g, ' ').replace('ko', '');
		if (url == "All_That_NetMiner") {
			$("#modal_subject").html("한 권으로 시작하는 NetMiner");
		} else {
			$("#modal_subject").html(sub_url);
		}
		var resultHtml = "";
		// 		    resultHtml +='<a href="javascript:modalClose();" style="text-decoration:none;"><img src="'+url +'" width="550px" /></a>';
		resultHtml += '<iframe src="../jsp/pdfcontents/'
				+ url
				+ '.jsp"  onload="autoResize(this)"  onclick="modalClose()" width="630px" frameborder="no" scrolling="no"></iframe>';
		$("#prev_body").html(resultHtml);

		$('div.modal').modal();
	}

	function modalClose() {

		$('div.modal').modal('hide');
	}
</script>

</head>

<body>

	<!--하단컨텐츠-->
	<div id="container02">
		<div class="submain">
			<img src="/images/sub/contitle24.gif" alt="publications" />
			<div class="resourcebox">
				<div class="resource02">
					<ul>
						<li>NetMiner와 관련된 상세한 제품 정보, 사용 방법 및 활용 사례 등을 확인할 수 있습니다. <br />웹사이트
							회원으로 가입하시면 문서 파일들을 다운로드 할 수 있습니다.
						</li>
					</ul>
				</div>
				<div class="wrapdownbox03">
					<div class="downboxsub05 downboxsubkr" id="brochure">
						<h1>Brochure</h1>
						<ul>
							<li>NetMiner의 제품 소개 및 추가 패키지들에 대한 정보를 확인할 수 있습니다.</li>
						</ul>
						<ul class="mdt40">
							<li><strong>Introduction of NetMiner</strong>
								<div class="btn_mnoti"
									onclick="_download('brochure/Netminer_intro_kr.pdf');"
									style="cursor: pointer">Down</div></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>Introduction of Packages</strong>
								<div class="btn_mnoti"
									onclick="_download('brochure/NetMiner_package_kr.pdf');"
									style="cursor: pointer">Down</div></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>Semantic Network Analysis
									using NetMiner</strong>
								<div class="btn_mnoti"
									onclick="_download('brochure/Semantic_network_analysis_kor.pdf');"
									style="cursor: pointer">Down</div></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>NetMiner Extension</strong>
								<div class="btn_mnoti"
									onclick="_download('brochure/intro_extension_K.pdf');"
									style="cursor: pointer">Down</div></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>NetMiner Automation &amp;
									Customization Service</strong>
								<div class="btn_mnoti"
									onclick="_download('brochure/NetMiner_Customize_kor.pdf');"
									style="cursor: pointer">Down</div></li>
						</ul>
					</div>
					<div class="downboxsub06" id="whitePaper">
						<h1>White Paper</h1>
						<ul>
							<li>NetMiner 백서는 NetMiner의 차별적인 효용과 가치를 발견할 수 있도록 안내합니다.</li>
						</ul>
						<ul class="mdt40">
							<li><strong>Introduction to NetMiner</strong> <!--버튼--> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->

								<div class="btn_mnoti"
									onclick="_download('whitepaper/NetMiner4_intro.pdf');"
									style="cursor: pointer">Down</div> <!--//버튼--></li>
						</ul>

						<ul class="mdt15">
							<li><strong>Specifications of NetMiner 4</strong> <!--버튼-->
								<!--<div class="btn_mnoti_pup" >Share</div>--> <!--//버튼--> <!--버튼-->

								<div class="btn_mnoti"
									onclick="download('whitepaper/0_Specifications_of_NetMiner.pdf');"
									style="cursor: pointer">Down</div> <!--//버튼--> <img
								src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /></li>
						</ul>


					</div>
					<div class="downboxsub07" id="casestudy">
						<h1>Case Study</h1>
						<ul>
							<li>NetMiner 활용사례는 다양한 분야의 도전 과제와 솔루션을 소개합니다.</li>
						</ul>

						<ul class="mdt40">
							<li><strong>| Knowledge Map | 농촌진흥청 | R&amp;D 성과 정보
									분석</strong> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download('casestudy/casestudy01.pdf');"
									style="cursor: pointer">Down</div> <!--//버튼--> <img
								src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /></li>
						</ul>

						<ul>
							<li class="mdt15"><strong>| Knowledge Map |
									한국과학기술기획평가원 | 논문 공동 연구 현황 분석</strong> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download('casestudy/casestudy_kistep.pdf');"
									style="cursor: pointer">Down</div> <!--//버튼--> <img
								src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /></li>
						</ul>
					</div>

					<div class="downboxsub08" id="manual">
						<h1>Manual</h1>
						<ul>
							<li>NetMiner 매뉴얼은 입문에서 고급 활용까지 사용자를 체계적으로 안내합니다.</li>
						</ul>

						<ul class="mdt40">
							<li><strong>Getting Started with NetMiner</strong> <!--버튼-->
								<!--<div class="btn_mnoti_pup" >Share</div>--> <!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="_download('manual/Getting_Started_with_NetMiner.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="_download('manual/ko_Getting_Started_with_NetMiner.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_Getting_Started_with_NetMiner');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>Using NetMiner</strong> <!--버튼-->
								<!--<div class="btn_mnoti_pup" >Share</div>--> <!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download_buyer('manual/Using_NetMiner.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="download_buyer('manual/ko_Using_NetMiner.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05" onclick="modal('ko_Using_NetMiner');"
									style="cursor: pointer">목차보기</div> <!--//버튼--> <img
								src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>NetMiner Module Reference</strong>
								<img src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /> <!--버튼--> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download_buyer('manual/NetMiner_Module_Reference.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="download_buyer('manual/ko_NetMiner_Module_Reference.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_NetMiner_Module_Reference');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>Getting Started with
									NetMiner Script</strong> <!--버튼--> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="_download('manual/Getting_Started_with_NetMiner_Script.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="_download('manual/ko_Getting_Started_with_NetMiner_Script.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_Getting_Started_with_NetMiner_Script');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>Using NetMiner Script</strong> <!--버튼-->
								<!--<div class="btn_mnoti_pup" >Share</div>--> <!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download_buyer('manual/Using_NetMiner_Script.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="download_buyer('manual/ko_Using_NetMiner_Script.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_Using_NetMiner_Script');"
									style="cursor: pointer">목차보기</div> <!--//버튼--> <img
								src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>NetMiner Script Function
									Reference</strong> <img src="/images/sub/Lock.png" alt="lock" width="8"
								height="10" style="margin-top: 5px;" /> <!--버튼--> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download_buyer('manual/NetMiner_Script_Function_Reference.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="download_buyer('manual/ko_NetMiner_Script_Function_Reference.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_NetMiner_Script_Function_Reference');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>
						</ul>
						<ul>
							<li class="mdt15"><strong>NetMiner Script Appendix</strong>
								<img src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /> <!--버튼--> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download_buyer('manual/NetMiner_Script_Appendix.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="download_buyer('manual/ko_NetMiner_Script_Appendix.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_NetMiner_Script_Appendix');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>
						</ul>

						<ul>
							<li class="mdt15"><strong>NetMiner Semantic Network
									Analysis</strong> <img src="/images/sub/Lock.png" alt="lock" width="8"
								height="10" style="margin-top: 5px;" /> <!--버튼--> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->
								<div class="btn_mnoti"
									onclick="download('manual/NetMiner_Semantic_Network_Analysis.pdf');"
									style="cursor: pointer">ENG</div>
								<div class="btn_mnoti05"
									onclick="download('manual/ko_NetMiner_Semantic_Network_Analysis.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05"
									onclick="modal('ko_NetMiner_Semantic_Network_Analysis');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>
						</ul>

						<ul class="mdt15">
							<li><strong>한 권으로 시작하는 NetMiner</strong> <!--버튼--> <img
								src="/images/sub/Lock.png" alt="lock" width="8" height="10"
								style="margin-top: 5px;" /> <!--<div class="btn_mnoti_pup" >Share</div>-->
								<!--//버튼--> <!--버튼-->

								<div class="btn_mnoti"
									onclick="download_buyer('manual/ko_All_That_NetMiner.pdf');"
									style="cursor: pointer">KOR</div>
								<div class="btn_mnoti05" onclick="modal('All_That_NetMiner');"
									style="cursor: pointer">목차보기</div> <!--//버튼--></li>

						</ul>

						<ul>
							<li class="mdt15" style="font-size: 12px; padding-left: 15px;">※
								상기 프로그램 매뉴얼은 NetMiner를 설치하시면 시스템 설치폴더</br>(기본 C: > Program Files >
								Cyram > NetMiner > Document) 에서도 확인할 수 있습니다.
							</li>
						</ul>
					</div>
					<!--//manual-->


				</div>
			</div>
		</div>
	</div>
	<!--//하단컨텐츠-->

	<!-- modal -->

	<div class="modal">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 650px;">

				<div class="modal-header"
					style="border: 0px; padding: 15px 15px 0px 15px;">
					<button type="button" class="close" onclick="modalClose()">
						<span>&times;</span>
					</button>
					<!-- 				<h4 id="modal-title" class="modal-title"></h4> -->
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<img src="/images/cyramCI.png" width="300px"></img>
							<div id="modal_subject"
								style="float: right; padding-top: 15px; font-size: 13px;"></div>
						</thead>
						<tbody>
							<div
								style="margin-top: 30px; padding-left: 5px; font-size: 16px; font-weight: bold;">Contents</div>
							<div id="prev_body"></div>
							<!-- 					<iframe src="publications_contents.do"></iframe> -->
						</tbody>
					</table>
				</div>
				<!-- 			<div class="modal-footer"> -->
				<!-- 				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				<!-- 			</div> -->

			</div>
		</div>
	</div>
	<!-- modal -->


</body>
</html>
