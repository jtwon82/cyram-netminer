<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>

	<script type="text/javaScript">
		
		function search() {
			document.getElementById('pageNo').value = 0;
			document.getElementById('boardModel').submit();
		}
		
		function view(wr_id) {
			document.getElementById('wr_id').value = wr_id;
			
			var frm = document.getElementById('boardModel');
			frm.action = "/download_buy/appstore/appstore-view.do";
			frm.submit();
		}
		
		function read() {
			document.getElementById('wr_id').value = '0';
			
			var frm = document.getElementById('boardModel');
			frm.action = "/download_buy/appstore/appstore-read.do";
			frm.submit();
		}
		
	function search2(ca_name) {
			
			$("#searchWord").val("");
			$("#searchCa_name").val("ALL");
			
			
			document.getElementById('pageNo').value = '0';
			document.getElementById('boardModel').submit();
		}
		
	</script>

</head>
	
<body>
	
  <!--하단컨텐츠-->
  <div id="container02" >
		<div class="submain">
						<img src="/images/sub/contitle04.gif" alt="appstore" />
    <c:choose>
      <c:when test="${boardModel.kor eq 'true'}">
        <div>
          <ul>
            <li class="mdt10">NetMiner를 사용자의 필요에 맞게 활용할 수 있는 스크립트 및 플러그인을
              다운로드 할 수 있습니다.</li>
          </ul>
        </div>
      </c:when>
    </c:choose>
						<div class="viewsearch">
							<ul>
								<li><form:form commandName="boardModel"
										action="/download_buy/appstore/appstore-readList.do">
										<form:hidden path="pageNo" />
										<form:hidden path="wr_id" />
										<form:select path="searchCa_name"
											items="${boardModel.ca_nameSearchList}" itemLabel="text"
											itemValue="value" class="select_w200" />
										<form:select path="searchKind"
											items="${boardModel.selectBoxModelList}" itemLabel="text"
											itemValue="value" class="select_w200" />
										<form:input path="searchWord" class="input_w300" />
										<div class="btn_search">
											<a href="javascript:search();">SEARCH</a>
										</div>
									</form:form></li>

							</ul>
						</div>
						<!--앱게시판 부분-->
						<div class="viewth">
							<ul>

								<c:forEach var="boardModel" items="${list}">

									<!--반복-->
									<li><span> <c:choose>
												<c:when test="${boardModel.ca_name eq 'Script'}">
													<img src="/images/sub/appexe01.png" alt="appimg" />
												</c:when>
												<c:when test="${boardModel.ca_name eq 'Plug-in'}">
													<img src="/images/sub/appexe02.png" alt="appimg" />
												</c:when>
												<c:otherwise>
													<img src="/images/sub/appexe03.png" alt="appimg" />
												</c:otherwise>
											</c:choose>

									</span> <!--       Appstore 본문 --> <!-- 제목 -->
										<h1>
											<a href="javascript:view('${boardModel.wr_id}');">
												${boardModel.wr_subject} <c:if
													test="${boardModel.wr_comment != 0}">
			(${boardModel.wr_comment})
			</c:if>
											</a>
										</h1> <!-- 날짜| 작성자 -->
										<h3>${boardModel.wr_last}
											| <strong>${boardModel.mb_id}</strong>
										</h3> <c:out value="${boardModel.wr_content_view}"
											escapeXml="false" /> <!-- 
      	<br />
        <br />
		<div class="btn_mnoti"><a href="update">egoFollowRelation.zip (2.8M)</a></div>
      	 --></li>
									<!--//반복-->

								</c:forEach>

							</ul>
						</div>
						<!--//앱게시판 부분-->
						<div class="viewsearch02">
							<c:out value="${moveLinkPageScript}" escapeXml="false" />
							<c:out value="${moveLinkPagePrint}" escapeXml="false" />
						</div>


						
						<!--게시판버튼-->
    <div class="viewsearch03" > 
     <ul>
      <li>
<%-- 	<c:if test="${boardModel.login eq true}"> --%>
<!-- 		<a href="javascript:read();"><img src="/images/sub/btn_board02.gif" alt="write" /></a> -->
<%-- 	</c:if> --%>

			<c:choose>
				<c:when test="${boardModel.login eq 'true'}">
				 	<a href="javascript:read();"><img src="/images/sub/btn_board02.gif" alt="write" /></a>
				</c:when>
				<c:otherwise>
			      	
			      	<a href="javascript:d_login_move();"><img src="/images/sub/btn_board02.gif" alt="write" /></a>
				</c:otherwise>
			</c:choose>

	<a href="javascript:search2();"><img src="/images/sub/btn_board01.gif" alt="list" /></a> 


	  </li>
     </ul>
    </div>
    <!--//게시판버튼-->
						

					</div>
	</div>
  <!--//하단컨텐츠-->

</body>
</html>
