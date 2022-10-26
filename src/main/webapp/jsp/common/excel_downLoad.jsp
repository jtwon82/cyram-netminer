<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
</head>
<script type="text/javascript">
$(function (){

const excelDownload = document.querySelector('#excelDownload');

$(function exportExcel(){ 
  // step 1. workbook 생성
  var wb = XLSX.utils.book_new();

  // step 2. 시트 만들기 
  var newWorksheet = excelHandler.getWorksheet();

  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  // step 4. 엑셀 파일 만들기 
  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

  // step 5. 엑셀 파일 내보내기 
  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
	window.history.back();
})

var excelHandler = {
    getExcelFileName : function(){
        return 'USER_INFO_'+'${fileName}'+'.xlsx';	//파일명
    },
    getSheetName : function(){
        return '${sheetName}';	//시트명
    },
    getExcelData : function(){
        return document.getElementById('result'); 	//TABLE id
    },
    getWorksheet : function(){
        return XLSX.utils.table_to_sheet(this.getExcelData());
    }
}

function s2ab(s) { 
  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  var view = new Uint8Array(buf);  //create uint8array as viewer
  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
  return buf;    
}
})
</script>
<body>
	<table class='main' id ="result" style="display: none;">
		<thead>
			<tr>
						<th style="width: 50px">ID</th>
						<th style="width: 80px">신청일</th>
						<th style="width: 50px">성함</th>
						<th style="width: 80px">국가</th>
						<th style="width: 80px">소속 기관</th>
						<th style="width: 80px">소속 학과</th>
						<th style="width: 80px">Email</th>
						<th style="width: 80px">강의명</th>
						<th style="width: 80px">수강인원</th>
						<th style="width: 80px">강의소개</th>
						<th style="width: 80px">첨부자료</th>
						<th style="width: 80px">마케팅동의</th>
						<th style="width: 80px">결과</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="item" varStatus="status">
					<tr>
							<td>${item.saledate}</td>
							<td>${item.APPLCNT_NM}</td>
							<td>${item.NATION_NAME_KR}</td>
							<td>${item.PSITN_INSTT}</td>
							<td>${item.PSITN_SUBJCT}</td>
							<td>${item.CHARGER_EMAIL}</td>
							<td>${item.LCTRE_NM}</td>
							<td>${item.ATNLC_NMPR}</td>
							<td>[상세보기]</td>
							<td>${item.orgname}</td>
							<td>${item.agree3}</td>
							<td>${item.RESULT}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>