<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=1060" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	
	<title><decorator:title default="NetMiner" /></title>
	
	<link rel="stylesheet" type="text/css" href="/css/admin.css" />
	
	<script type="text/javascript" src="/js/netminer.js"></script>
	<script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="/js/jquery.form.js"></script>
	<script type="text/javascript" src="/js/top_manager.js"></script>
	<decorator:head />

</head>

<body onload="<decorator:getProperty property='body.onload' />" onunload="<decorator:getProperty property='body.onunload' />">

	<page:apply-decorator name="panel" page="/common/layout/top_manager-read.do" />
     
	<decorator:body />

    </div>
  </div>
  <!--//하단컨텐츠-->
  <!--풋터-->
  <div id="footer">
    <div class="copytext">&#xa9; Cyram Inc. All Rights Reserved. Since 2000<br />
      <img src="/images/main/social_title.png" alt="social" /><img src="/images/main/social_01.png" alt="youtube" /><img src="/images/main/social_02.png" alt="facebook" /><img src="/images/main/social_03.png" alt="twitter" /><img src="/images/main/footer02.gif" alt="support" style="vertical-align:middle" /><img src="/images/main/footer03.gif" alt="cyram" /></div>
  </div>
</div>
<!--//풋터-->

<div id="downloadFileHTML" style="display:none;"></div>
	<div id="return_message" style="display:none">
	</div>
</body>
</html>
