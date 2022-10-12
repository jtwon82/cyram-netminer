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
	
	
	<title>NetMiner - Social Network Analysis Software</title>
	
<c:choose>
	<c:when test="${ IS_KOR eq 'false' }">
		<link rel="stylesheet" type="text/css" href="/css/common_eng.css" />
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" type="text/css" href="/css/common.css" />
	</c:otherwise>
</c:choose>

	<link rel="stylesheet" type="text/css" href="/css/sub.css" />

	
	<script type="text/javascript" src="/js/jquery-relation.min.js"></script>
	<script type="text/javascript" src="/js/jquery.placeholder.js"></script>

	<script type="text/javascript" src="/js/util.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>

	<script type="text/javascript" src="/js/netminer.js"></script>
	<script type="text/javascript" src="/js/top.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	<script type="text/javascript" src="/js/bootstrap.js" ></script>

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
	
	function d_login_move() {
		if(confirm("<c:out value = '${msg_login_confirm}'/>")) {
			top.location.href = "/login/login-read.do";
		}
	}
	
	
	</script>

	<decorator:head />

</head>

<body onload="<decorator:getProperty property='body.onload' />" onunload="<decorator:getProperty property='body.onunload' />">

<div id="wrap" class="active-0-0-0">

<page:apply-decorator name="panel" page="/common/layout/top-read.do" />

<decorator:body />

         <!--하단에 따라다니는 buy,down-->
         
    <c:choose>
	<c:when test="${ IS_KOR eq 'false' }">     
  <div class="footer_banner">
      <div class="wrapdownbox04">
       <div class="downboxsub10" >
       <!-- <h1><img src="../../images/sub/downtitle01.gif" alt="retail version"></h1>-->
         <h1>Try NetMiner</h1>
        <dl>
        <dt  class="mdt10">Start your fully featured 14-day free trial<br/>&nbsp;</dt>
        <dt class="mdt10"><a class="btn_mnoti" href="/download_buy/download/download-readList.do">Download</a></dt>
        </dl>
       </div>
       <div class="downboxsub09" >
           <h1>Get NetMiner</h1>
        <dl>
        <dt  class="mdt10">Explore your network data visually and interactively and detect underlying patterns and structures of the network</dt>
        <dt class="mdt10"><a class="btn_mnoti" href="/download_buy/buy/buyEnterprise-read.do">Request</a></dt>
        </dl>
        </div>
      </div>
      </div>
      </c:when>
	<c:otherwise>
       <div class="footer_banner">
      <div class="wrapdownbox04">
       <div class="downboxsub12" >
       <!-- <h1><img src="../../images/sub/downtitle01.gif" alt="retail version"></h1>-->
         <h1>Try NetMiner</h1>
        <dl>
        <dt  class="mdt10">모든 기능이 제공되는 14일 무료 평가판 프로그램을 사용해 보십시오. 몇 번의 클릭만으로 NetMiner를 즉시 다운로드할 수 있습니다.</dt>
        <dt class="mdt10"><a class="btn_mnoti" href="/download_buy/download/download-readList.do">Download</a></dt>
        </dl>
       </div>
       <div class="downboxsub11" >
           <h1>Get NetMiner</h1>
        <dl>
        <dt  class="mdt10">NetMiner는 시각적, 상호작용적인 방식으로 네트워크 데이터를 탐색하고, 네트워크의 구조와 내재된 패턴을 발견할 수 있게 해줍니다.</dt>
        <dt class="mdt10"><a class="btn_mnoti" href="/download_buy/buy/buyEnterprise-read.do">Request</a></dt>
        </dl>
        </div>
      </div>
      </div>
      	</c:otherwise>
</c:choose>
      <!--하단에 따라다니는 buy,down-->

</div>
<!--//풋터-->
<c:choose>
	<c:when test="${ IS_KOR eq 'false' }">
	  <div id="footer">
	    <div class="copytext">&#xa9; Cyram Inc. All Rights Reserved. Since 2000<br />
	      <img src="/images/main/social_title.png" alt="social" />
	      <a href="https://www.youtube.com/user/CyramNetminer" target="_blank"><img src="/images/main/social_01.png" alt="youtube" /></a>
	      <a href="https://www.facebook.com/cyramnetminer" target="_blank"><img src="/images/main/social_02.png" alt="facebook" /></a>
	      <a href="https://twitter.com/netminer" target="_blank"><img src="/images/main/social_03.png" alt="twitter" /></a>
	      <a href="/aboutus/aboutus.do"><img src="/images/main/footer02.gif" alt="support" style="vertical-align:middle" /></a>
	      <a href="http://www.cyram.com/en/" target="_blank"><img src="/images/main/footer03.gif" alt="cyram"  /></a>
	      <a href="http://www.netminer.com/html/PrivacyPolicy.html">|&nbsp;&nbsp;Privacy Policy</a>
        </div>
	  </div>
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
	</c:otherwise>
</c:choose>

<script type="text/javascript"> 
<!--
page.init();
//mainSet.init();//-->
</script>


<div id="downloadFileHTML" style="display:none;"></div>
<div id="return_message" style="display:none">
</div>

</body>
</html>
