<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javascript">
	
	var id = '';
	var arr = new Array();
	arr[1] = new Array('01.png', 'Applying Edge Bundling which is one of link layout algorithm');
	arr[2] = new Array('02.png', '3D network map.png');
	arr[3] = new Array('03.png', 'Cohesion(Community)');
	arr[4] = new Array('04.png', 'Cohesion(Component)');
	arr[5] = new Array('05.png', 'Fraud detection');
	arr[6] = new Array('06.png', 'Knowledge map_2D spring');
	arr[7] = new Array('07.png', 'Between the interested parties_Concentric');
	arr[8] = new Array('08.png', 'Influencer Networks Among Twitter User');
	arr[9] = new Array('09.png', 'Affinity network between drugs');
	arr[10] = new Array('10.png', 'Knowledge map(2)_2D spring');
	arr[11] = new Array('11.png', 'Communication network');
	arr[12] = new Array('12.png', 'Airline Network');
	arr[13] = new Array('13.png', 'Matrix Diagram');
	arr[14] = new Array('14.png', 'Pie chart');
	arr[15] = new Array('15.png', 'Fraud detection');
	arr[16] = new Array('16.png', 'Word Cloud(Tweets about legalization of abortion)');
 
	function openLayer(idx) {
		try {
			id = idx;
			fileName = arr[idx][0];
			txt = arr[idx][1];
			downurl = "images\\\\gallery\\\\" + fileName;
      url = "images/gallery/" + fileName;
			
			$("#gray_layer").remove();
			$("body").append("<div id='gray_layer' style='position:fixed; left:0px; top:0px; height:100%; width:100%; background-color:#dedede; filter:alpha(opacity=10); opacity:0.10;'></div>");

			var modal = $('#modal_movie');

			var win = $(window);
			var top = (win.height() / 2) - (modal.outerHeight() + 10) + win.scrollTop();
			var left = 200;
			
			modal.css("top", top);
			modal.css("left", left);
			
			$("#modal_h2").html("");
			$('#modal_h2').html(txt);
			$("#modal_img").attr("src", "");
			$('#modal_img').attr("src", "/" + url);
			$('#modal_download').html("");
			$('#modal_download').append("<a href=\"javascript:downloadImg('" + downurl + "', '" + fileName + "');\" style='color:#338700; text-decoration:underline;'>Download</a>");
//			$('#modal_download').append(" | Share ");
//			$('#modal_download').append(" <img src=\"/images/sub/shaare01.gif\" alt=\"twiter\"/>");
//			$('#modal_download').append(" <a href=\"javascript:twitter_share('" + url + "', '이 이미지를 공유');\"><img src=\"/images/sub/shaare01.gif\" alt=\"twiter\"/></a>");
//			$('#modal_download').append(" <img src=\"/images/sub/shaare02.gif\" alt=\"facebook\"/>");
//			$('#modal_download').append(" <img src=\"/images/sub/shaare03.gif\" alt=\"youtube\"/>");

			modal.show();
		} catch(e) {
			id = '';
		}
	}

	function twitter_share(url, txt) { 
		  var url = location.href; 
		  var snsUrl = "http://twitter.com/share?url=" + encodeURIComponent(url) + "&text=" + encodeURIComponent(txt); 
		  var sns_popup = window.open(snsUrl, "_snsPopupWindow"); 
		  sns_popup.focus(); 
	}
		
	function closeLayer() {
		id = '';
		$("#gray_layer").remove();
		$("#modal_h2").html("");
		$("#modal_download").html("");
		$("#modal_img").attr("src", "");
		$("#modal_movie").hide();
	}

	function pre() {
		var idx = 0;
		
		if(id == 0 || id == 1) {
			idx = 16;
		} else {
			idx = id - 1;
		}
		openLayer(idx);
	}
	
	function next() {
		var idx = 0;
		
		if(id == 16) {
			idx = 1;
		} else {
			idx = id + 1;
		}
		openLayer(idx);
	}
	
	function downloadImg(bf_file, bf_source) {
		$('#downloadFileHTML').html("<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_download_image-read.do?bf_file=" + bf_file + "&bf_source=" + bf_source + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}
	
	</script>    
</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > <div><img src="/images/sub/contitle22.png" alt="gallary"/></div>
      <div class="gallery" >
         <ul>
          <li style="padding-right:5px;">
          <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/01.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(1);" /></td>
  </tr>
  <tr>
    <td>Applying Edge Bundling which is one of link layout algorithm</td>
  </tr>
</table>
</li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/02.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(2);" /></td>
  </tr>
  <tr>
    <td>3D network map.png</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/03.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(3);" /></td>
  </tr>
  <tr>
    <td>Cohesion(Community)</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/04.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(4);" /></td>
  </tr>
  <tr>
    <td>Cohesion(Component)</td>
  </tr>
  
</table>
          </li>
         </ul>
         <ul class="mdt10">
          <li style="padding-right:5px;">
          <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/05.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(5);" /></td>
  </tr>
  <tr>
    <td>Fraud detection</td>
  </tr>
</table>
</li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/06.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(6);" /></td>
  </tr>
  <tr>
    <td>Knowledge map_2D spring</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/07.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(7);" /></td>
  </tr>
  <tr>
    <td>Between the interested <br/>parties_Concentric</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/08.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(8);" /></td>
  </tr>
  <tr>
    <td>Influencer Networks<br/>Among Twitter User</td>
  </tr>
  
</table>
          </li>
         </ul>
         <ul class="mdt10">
          <li style="padding-right:5px;">
          <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/09.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(9);" /></td>
  </tr>
  <tr>
    <td>Affinity network between <br/>drugs</td>
  </tr>
</table>
</li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/10.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(10);" /></td>
  </tr>
  <tr>
    <td>Knowledge map(2)_2D spring</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/11.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(11);" /></td>
  </tr>
  <tr>
    <td>Communication network</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/12.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(12);" /></td>
  </tr>
  <tr>
    <td>Airline Network</td>
  </tr>
  
</table>
          </li>
         </ul>
         <ul class="mdt10">
          <li style="padding-right:5px;">
          <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/13.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(13);" /></td>
  </tr>
  <tr>
    <td>Matrix Diagram</td>
  </tr>
</table>
</li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/14.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(14);" /></td>
  </tr>
  <tr>
    <td>Pie chart</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top;padding-right:5px;"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/15.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(15);" /></td>
  </tr>
  <tr>
    <td>Fraud detection</td>
  </tr>
  
</table>
          </li>
          <li  style="vertical-align:top"><table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/gallery/16.png" width="200" height="100" style="cursor:pointer;" onclick="openLayer(16);" /></td>
  </tr>
  <tr>
    <td>Word Cloud(Tweets about<br/>legalization of abortion)</td>
  </tr>
  
</table>
          </li>
         </ul>
      </div>


      
    </div>
    
   <!--팝업레이어-->
<div id="modal_movie" style="display:none; position:absolute; z-index:999; top:0px; left:0px; width:640px; height:380px; padding:10px 18px 10px; background-color:#efefef; border:1px solid #cfd0d1;">
    <div class="gabox01" style="width:635px;">
     <ul style="border:1px solid #efefef">
     <li><h2 id="modal_h2" style="font-weight:bold; margin:0 0 0 15px;"></h2><a href="javascript:closeLayer();" class="close"><img src="/images/main/layer_close.gif" alt="close" style="margin-top:-20px;float:right;"/></a> </li>
      <li style="margin-left:-5px; height:340px;"><table width="635" cellspacing="0" cellpadding="0" >
  <tr>
    <td style="width:25px;" align="left"><a href="javascript:pre();"><img src="/images/sub/ga_arrow01.gif"/></a></td>
    <td align="center"><img id="modal_img" src="" width="600" height="350" style="border: 1px solid #fff"/></td>
    <td style="width:10px;" align="left"><a href="javascript:next();"><img src="/images/sub/ga_arrow02.gif"/></a></td>
  </tr>
</table></li>
      <li class=" mdt5" style="text-align:right" id="modal_download"></li>
      
     </ul>
    </div>
</div>
   <!--//팝업레이어-->

  </div>
  <!--//하단컨텐츠-->

</body>
</html>
