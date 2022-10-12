<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style type="text/css">
p {
	text-align: center !important
}
</style>
<script>
	function _download(bf_file) {
		var bf_source = bf_file.split('/')[1];
		$('#downloadFileHTML')
				.html(
						"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_download_storage-read.do?bf_file="
				+ bf_file + "&bf_source=" + bf_source + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}
</script>
</head>

<body>

	<!--하단컨텐츠-->
	<div id="container02">
		<div class="submain">
			<div>
				<img src="/images/sub/contitle_ext.png" alt="extension" />
			</div>
			<div class="wrapdownbox10">

				<div class="downboxsub25">
					<dl>
						<dd>NetMiner의 확장 프로그램(Extension)은 NetMiner를 원하는 대로 사용할 수 있도록
							도와주는 부가 프로그램입니다. 확장 프로그램을 통해 NetMiner에 새로운 기능을 추가해 보십시오.</dd>
						<dd>
							<img src="/images/overview/ext_overview.png" width="830px"></img>
						</dd>
					</dl>
				</div>
				<div class="downboxsub13">
					<h1>[Brochure] NetMiner Extension</h1>
					<div class="btn_mnoti"
						onclick="_download('brochure/intro_extension_K.pdf');"
						style="cursor: pointer">Down</div>
				</div>

				<div class="downboxsub26">
					<h1>주요 확장 프로그램 소개</h1>
					<div style="float: right; font-size: 12px;">※ 데이터 제공 기관의 운영
						정책이 변경되면 서비스가 중단되거나 변경될 수 있습니다.</div>
					<h2>SNS Data Collector</h2>
					<dl>
						<dt>전 세계적으로 널리 이용되는 소셜 미디어인 페이스북, 유튜브, 트위터, 인스타그램에서 네트워크 데이터와
							텍스트 데이터를 수집합니다. 소셜 미디어 상에서 오피니언 리더와 특정 이슈 및 기관에 대한 여론 동향을 파악할 수
							있는 기능입니다.</dt>
						<dt style="margin-left: 15%;">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/1hBH5-j0GdM?rel=0"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>
						</dt>
						<dt>
							<li>SNS 데이터 수집</li>
							<div>페이스북, 트위터, 유튜브, 인스타그램의 데이터를 수집합니다(서비스에 따라 공개 API 활용).
								특정 브랜드/인물/기관의 메시지, 어떤 이슈에 대한 온라인 여론을 이해할 수 있습니다. 또한 특정 지역에서 작성된
								인스타그램의 게시물을 가져올 수도 있습니다. 몇 번의 클릭으로 언제든지 필요할 때마다 직접 데이터를 수집하세요.</div>
							<li>텍스트 마이닝</li>
							<div>트윗글, 동영상 제목 및 설명, 포스트, 댓글 등 텍스트 데이터에서 주요 키워드를 추출하고 추출한
								단어끼리의 네트워크 생성하여 시각화 할 수 있습니다. 또한 단어의 중요도 평가 지수인 TF-IDF 와 빈도를 함께
								제공하여 쉽게 데이터를 필터링 하고 워드클라우드로 표현할 수 있습니다. 그리고 토픽모델링 기법을 이용하여 세부
								토픽을 파악할 수 있습니다.</div>
							<div>
								<a href="package11.do">Learn More >></a>
							</div>
							<li>네트워크 데이터 자동 추출</li>
							<div>소셜 미디어는 다양한 네트워크 데이터를 포함합니다. 예를 들어, SNS Data Collector
								는 트위터에서 Retweet 이 발생한 경우, 트윗글을 작성한 이용자와 Retweet 을 한 이용자 간의 네트워크를
								생성합니다. 또한 이용자와 게시글, 이용자와 이용자가 사용한 단어 등 다양한 네트워크를 구성하여 제공합니다.</div>
						</dt>
					</dl>
				</div>
				<div class="downboxsub26">
					<h2>Biblio Data Collector</h2>
					<dl>
						<dt>
							<ul>
								<li>연구 동향 분석에 필수적인 학술 논문 서지 정보를 온라인에서 수집하거나, Web of
									Science, SCOPUS 와 같은 학술 논문 웹사이트에서 이미 수집하여 저장한 논문 서지 정보
									파일(*.ris, *.ciw)을 가져올 수 있습니다.</li>
							</ul>
						</dt>
						<dt style="margin-left: 15%;">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/U7V8cfgZDj8?rel=0"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>
						</dt>
						<dt>
							<li>온라인 학술 문헌 정보 수집</li>
							<div>학술 논문 서지 정보를 온라인에서 바로 수집할 수 있습니다. 간단한 검색 키워드만 넣으면,
								SPRING, KCI 의 학술 데이터를 바로 가져올 수 있습니다. 수집 뿐만 아니라, 이미 수집하여 저장한 Web
								of Science, Scopus 의 서지 정보 파일(*.ris)을 가져올 수도 있습니다.</div>
							<li>간편한 데이터 처리</li>
							<div>
								연구 동향 분석은 여러 번의 데이터 전처리를 요하는 작업입니다. 수많은 문헌에서 사용된 단어를 빠르게 추출해야
								하고, 같은 이름의 저자가 동일인인지 아닌지를 판별해야 합니다. Biblio Data Collector는 쉽게
								단어를 추출할 수 있는 텍스트 처리 기능을 가지고 있고 ( <a style="float: inherit;"
									href="package11.do">More >></a>), 특히 저자 키워드를 자동으로 고유 명사로 등록해주어,
								번거로운 처리 작업을 줄여줍니다. 또한 공저자, 저자 키워드, 소속기관 등의 정보를 활용하여 동명이인을 분별할 수
								있습니다.
							</div>

							<li>네트워크 데이터 자동 추출</li>
							<div>학술 문헌 정보에는 저자 간 공동 저술 네트워크, 사용 단어 혹은 저자 키워드 간 네트워크 등
								다양한 네트워크 데이터가 존재합니다. 이를 통해, 주요 연구자와 공동 연구가 빈번한 응집그룹을 확인할 수 있고,
								또한 주목 받는 주제/키워드가 무엇인지 이해할 수 있습니다.</div>
						</dt>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단컨텐츠 -->
</body>
</html>


