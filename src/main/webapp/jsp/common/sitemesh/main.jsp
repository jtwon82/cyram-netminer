<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" lang="utf-8">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=1060" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	
	<meta name="robots" content="ALL"/>
  	<meta name="description" content="Social network analysis software - NetMiner. NetMiner is a software tool for exploratory analysis and visualization of large network data. NetMiner 4 embed internal Python-based script engine which equipped with the automatic Script Generator for unskilled users. Then the users can operate NetMiner 4 with existing GUI or programmable script language." />
  	<meta name="Keywords" content="Sna, social network, social network analysis, social network analysis software, netminer, sna software, sna program, social network analysis program, social network analysis software, social network analysis tool, network analysis, network graph drawing, social network tool, complex networks, graphs, graph network, network visualization, network map, Graph theory, network analysis, text mining, graph mining, data mining, text machine learning, graph machine learning, data machine learning, statistical network, social network service, link analysis, knowledge network, Fraud detection, IOT, 빅데이터분석, 사회관계망, 소셜네트워크분석, netminer, sna, socialnetworkanalysis, 사회관계망분석, 사회연결망분석, collaborationmap, knowledgenetwork, linkanalysis, socialnetwork, 그래프마이닝, 네트워크과학, 네트워크마이닝, 네트워크맵, 네트워크시각화, 네트워크지도, 데이터분석방법, 링크분석, 연계분석, 부서간업무흐름, 사기적발, 사회연결망, 사회연결망이론, 소셜네트워킹서비스, 조직관계망, 지식네트워크, 지식네트워크분석, 통화네트워크, 협업네트워크, 협업지도, socialnetworkingservice , socialnetworkservice, 공식비공식관계, 링크, 비공식관계, 소셜네트워크미디어, 소셜마케팅, 네트워크 그래프" />
	<meta name="naver-site-verification" content="83b4277bf5693661435097a884e4b139ee3bcf93"/>
	<meta name="google-site-verification" content="YwLtIyuaCsbIUKJ3us_dt4GTjdcFylp4dsIzWdc_o-o" />
  	<meta name="Subject" content="netminer"/>
  	<meta name="author" content="Network Analysis"/>
  	<meta name="writer" content="NetMiner"/>
  	<meta name="copyright" content="cyram"/>	
  	<meta http-equiv="Cache-Control" content="No-Cache"/>
  	<meta http-equiv="Pragma" content="No-Cache"/> 
	
	<title>NetMiner - Social Network Analysis Software</title>

<c:choose>
	<c:when test="${ IS_KOR eq 'false' }">
		<link rel="stylesheet" type="text/css" href="/css/common_eng.css" />
		<!-- <script type="text/javascript">salelink = "<a href=\"/aboutus/notice/notice-view.do?wr_id=112\">";</script> -->
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" type="text/css" href="/css/common.css" />
		<!--  <script type="text/javascript">salelink = "<a href=\"/aboutus/notice/notice-view.do?wr_id=155\">";</script> -->
	</c:otherwise>
</c:choose>

	<link rel="stylesheet" type="text/css" href="/css/main.css" />


	<style>
		.movie { width:1000px; margin:0 auto; text-align:center }
		.movie:after{content:""; display:block; clear:both}
		<!--.movie li{float:left}-->
		
		.btn {margin:5px;}
		.bullet_fir { position:absolute; z-index:999; top:400px; width:100%; background:red; text-align:center; }
		.bullet { margin:-30px 0 0 0px; width:100%; }
	</style>
	
	<script type="text/javascript" src="/js/jquery-relation.min.js"></script>
	<script type="text/javascript" src="/js/jquery.placeholder.js"></script>
	<script type="text/javascript" src="/js/util.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>

	<script type="text/javascript" src="/js/netminer.js"></script>
	<script type="text/javascript" src="/js/top.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	
	<script type="text/javascript" src="/js/jquery-syaku.rolling.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js" ></script>  
	<script type="text/javascript">
	function openLayer(targetID, options) {
		var $layer = $('#'+targetID);
		var $close = $layer.find('.close');
		var width = $layer.outerWidth();
		var ypos = options.top;
		var xpos = options.left;
		var marginLeft = 0;
		if(xpos==undefined){
		xpos = '50%';
		marginLeft = -(width/2);
		}
		if(!$layer.is(':visible')){
		$layer.css({'top':ypos+'px','left':xpos,'margin-left':marginLeft})
		.show();
		}
		
		$close.bind('click',function(){
		
		if($layer.is(':visible')){
		
		$layer.hide();
		}
		
		return false;
		
		});
	};
	</script>

	<decorator:head />

