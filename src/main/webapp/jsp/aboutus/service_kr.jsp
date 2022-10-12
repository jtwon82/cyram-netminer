<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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
     <li>사이람은 NetMiner와 함께 제공하는 다양한 부가 서비스를 통해 네트워크 분석과 NetMiner가 고객에게 실질적으로 도움이 될 수 있도록 지원합니다.
</li>
</ul>
        </div>
</div>
    <div class="buybox buybox_boxline2" id="technicalsupport">
        <h1>Technical Support
</h1>
        <ul>
          <li>NetMiner 기술 지원 서비스는 현재 준비 중 입니다. <br/>
<br/>
NetMiner 기술 지원 서비스는 NetMiner에 대한 사용 지원 및 업그레이드 지원 등을 포함할 예정이며,
<br/>
<br/>
준비가 완료되는대로 안내해 드리겠습니다.</li>          </ul>
           
         <ul style="padding-top:10px"><li> <!--버튼-->
         <!--
            <div class="btn_mnoti"  onclick="_download();" style="cursor:pointer">Detail</div>
         -->
            <div class="btn_mnoti"><a href="mailto:netminer@cyram.com" style="color:#808080">Detail</a></div>
            <!--//버튼--></li></ul>
      </div>
    <div class="buybox buybox_boxline2" id="education" >
        <h1>Training Service</h1>
        <ul>
          <li>NetMiner 사용자를 위한 소셜 네트워크 분석 맞춤 교육을 통해 더욱 효과적으로 네트워크 분석과 NetMiner에 숙달할 수 있습니다. <br/>
<br/>
'기본-심화 교육 과정'을 통해 단계별로 NetMiner를 활용할 수 있도록 지원하고 있으며, ‘SNA를 활용한 연구동향 분석’, ‘텍스트 네트워크 분석’, ＇네트워크 데이터의  통계적 분석' 등과 같은 특별 과정을 개설하여 다양한 요구와 궁금증을 해소하고 있습니다.
<br/><br/>
NetMiner를 활용한 소셜 네트워크 분석 교육 서비스에 대한 더욱 자세한 내용을 확인해 보시기 바랍니다.<br/>
</li>
<li style="height:20px;"></li>
          </ul>
  <ul style="padding-top:10px"><li> <!--버튼-->
            <div class="btn_mnoti"><a href="https://onlineedu.cyram.com" target="_blank" style="color:#808080">Detail</a></div>
            <!--//버튼--></li></ul>           
         
      </div>
    <div class="buybox buybox_boxline2" id="Paper" >
        <h1>Research Consulting Service</h1>
        <ul>
          <li>NetMiner와 네트워크 분석 방법을 활용하여 논문을 저술하시는데 어려움을 겪고 계십니까?<br/>
<br/>

NetMiner 사용하시는 연구자들을 위해 논문 컨설팅 서비스를 제공하고 있습니다. <br/>
<br/>

전문가가 상담을 통해 데이터 작성에서부터 분석 실행까지 친절한 개별 안내를 해드립니다.<br/>
</li>
<li style="height:20px;"></li>
          </ul>
  <ul style="padding-top:10px"><li> <!--버튼-->
            <div class="btn_mnoti"><a href="mailto:edu@cyram.com" style="color:#808080">Contact</a></div>
            <!--//버튼--></li></ul>           
         
      </div>
    </div>
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
