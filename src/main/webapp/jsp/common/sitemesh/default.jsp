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
<!-- 	<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" /> -->
	
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

  <!-- Layout : container Start -->
  <div id="container">
    <div class="contents">
      <div class="mainItem together">
        <p class="copy">
        </p>
      </div>
      <div class="mainItem business">
        <p class="copy">
        </p>
      </div>
      <div class="mainItem business2">
        <p class="copy">
        </p>
      </div>
      <div class="mainItem business3">
        <p class="copy">
        </p>
      </div>
    </div>
  </div>
  <!-- Layout : container End -->

<decorator:body />
	
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
	      <a href="/aboutus/aboutus.do"><img src="/images/main/footer02.gif" alt="support" style="vertical-align:middle"/></a>
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
	      <a href="/aboutus/aboutus.do"><img src="/images/main/footer02.gif" alt="support" style="vertical-align:middle"/></a>
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
<div id="return_message" style="display:none"></div>
</body>
</html>