</head>

<body onload="<decorator:getProperty property='body.onload' />" onunload="<decorator:getProperty property='body.onunload' />">

<div id="wrap" class="active-0-0-0">

<page:apply-decorator name="panel" page="/common/layout/top-read.do" />

  <!-- Layout : container Start -->
		<div id="container">
			<div class="contents">

				<ul class="movie">
					<!--<li id='p_click3' style="cursor:pointer">이전</li>-->
					<!-- width 를 늘일 경우 노출되는 아이템이 늘어납니다. 다음 이전 버튼은 필수는 아닙니다. -->
					<li style="margin: 0 auto"><div id="srolling3"
							style="position: relative; overflow: hidden; width: 1060px; height: 387px;"></div></li>
					<!--<li id='n_click3' style="cursor:pointer">다음</li>-->
				</ul>

				<!-- 블릿을 사용할 경우 추가하세요. 꼭 id 값을 이용해야 하며, srolling_bullet_item 아이템 수만큼 노출되는 블릿영역입니다. 블릿 idx 값을 얻고 싶다면 {idx}  를 삽입하시면 idx 값으로 치환됩니다.-->
				<div class="bullet_fir">
					<div id='srolling_bullet' class='bullet'>
						<span id='srolling_bullet_item'> <img
							style="cursor: pointer;" src='/images/main/bullet_off.png'>
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- Layout : container End -->

<decorator:body />
	
<!--//풋터-->

<c:choose>
	<c:when test="${ IS_KOR eq 'false' }">
	  <div id="footer">
	    <div class="copytext">&#xa9; Cyram Inc. All Rights Reserved. Since 2000<br />
	      <img src="/images/main/social_title.png" alt="social" />
	      <a href="https://www.youtube.com/user/CyramNetminer"><img src="/images/main/social_01.png" alt="youtube" /></a>
	      <a href="https://www.facebook.com/cyramnetminer"><img src="/images/main/social_02.png" alt="facebook" /></a>
	      <a href="https://twitter.com/netminer"><img src="/images/main/social_03.png" alt="twitter" /></a>
	      <a href="/aboutus/aboutus.do"><img src="/images/main/footer02.gif" alt="support" style="vertical-align:middle" /></a>
	      <a href="http://www.cyram.com/en/" target="_blank"><img src="/images/main/footer03.gif" alt="cyram"  /></a>
	      <a href="http://www.netminer.com/html/PrivacyPolicy.html">|&nbsp;&nbsp;Privacy Policy</a>
	      </div>
	  </div>
	  <script type="text/javascript">
	  var noticeid = 115;
	  </script>
	</c:when>
	<c:otherwise>
	  <div id="footer">
	    <div class="copytext">(주)사이람<br/>(13494) 경기도 성남시 분당구 대왕판교로 670 유스페이스2 B동 904호 TEL. 031-739-8352 FAX. 031-739-8354 Email. netminer@cyram.com 대표자명:김기훈<br/>사업자등록번호:105-86-11863
	    &#xa9; Cyram Inc. All Rights Reserved. Since 2000<br />
	      <img src="/images/main/social_title.png" alt="social" />
	      <a href="https://www.youtube.com/user/CyramNetminer" target="_blank"><img src="/images/main/social_01.png" alt="youtube" /></a>
	      <a href="https://www.facebook.com/CyramInc" target="_blank"><img src="/images/main/social_02.png" alt="facebook" /></a>
	      <a href="https://twitter.com/cyraminc" target="_blank"><img src="/images/main/social_03.png" alt="twitter" /></a>
	      <a href="/aboutus/aboutus.do"><img src="/images/main/footer02.gif" alt="support" style="vertical-align:middle" /></a>
	      <a href="http://www.cyram.com/" target="_blank"><img src="/images/main/footer03.gif" alt="cyram"  /></a></div>
	  </div>
    <script type="text/javascript">
    var noticeid = 159;
    </script>
	</c:otherwise>
