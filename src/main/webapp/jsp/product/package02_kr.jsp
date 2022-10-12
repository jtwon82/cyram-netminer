<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<style type="text/css">
    p{letter-spacing:-0.05em;}
    </style>
</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    
  
    <div class="submain" >
             <img src="/images/sub/contitle_edition.png" alt="packages"/>
     
  

  <div class="viewtab02 mdt20">
       <ul>
        <li id="mouseout02" class="mdl1"><a href="/product/package01.do">Overview</a></li>   
        <li class="mdl1"><a href="/product/package02.do">Basic</a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package03.do">Advanced Analysis</a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package04.do">Exploration</a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package05.do">Tools </a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package06.do">Advanced Visualization</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package07.do">Statistics</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package10.do">Mining</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package09.do">Script</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package11.do">Semantic Network</a></li>		
       </ul>
  </div>
<div class="pacbox" >
        <h1>Basic Package</h1>
          <ul>
            <li>Basic Package 사용자는 가장 기본적인 NetMiner의 분석 기능을 사용할 수 있습니다.<br/><br/></li>
            <li>Basic Package에는 NetMiner가 실행되는 데 필요한 기본 프레임워크를 비롯하여, 데이터 관리, 데이터 변환( Data Transformation), 기본적인 SNA 지표(Basic Network Measures), 2D 네트워크 시각화 모듈( Network Visualization(2D)) 등이 포함되어 있습니다.</li>
          
            <li ><img src="/images/sub/package02.jpg" alt="NetMiner Basic Package" /></li>
        </ul>
         <h1 class="mdt20">Framework &amp; Data Management</h1>
          <ul>
            <li>Framework 과 Data Management는 NetMiner를 실행시키고 구성하기 위한 가장 기본적인 요소입니다.</li></ul>
            <h1 class="mdt20">Data Transform</h1>
            <ul>
              <li>NetMiner를 이용하여 데이터 분석 과정에 필요한 데이터 전처리 및 변환 작업을 쉽게 할 수 있습니다.</li>
              <li>Basic Package에는 27가지 데이터 변환 방법이 포함되어 있습니다.</li><br/>
            <li class="font14_red mdl350 mdt15">[Transform]</li>
         
          <li >
          <table style="width:800px;" border="0" cellspacing="0" cellpadding="0" class="pacbox_tb">
  <tr>
    <th style="width:100px;">Direction </th>
    <th style="width:100px;">Value </th>
    <th style="width:100px;">NodeSet </th>
    <th style="width:100px;">LinkSet </th>
    <th style="width:100px;">Matrix </th>
    <th style="width:100px;">Layer </th>
    <th style="width:100px;">Mode </th>
    <th style="width:100px;"> Random </th>
  </tr>
  <tr>
    <td>Symmetrize </td>
    <td>Dichotomize </td>
    <td><p>Ego Networks </p></td>
    <td>Incidence </td>
    <td>Vectorize <br/>
      (1-mode) </td>
    <td>Split </td>
    <td>2-mode<br/>
      Network </td>
    <td>Erdos-Renyi </td>
  </tr>
  <tr>
    <td>Transpose </td>
    <td>Reverse </td>
    <td>Reorder </td>
    <td>Line Graph </td>
    <td>Vectorize <br/>
      (2-mode) </td>
    <td>Merge </td>
    <td>1-mode<br/>
      Network </td>
    <td>Scale-Free </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Normalize </td>
    <td>&nbsp;</td>
    <td>Link<br/>Reduction </td>
    <td>&nbsp;</td>
    <td>Multiplex </td>
    <td>Main Node<br/>Attribute </td>
    <td>QAP<br/>Permutation </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Recode </td>
    <td>&nbsp;</td>
    <td><p>Link Reduction</p>Simulation </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Tree<br/>Construction </td>
    <td>MCMC </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Missing </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Diagonal </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

          </li>
      </ul>
    <h1 class="mdt20">Basic Network Measure</h1>
        <ul>
            <li>네트워크 분석 모듈은 개체, 관계, 그룹, 네트워크 수준에서  구조적 특성을 다층적으로 분석할 수 있게 해줍니다.</li>
            <li>Basic Package에서는 34개의 기본적인 네트워크 분석 모듈이 제공되며, Advanced Analysis Package를 추가하면 46개의 고급 분석 모듈을 추가로 사용할 수 있습니다. <a class="font12_red" href="/product/package03.do">See Advanced Analysis</a></li>
           <li class="font14_red mdl350 mdt15">[Analyze]</li>
          <li >
          <table width="800" border="0" cellspacing="0" cellpadding="0" class="pacbox_tb">
  <tr>
    <th style="width:114px;"><strong>Neighbor </strong></th>
    <th style="width:114px;"><strong>Connection </strong></th>
    <th style="width:114px;"><strong>Cohesion </strong></th>
    <th style="width:114px;"><strong>Centrality </strong></th>
    <th style="width:114px;"><strong>Equivalence </strong></th>
    <th style="width:114px;"><strong>Position </strong></th>
    <th style="width:114px;"><strong>Properties </strong></th>
    </tr>
  <tr>
    <td>Degree </td>
    <td>Shortest Path </td>
    <td>Component</td>
    <td>Degree </td>
    <td>Structural </td>
    <td>Blockmodel<br/>(Conventional)</td>
    <td>Network<br/>(Multiple)</td>
    </tr>
  <tr>
    <td>Ego Networks </td>
    <td>Reverse </td>
    <td>Bi-Component </td>
    <td>Coreness </td>
    <td>Regular</td>
    <td>Brokerage</td>
    <td>Group</td>
    </tr>
  <tr>
    <td>Structural Hole</td>
    <td>Connectivity </td>
    <td>Clique </td>
    <td>Betweenness </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Topological Sort</td>
    <td>n-Clique</td>
    <td>Flow<br/>
      Betweenness </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>n-Clan </td>
    <td>Eigenvector </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>k-Plex </td>
    <td>Status </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>k-Core </td>
    <td>Power</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Lambda Set </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

          </li>
    </ul>
        <h1 class="mdt20">Network Visualization -2D</h1>
        <ul>
            <li>NetMiner를 활용하여 네트워크 데이터를 다양한 시각화 방법으로 표현할 수 있습니다.</li>
            <li>Basic Package에서는 23개의 시각화 레이아웃 알고리즘을 사용하여 분석 목적에 맞는 네트워크 맵을 그릴 수 있습니다.</li>
            <li>이와 함께 Advanced Visualization Package를 추가하면 3D 네트워크 맵과 고급 차트 기능을 추가로 사용할 수 있습니다.</li>
            <li><a class="font12_red" href="/product/package06.do">Advanced Visualization package</a> </li><br/>
           <li class="font14_red mdl350 mdt15">[Visualize(2D)]</li>
          <li >
          <table width="800" border="0" cellspacing="0" cellpadding="0" class="pacbox_tb">
  <tr>
    <th style="width:114px;"><strong>Spring </strong></th>
    <th style="width:114px;"><strong>MDS </strong></th>
    <th style="width:114px;"><strong>Clustered </strong></th>
    <th style="width:114px;"><strong>Layered </strong></th>
    <th style="width:114px;"><strong>Circular </strong></th>
    <th style="width:114px;"><strong>Simple </strong></th>
    <th style="width:114px;"><strong>Two Mode </strong></th>
    </tr>
  <tr>
    <td>Kamada<br/>&amp; Kawai </td>
    <td>Classical MDS </td>
    <td>Clustered Eades</td>
    <td>Dig-CoLa </td>
    <td>Circumference</td>
    <td>Fixed</td>
    <td>Kamada<br/>&amp; Kawai </td>
    </tr>
  <tr>
    <td>Stress<br/>Majorization</td>
    <td><p>Non-metric MDS</p> </td>
    <td>Clusterd-Cola</td>
    <td>&nbsp;</td>
    <td>Concentric</td>
    <td>Random</td>
    <td>Stress<br/>Majorization</td>
    </tr>
  <tr>
    <td>Eades</td>
    <td>Kn-MDS<br/></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Concentric </td>
    <td>&nbsp;</td>
    <td>Eades</td>
    </tr>
  <tr>
    <td>Fruchterman<br/>&amp; Reingold</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Fruchterman<br/>&amp; Reingold</td>
    </tr>
  <tr>
    <td>GEM</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>GEM</td>
    </tr>
  <tr>
    <td>HDE </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>HDE</td>
    </tr>
