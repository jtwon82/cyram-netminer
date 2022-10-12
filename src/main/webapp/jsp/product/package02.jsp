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
          <li> NetMiner Basic Package consists of NetMiner Framework, Data Management, Data Tranformation, Basic Network Measures and 
   Network Visualization(2D). You can perform fundamental analyses included in Basic Package.</li>
          <li ><img src="/images/sub//package02.jpg" alt="NetMiner Basic Package"/></li>
      </ul>
       <h1 class="mdt20">Framework &amp; Data Management</h1>
        <ul>
          <li> "Framework" and "Data Management" are building blocks of NetMiner. Without these, NetMiner can not be executed. </li>
          <li class="font14_red mdl350 mdt15">[Transform]</li>
          <li >
          <table width="800" border="0" cellspacing="0" cellpadding="0" class="pacbox_tb">
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
    <td>Incidence </td>
    <td>Vectorize <br/>
      (1-mode) </td>
    <td>Split </td>
    <td>2-mode<br/>
      Network </td>
    <td>Erdos-Renyi </td>
    <td></td>
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
    <td>Link<br/>
    Reduction </td>
    <td>&nbsp;</td>
    <td>Multiplex </td>
    <td>Main Node<br/>
    Attribute </td>
    <td>QAP<br/>
    Permutation </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Recode </td>
    <td>&nbsp;</td>
    <td><p>Link Reduction</p>Simulation </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>Tree<br/>
    Construction </td>
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
          <li> NetMiner provides various analysis module.
    You can perform fundamental 34 kinds of analyses included in Basic Package and additional 46 kinds of analyses by using    "Advanced Analysis Package" for more powerful analysis. <a class="font12_red" href="/product/package03.do">See Advanced Analysis</a> </li>
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
          <li> NetMiner's visualization modules help you to express analysis results in a variety of ways.
    You can use 23 kinds of visualization algorithm to draw network map fit for your purpose.
    If you want to express more information through more various network maps,use <a class="font12_red" href="/product/package06.do">Advanced Visualization package</a></li>
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
    <td>Stress
    <br/>Majorization</td>
    <td><p>Non-metric MDS</p></td>
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
