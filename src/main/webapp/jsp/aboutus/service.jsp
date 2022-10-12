<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javascript">

	function _download(bf_file) {
		$('#downloadFileHTML').html("<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_download_storage-read.do?bf_file=" + bf_file + "&bf_source=" + bf_file + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}

	</script>    
</head>
	
<body>
	
  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > <img src="/images/sub/contitle25.gif" alt="service"/>
     <div class="resourcebox" >
      <div class="resource02">
           <ul>
     <li>Get the help you need quickly and easily
</li>
</ul>
        </div>
</div>
    <div class="buybox buybox_boxline2" >
        <h1>Technical Support
</h1>
        <ul>
          <li>Technical Support Program is in preparation now.<br/><br/>
          NetMiner Technical Support Program help to ensure that your NetMiner operates efficiently.<br/>
          Technical support and upgrade will be included in Technical Support Program.
</li>
<li style="height:20px;"></li>
          </ul>
<!--        
  <ul style="padding-top:10px"><li>
            <div class="btn_mnoti"><a href="mailto:netminer@cyram.com" style="color:#808080">Detail</a></div>
  </li></ul>
-->
      </div>
    
    </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