</table>
          </li>
          <li class="mdt10"><table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:266px;" align="center"><img src="/images/sub/spring_2d.png" alt="spring_2d" width="250" /><br />
      &lt;Spring- Kamada &amp; Kawai&gt;</td>
    <td style="width:266px;" align="center"><img src="/images/sub/mds_2d.png" alt="mds" width="250" /><br />
      &lt;MDS- Classical MDS&gt;</td>
    <td style="width:266px;" align="center"><img src="/images/sub/clustered_2d.png" alt="clustered_2d" width="250" /><br />
	&lt;Clustered- Clustered Eades&gt;</td>
  </tr>
  <tr>
    <td align="center"><img src="/images/sub/layered_2d.png" alt="layerd-dig-cola" width="250" height="250"/><br />
      &lt;Layered - Dig-Cola&gt;</td>
    <td align="center"><img src="/images/sub/circular_2d.png" alt="&lt;Circular- Circumference" width="250" /><br />
      &lt;Circular- Circumference</td>
    <td align="center"><img src="/images/sub/2mode_2d.png" alt="&lt;Two Mode - Spring&gt; " width="250" /><br />
      &lt;Two Mode - Spring&gt; </td>
  </tr>
  
</table>
</li>

      </ul>
  </div>
    
   
     
     
     
     
     
    </div>
    
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