</c:choose>

<script type="text/javascript"> 
<!--
page.init();
//mainSet.init();//-->
</script>

<script type="text/javascript">

    jQuery(function() {
    var data2 = [
    	`<c:choose>
    	<c:when test="${ IS_KOR eq 'false' }">
    	<a href="/aboutus/notice/notice-view.do?wr_id=126\"><img src='/images/main/together_txt6.png' width='1191' height='387'></a>    	</c:when>
    	<c:otherwise>
    	<a href="/aboutus/notice/notice-view.do?wr_id=172\"><img src='/images/main/together_txt6.png' width='1191' height='387'></a>
    	</c:otherwise>
    	</c:choose>`,
//      "<a href=\"https://www.netminer365.com\"><img src='/images/main/netminer_banner.png' width='1191' height='387'></a>",
//      "<a href=\"/product/extensions.do\"><img src='/images/main/together_txt4.png' width='1191' height='387'></a>",
      "<a href=\"/product/overview.do\"><img src='/images/main/together_txt1.png' width='1191' height='387'></a>",
//      "<a href=\"/product/features.do\"><img src='/images/main/together_txt2.png' width='1191' height='387'></a>",
//      "<a href=\"/aboutus/publications.do\"><img src='/images/main/together_txt3.png' width='1191' height='387'></a>"
    ];
    
    /*
    data : [ ], // 롤링될 아이템 데이터
    name : '#srolling_area', // 롤링 대상 element
    item_count : 1, // 한번 이동될 아이템 수
    cache_count : 5, // 최초 한번 임시로 생성될 아이템 수 (고치지마세요)
    width : 100, // 노출될 아이템 크기 (필수 : 실제 아이템 보다 약간 크게 설정하세요)
    height : 100, // 노출될 아이템 크기 (필수 : 실제 아이템 보다 약간 크게 설정하세요)
    auto : false, // 자동 이동 설정
    delay : 1000, // 이동 후 대기 시간
    delay_frame : 1000, // 이동 속도
    move : 'left', // 이동 방향 left , right , up , down 
    prev : '#srolling_prev', // 이전 아이템 이동 버튼 element
    next : '#srolling_next', // 다음 아이템 이동 버튼 element
    is_bullet : false, // 블릿 사용여부
    bullet : '#srolling_bullet', // 블릿 버튼 element
    bullet_item : '#srolling_bullet_item', // 블릿 버튼 item element
    bullet_style_func : null // 선택된 블릿 효과주기
    */

    // 좌우 블릿 자동 스크롤 예제
    jQuery("#srolling3").srolling({
      data : data2,
      auto : true,
      width : 1191,
      height : 387,
      delay : 2000,
      delay_frame : 1000,
      move : 'left',
//      prev : '#p_click3',
//      next : '#n_click3',
      is_bullet : true,
      bullet_style_func : function(bullet,get_bullet) {
        // bullet = $('#srolling_bullet_item') 리턴받음
        // get_bullet = $('선택된 class 블릿') 리턴받음

        // 모든 버튼 블릿 초기화
        jQuery('span',bullet).each(function() {
          var img = jQuery('img',this);
          var src = img.attr('src');
          src = src.replace('on','off');
          img.attr('src',src);
        });

        // 선택된 블릿 효과 주기
        var img = jQuery('img',get_bullet);
        var src = img.attr('src');
        src = src.replace('off','on');
        img.attr('src',src);

      }
    });

  });

</script>

<div id="downloadFileHTML" style="display:none;"></div>
<div id="return_message" style="display:none"></div>
</body>
</html>
