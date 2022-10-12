<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
	
<body>

  <!--하단컨텐츠-->
  <div id="container02" >
    
  
    <div class="submain" >
             <img src="/images/sub/contitle_edition.png" alt="packages"/>
     
  
  <div class="viewtab02 mdt20">
       <ul>
        <li id="mouseout02" class="mdl1"><a href="/product/package01.do">Overview</a></li>   
        <li id="mouseout02" class="mdl1"><a href="/product/package02.do">Basic</a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package03.do">Advanced Analysis</a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package04.do">Exploration</a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package05.do">Tools </a></li> 
        <li id="mouseout02" class="mdl1"><a href="/product/package06.do">Advanced Visualization</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package07.do">Statistics</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package10.do">Mining</a></li>
        <li id="mouseout02" class="mdl1"><a href="/product/package09.do">Script</a></li>
        <li class="mdl1"><a href="/product/package11.do">Semantic Network</a></li>		
       </ul>
  </div>
<div class="pacbox" >
<h1 >Semantic Network Package</h1>
<ul>
  <li>
  Semantic Network Package(시맨틱 네트워크 패키지)는 신문기사, 소셜미디어 상의 사용자 글, 인터뷰 및 연설문 등의 비정형 텍스트 데이터에서 단어를 추출하고 이를 단어 간 네트워크 데이터로 변환하여 네트워크 분석을 가능하게 합니다. <br/><br/>
  Semantic Network Package 를 추가하면, 형태소 분석(Morphological analysis)을 통해 텍스트 데이터에서 단어들을 추출하고, 
  추출된 단어의 품사와 TF-IDF(Term Frequency - Inverse Document Frequency, 문서 내 단어 중요도 평가 지수)를 확인할 수 있습니다. 
  또한 사용자 정의 사전을 이용하여 사용자가 직접 유사어와 복합명사 및 고유명사를 정의할 수 있고, 특정 단어를 포함하는 스팸 문서를 제외할 수도 있습니다. 
  <br/>그리고 단어 간 네트워크에 네트워크 분석 기법을 적용하여 네트워크 상에서의 주요 키워드를 발견할 수 있고, 주요 키워드들은 워드클라우드(Word Cloud)로 강조하여 표현할 수 있으며, NetMiner의 토픽 모델링을 통해 하위 토픽을 파악할 수 있습니다.<br/>
 </li>
 </ul>
 <img src="/images/sub/package_semantic.png"  width="550px" style="margin-left:100px;"/>

<ul><li>
  • <strong>문서 내 텍스트에서 단어 네트워크 추출</strong> 
  <br/><br/>
  뉴스, 게시글, 상품평, 트위터 및 페이스북과 같은 소셜미디어(SNS)와 같이 다양한 분야에서 쉽게 수집할 수 있는 텍스트 데이터에서 단어를 추출하고 각 단어의 품사를 분석하며, TF-IDF를 계산합니다. 
  또한 전체 텍스트를 문장, 문단, 문서 단위로 구분한 후 단어가 어떤 문장, 어떤 문서와 관계가 있는지 네트워크 데이터로 표현하며, 단어끼리 네트워크를 생성하여 기존의 네트워크 분석 방법을 적용할 수 있습니다. 
  <br/><br/>
  • <strong>사용자 정의 사전</strong>
  <br/><br/>
  특정 분야에서 자주 사용되는 고유어 및 복합 명사, 신조어 등을 등록하여 1개의 새로운 단어로서 분석할 수 있습니다.
   또한 동일한 의미를 지닌 단어들을 유사어 사전(Thesaurus)에 등록하면 등록된 단어들을 1개의 단어로 설정하여 해당 단어의 빈도 및 중요도가 낮아지는 것을 방지할 수 있습니다. <br/>
  반면, 제외하고 싶은 단어를 등록할 수 있으며, 특정 단어가 포함되어 있는 문서를 분석에서 제외할 수도 있습니다.
  <br/><br/>
  • <strong>토픽 모델링</strong>
  <br/><br/>
  토픽 모델링 알고리즘 중 대표적인 LDA 알고리즘을 이용하여 전체 텍스트 데이터를 구성하고 있는 여러 개의 하위 토픽을 확인할 수 있습니다.
  <br/><br/>
  • <strong>워드클라우드</strong>
  <br/><br/>
  단어의 중요도나 빈도 등에 따라 단어의 크기를 달리하여 시각화 하는 방법으로, 다른 말로는 태그 클라우드(Tag Cloud)라고 합니다. 
단어 추출 시 기본적으로 계산되는 등장 빈도 뿐만 아니라 네트워크 분석을 통해 얻어진 결과를 반영하여 워드클라우드를 만들 수 있습니다.
  <br/><br/>
</li>
</ul>
 </div>
    
   
     
     
     
     
     
    </div>
    
  </div>
  <!--//하단컨텐츠-->

</body>
</html>
