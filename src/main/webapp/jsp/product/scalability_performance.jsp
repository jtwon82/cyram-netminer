<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    <div class="submain" > <img src="/images/sub/contitle23.gif" alt="scalability_performance"/>
      <div class="buybox" >
       
        <ul>
          <li> NetMiner supports ‘Large Network Data’, let us explain more on this with four frequently-asked questions and 
   our answers below:
</li>
          <li class="mdl200"></li>
        </ul>
      </div>
      <div class="buybox" >
        <h2  class="mdl10">Do all licenses of NetMiner support ‘large-scale Network Data’? </h2>
        <ul class="mdl32">
          <li> No. There are five different levels of license (Tiny, Small, Medium, Large, and Huge) with respect to the data size for NetMiner to handle. In order to handle ‘Large Network Data’, of maximum of 100,000 nodes or ‘ Huge Network Data’, of maximum of 1,000,000 nodes, the appropriate level of NetMiner license should be purchased.

</li>        </ul>    
  <h2  class="mdl10">If I purchased the appropriate level of NetMiner license in order to meet data size of my dataset to be handled, NetMiner work on the large-scale dataset no matter what? </h2>
        <ul class="mdl32">
          <li> No. The level of license with restriction on data size just checks the maximum nodes to be imported into NetMiner. However, the overall size of network data is defined not only by the number of nodes but also by the number of links. In order to set the upper limit of link size, NetMiner defines an operational definition of ‘Sparse Network’ as the network of ‘m ≤ 10 * n’, where ‘n’ is the number of nodes and ‘m’ is the number of links. In other words, the number of links should be smaller than ten times the node size and the maximum size of links is 1,000,000 for 'Large' size and 10,000,000 for 'Huge' size.

</li>        </ul>    
  <h2  class="mdl10">If I purchased the appropriate level of NetMiner license in order to meet data size of dataset to be handled and the dataset satisfies our operational ‘Large Sparse Network’ definition, will all NetMiner algorithms operate efficiently regardless of its time complexity? </h2>
        <ul class="mdl32">
          <li> No. NetMiner guarantees for the performance of algorithms with subquadratic time complexity where running time f(n) is under o(n^2). Test results of subquadratic algorithms of NetMiner are listed below. Although over-quadratic algorithms can run in NetMiner, it is not as fast and smooth processing of ‘Large and Huge Network Data’ as compared to subquadratic algorithms. 

</li>        </ul>    
  <h2  class="mdl10">If I purchased the appropriate level of NetMiner license in order to meet data size of dataset to be handled and the dataset satisfies our operational ‘Large Sparse Network’ definition, and if I run subquadratic algorithms of NetMiner, will it be guaranteed that those run with high performance? </h2>
        <ul class="mdl32">
          <li> No. Although your system satisfies the minimum requirements to install NetMiner, the system performance such as RAM size and CPU speed inevitably affects the NetMiner performance. Therefore, although NetMiner can run with lower-level system specifications, it is recommended to have a large size of RAM and high speed of CPU for better performance.

</li>        </ul>    

        <ul class="mdl32 mdt20">
          <li> To sum it up, in order to get the benefit of NetMiner's handling ‘Large-scale Network Data‘, <br/>

   i) users need to have appropriate level of license and, ii) the network data is sparse (m ≤ 10 * n) and, <br/>
   iii) users are running subquadratic algorithms and, <br/>
   iv) NetMiner is installed in a computer with a large size of RAM and high speed of CPU.<br/><br/>

    Two large-scale sample data were used for performance test. In case of 'Large' size of network data with 100,000 nodes and 
   1,000,000 links, elapsed time and occupied memory for overall subquadratic algorithms in NetMiner were Max. 15seconds and 
   1.5GB. For 'Huge' size of network data with 1,000,000 nodes and 10,000,000 links, elapsed time and occupied memory were 
   1~4 minutes and 6~10 GB according to the time complexity of each algorithm.<br/><br/>

    This test was performed in the computing environment as follows: <br/>
    - CPU:QuadCore Intel Xeon E5405, 2.00GHz(6*33)<br/>
    - RAM:16GB (= 4GB DDR2 SDRAM 667MHz * 4)"<br/>
    - OS: Microsoft Windows Server 2003 Enterprise x64 Edition SP2<br/>
 




</li>        </ul>    
      </div>
      
      
    </div>
  </div>
  <!--//하단컨텐츠-->


</body>
</html>
