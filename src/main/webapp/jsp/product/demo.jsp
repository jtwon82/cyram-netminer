<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

	<script type="text/javascript">
 
	function openLayer(url) {
		$("body").append("<div id='gray_layer' style='position:fixed; left:0px; top:0px; height:100%; width:100%; background-color:#dedede; filter:alpha(opacity=10); opacity:0.10;'></div>");

		var modal = $('#modal_movie');

		var win = $(window);
		var top = (win.height() / 2) - (modal.outerHeight() + 10) + win.scrollTop();
		var left = 200;
		
		modal.css("top", top);
		modal.css("left", left);
		modal.append("<iframe id='iframe_movie' width='560' height='315' src='' frameborder='0' allowfullscreen></iframe>");
		modal.show();
		
		$('#iframe_movie').attr("src", url);
	}

	function closeLayer() {
		$("#gray_layer").remove();
		$("#iframe_movie").remove();
		$("#modal_movie").hide();
	}
	
	</script>    
</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" >
    <div > <img src="/images/sub/contitle20.gif" alt="demo" width="76" height="30"/></div>
      <!--about-->
      <div class="viewtab02 mdt20" id="about">
        <ul>
          <li  class="mdl1"><a href="#about">About NetMiner</a></li>
          <li  id="mouseout02"class="mdl1"><a href="#data">Data Handling</a></li>
          <li  id="mouseout02" class="mdl1"><a href="#analy">Analysis and Visualization</a></li>
        </ul>
      </div>
      <div class="viewth02" >
        <ul>
          <!--반복-->
          <li><span> <img src="/images/sub/video01.gif" alt="appimg" width="200" height="120" onclick="openLayer('https://www.youtube.com/embed/DS4WESARNog?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/DS4WESARNog?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : Getting Started with NetMiner</h1>
            <h3>Ver.  NetMiner 3<strong> play time 12:16</strong></h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td > Let's start operating NetMiner
                  <!--내용넣어주세요-->
                </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti" onclick="openLayer('https://www.youtube.com/embed/DS4WESARNog?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video29.gif"  width="200" height="120" onclick="openLayer('https://www.youtube.com/embed/9GZVhmZou_c?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/9GZVhmZou_c?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner Script Features</h1>
            <h3>Ver. NetMiner <strong>play time 8:24</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  About NetMiner Script. What is it good for? </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/9GZVhmZou_c?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <li><span> <img src="/images/sub/demo_preview.jpg"  width="200" height="120" onclick="openLayer('https://www.youtube.com/embed/1hBH5-j0GdM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/1hBH5-j0GdM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner Extension 1) SNS Data Collector</h1>
            <h3>Ver. NetMiner 4. SNS Data Collector 2 <strong>play time 2:54</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Do you want to collect the social media data anytime?
                </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/9GZVhmZou_c?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>

          <li><span> <img src="/images/sub/BDCdemo_preview.png"  width="200" height="120" onclick="openLayer('https://www.youtube.com/embed/U7V8cfgZDj8?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/U7V8cfgZDj8?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner Extension 2) Biblio Data Collector</h1>
            <h3>Ver. NetMiner 4. Biblio Data Collector 1 <strong>play time 1:36</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  The easiest tool to analyze and visualize co-authorship relations and research trend
                </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti" onclick="openLayer('https://www.youtube.com/embed/U7V8cfgZDj8?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>

          <!--//반복-->
        </ul>
      </div>
      <!--//about-->
      <!--data handling-->
      <div class="viewtab02 mdt20" id="data">
        <ul>
          <li  id="mouseout02" class="mdl1"><a href="#about">About NetMiner</a></li>
          <li class="mdl1"><a href="#data">Data Handling</a></li>
          <li  id="mouseout02" class="mdl1"><a href="#analy">Analysis and Visualization</a></li>
        </ul>
      </div>
      <div class="viewth02" >
        <ul>
          <!--반복-->
          <li><span> <img src="/images/sub/video02.gif"width="200" height="120" onclick="openLayer('https://www.youtube.com/embed/iZS1akxIU0I?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/iZS1akxIU0I?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.1 Handling Project</h1>
            <h3>Ver.  NetMiner 3<strong> play time 2:00</strong></h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td >Handling Project
                  <!--내용넣어주세요-->
                </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti" onclick="openLayer('https://www.youtube.com/embed/iZS1akxIU0I?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video03.gif" onclick="openLayer('https://www.youtube.com/embed/BDdnyAIiqOs?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/BDdnyAIiqOs?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.2 Handling Workfile</h1>
            <h3>Ver. NetMiner 3 <strong>play time 2:37</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Handling Workfile</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/BDdnyAIiqOs?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video04.gif" onclick="openLayer('https://www.youtube.com/embed/2SzDW8XHip4?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/2SzDW8XHip4?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.3 Creating Data</h1>
            <h3>Ver. NetMiner 3 <strong>play time 5:28</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Handling Workfile</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/2SzDW8XHip4?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video05.gif" onclick="openLayer('https://www.youtube.com/embed/LX6B0eCtiSs?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/LX6B0eCtiSs?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.4.1 Importing Data File1</h1>
            <h3>Ver. NetMiner3 <strong>play time 6:35</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Importing Data File1</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/LX6B0eCtiSs?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video06.gif" onclick="openLayer('https://www.youtube.com/embed/uBd7_pA2P3k?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/uBd7_pA2P3k?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.4.2 Importing Data File2</h1>
            <h3>Ver. NetMiner3 <strong>play time 7:00</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Importing Data File2</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/uBd7_pA2P3k?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video07.gif" onclick="openLayer('https://www.youtube.com/embed/9WgmTujaHho?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/9WgmTujaHho?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.5 Exporting as File</h1>
            <h3>Ver. NetMiner3 <strong>play time 4:19</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Exporting as File</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/9WgmTujaHho?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video08.gif" onclick="openLayer('https://www.youtube.com/embed/EEeXAfB3Txo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/EEeXAfB3Txo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.6 Editing data </h1>
            <h3>Ver. NetMiner 3 <strong>play time 7:38</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Editing data </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/EEeXAfB3Txo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video09.gif" onclick="openLayer('https://www.youtube.com/embed/vMQh2zzqtQQ?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/vMQh2zzqtQQ?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.7 Editing data Using Graph Editor</h1>
            <h3>Ver. NetMiner3 <strong>play time 3:24</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Editing data Using Graph Editor</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/vMQh2zzqtQQ?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video10.gif" onclick="openLayer('https://www.youtube.com/embed/sKz1cGsdrQE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/sKz1cGsdrQE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.8 Available Actions in &quot;Current Workfile&quot;</h1>
            <h3>Ver. NetMiner 3 <strong>play time 4:04</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Available Actions in &quot;Current Workfile&quot;</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/sKz1cGsdrQE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video11.gif" onclick="openLayer('https://www.youtube.com/embed/-OJe3Txt6xc?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/-OJe3Txt6xc?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 1.9 Available Actions in &quot;Workfile Tree&quot;</h1>
            <h3>Ver. NetMiner 3 <strong>play time 2:56</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Available Actions in &quot;Workfile Tree&quot;</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/-OJe3Txt6xc?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video12.gif" onclick="openLayer('https://www.youtube.com/embed/o11iJ3moBSE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/o11iJ3moBSE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.1 Handling Process Panel Options</h1>
            <h3>Ver. NetMiner 3 <strong>play time 1:41</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Handling Process Panel Options</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/o11iJ3moBSE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video13.gif" onclick="openLayer('https://www.youtube.com/embed/auAvmDke1_A?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/auAvmDke1_A?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.2 Generating and Browsing Outputs in a Session</h1>
            <h3>Ver. NetMiner3 <strong>play time 0:53</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Generating and Browsing Outputs in a Session</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/auAvmDke1_A?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video14.gif" onclick="openLayer('https://www.youtube.com/embed/PgBGXP205mE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/PgBGXP205mE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.3 Handling Filter</h1>
            <h3>Ver. NetMiner 3 <strong>play time 1:30</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Handling Filter</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/PgBGXP205mE?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video15.gif" onclick="openLayer('https://www.youtube.com/embed/ulsDoJfylCA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/ulsDoJfylCA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.4 Transforming Data Using Matrix Calculator</h1>
            <h3>Ver. NetMiner 3 <strong>play time 3:49</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Transforming Data Using Matrix Calculator</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/ulsDoJfylCA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video16.gif" onclick="openLayer('https://www.youtube.com/embed/FY2zd5AwFDM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/FY2zd5AwFDM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.5 Using Output Tables Recursively</h1>
            <h3>Ver. NetMiner 3 <strong>play time 6:39</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Using Output Tables Recursively</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/FY2zd5AwFDM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video17.gif" onclick="openLayer('https://www.youtube.com/embed/2Mh0hWRykFo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/2Mh0hWRykFo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.6 Querying Data</h1>
            <h3>Ver. NetMiner 3 <strong>play time 3:47</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Querying Data</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/2Mh0hWRykFo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video18.gif" onclick="openLayer('https://www.youtube.com/embed/nkTF4TJEoAQ?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/nkTF4TJEoAQ?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.7.1 Transforming Data</h1>
            <h3>Ver. NetMiner 3 <strong>play time 2:29</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Transforming Data</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/nkTF4TJEoAQ?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video19.gif" onclick="openLayer('https://www.youtube.com/embed/bBlPNzRRCIk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/bBlPNzRRCIk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.7.2 Generating Analysis Result - Degree Centrality</h1>
            <h3>Ver. NetMiner 3 <strong>play time 2:27</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Generating Analysis Result - Degree Centrality</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/bBlPNzRRCIk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video20.gif" onclick="openLayer('https://www.youtube.com/embed/RNl9hrsKxwo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/RNl9hrsKxwo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 2.7.4 Generating Visualization Outputs - Spring 2D</h1>
            <h3>Ver. NetMiner 3 <strong>play time 1:27</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Generating Visualization Outputs - Spring 2D</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/RNl9hrsKxwo?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
        </ul>
      </div>
      <!--//data handling-->
      
      <!--Analysis-->
      <div class="viewtab02 mdt20" id="analy">
        <ul>
          <li  id="mouseout02" class="mdl1"><a href="#about">About NetMiner</a></li>
          <li id="mouseout02" class="mdl1"><a href="#data">Data Handling</a></li>
          <li   class="mdl1">Analysis and Visualization</li>
        </ul>
      </div>
      <div class="viewth02" >
        <ul>
          <!--반복-->
          <li><span> <img src="/images/sub/video21.gif" onclick="openLayer('https://www.youtube.com/embed/MHcF3pJg8TM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/MHcF3pJg8TM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.1 Drawing Network Map</h1>
            <h3>Ver.  NetMiner 3<strong> play time 2:18</strong></h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td > Drawing Network Map
                  <!--내용넣어주세요-->
                </td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"  onclick="openLayer('https://www.youtube.com/embed/MHcF3pJg8TM?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
           
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video22.gif" onclick="openLayer('https://www.youtube.com/embed/mGC6G5kN2rA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/HtaW0RrDog0?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.2 Styling Nodes and Links</h1>
            <h3>Ver. NetMiner 3 <strong>play time 8:02</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Styling Nodes and Links</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/mGC6G5kN2rA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video23.gif" onclick="openLayer('https://www.youtube.com/embed/mGC6G5kN2rA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/mGC6G5kN2rA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.3 Selecting Nodes and Links on Network Map</h1>
            <h3>Ver. NetMiner 3 <strong>play time 4:18</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Selecting Nodes and Links on Network Map</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/mGC6G5kN2rA?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video24.gif" onclick="openLayer('https://www.youtube.com/embed/0GxiQSe4L7I?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/0GxiQSe4L7I?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.3.4 Using Selected Nodes and Links</h1>
            <h3>Ver. NetMiner 3 <strong>play time 6:16</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Saving Selected Nodes as Selection - Saving Selected Threshold
                    as QuerySet - &quot;Run Process&quot; with Selected Nodes
                    - Saving Selection as New Workfile</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/0GxiQSe4L7I?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video25.gif" onclick="openLayer('https://www.youtube.com/embed/PkQ4WlN1EjU?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/PkQ4WlN1EjU?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.5.1 Shortest Path</h1>
            <h3>Ver. NetMiner 3 <strong>play time 3:20</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Inspecting Analysis Results in Network Map - EX 1) Shortest
                    Path</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/PkQ4WlN1EjU?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video26.gif" onclick="openLayer('https://www.youtube.com/embed/eRvzvPc-_hk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/eRvzvPc-_hk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.5.2 Betweenness Community</h1>
            <h3>Ver. NetMiner 3 <strong>play time 2:45</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Inspecting Analysis Results in Network Map - EX 2) Betweenness
                    Community</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/eRvzvPc-_hk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video27.gif" onclick="openLayer('https://www.youtube.com/embed/7hjyX0d3nHk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/7hjyX0d3nHk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.5.3 Degree Centrality</h1>
            <h3>Ver. NetMiner 3 <strong>play time 2:11</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                Inspecting Analysis Results in Network Map - EX 3) Degree Community</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/7hjyX0d3nHk?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
          <!--반복-->
          <li><span> <img src="/images/sub/video28.gif" onclick="openLayer('https://www.youtube.com/embed/TBXCbxWP0x8?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer"/></span>
            <h1 onclick="openLayer('https://www.youtube.com/embed/TBXCbxWP0x8?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">NetMiner : 3.6 Controlling Network Map Panel</h1>
            <h3>Ver. NetMiner 3 <strong>play-time 4:25</strong> </h3>
            <!--내용을 뿌려주는곳-->
            <table  border="0" cellspacing="0" cellpadding="0" style="width:600px;height:50px;">
              <tr>
                <td ><!--내용넣어주세요-->
                  Controlling Network Map Panel: Zoom In/Out, Navigation, Rotation,
                    Flipping</td>
              </tr>
            </table>
            <!--//내용을 뿌려주는곳-->
            <!--버튼-->
            <div class="btn_mnoti"   onclick="openLayer('https://www.youtube.com/embed/TBXCbxWP0x8?list=PL66DA49D4FCFA7FE3');" style="cursor:pointer">view</div>
            <!--//버튼-->
          </li>
          <!--//반복-->
        </ul>
      </div>
      <!--//Analysis-->
 

    </div>

   <!--팝업레이어-->
   <div id="modal_movie" style="position: absolute; z-index: 999; top: 356.5px; left: 200px; width: 580px; height: 320px; display: none; background-color:#efefef; padding:20px 15px 20px 20px ;">
    <a href="javascript:closeLayer();" class="close"><img src="/images/main/layer_close.gif" alt="close" style="float:right;" /></a>
   </div>   
   <!--//팝업레이어-->

  </div>
  <!--//하단컨텐츠-->

</body>
</html>
