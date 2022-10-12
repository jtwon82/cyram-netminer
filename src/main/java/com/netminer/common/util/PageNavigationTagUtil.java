package com.netminer.common.util;


public class PageNavigationTagUtil {
	
	/**
	 * total 문자열 생성
	 * 사용하는데 없음
	 * @param total
	 * @param list_count
	 * @param pagenumber
	 * @return
	 */
	public static String getTotalPrint(int total, int list_count, int pagenumber) {
		String totalPageView = "";
		int pageView = 0;

		int total_page = (total / list_count);
		int total_pageAdd = (total % list_count);
		
		if(total_pageAdd > 0) { total_page = total_page + 1; }

		pageView = (pagenumber / list_count) + 1;
		if(total_page <= 0) {
			total_page = 1;
		}
		totalPageView = pageView + " / " + total_page;
		return totalPageView;
	}
 	
	/**
	 * 페이징 스크립트 문자열 생성
	 * @param formName
	 * @return
	 */
	public static String getMoveLinkPageScript(String formName) {
		String retVal = "<script>\n"
				+"	function moveLinkPage(pageNo) {\n"
				+"		document.getElementById('pageNo').value = pageNo;\n"
				+"		document.getElementById('" + formName + "').submit();\n"
				+"	}\n"
				+"</script>\n";
		return retVal;
	}

	/**
	 * 페이징 문자열 생성
	 * @param listCount
	 * @param pageCount
	 * @param totalCount
	 * @param pageNo
	 * @return
	 */
	public static StringBuffer getMoveLinkPagePrint(int listCount, int pageCount, int totalCount, int pageNo) {
		
		StringBuffer returnStr = new StringBuffer();
		float pagesF = 0;
		int pages = 0;
		int l_no = 0;
		int p_no = 0;
		int pre = 0;
		int net = 0;
		
		pagesF = pageNo / (listCount * pageCount);
		pages = (int) pagesF;
		
		returnStr.append("<table width='300' border='0' align='center' cellpadding='0' cellspacing='0'>");
		returnStr.append("<tr>");
		
		if((pageNo + 1) > (listCount * pageCount)) {
			pre = (pages * listCount * pageCount ) - listCount ;
			
			returnStr.append("<td width='37' align='right'>");
			returnStr.append("<a href=\"javascript:moveLinkPage('" + pre + "');\"> <div class='btn_arrow'>&lt;</div> </a>");
			returnStr.append("</td>");
		} else {
			returnStr.append("");
		}
		returnStr.append("<td><div align='center'>");
		
		for(int p=0; p < pageCount; p++) {
			l_no = (pages * pageCount + p) * listCount ;
			p_no = (pages * pageCount) + p + 1 ;
			
			if(l_no < totalCount) {
				if(l_no != pageNo) {
					returnStr.append("<a href=\"javascript:moveLinkPage('" + l_no + "');\"> " + p_no + " </a>");
				} else { 
					returnStr.append(" " + p_no + " ");
				}
			}
		}
		
		returnStr.append("</div></td>");
		
		if(totalCount > ((pages + 1) * listCount * pageCount)) {
			net = (pages + 1) * listCount * pageCount;
			
			returnStr.append("<td width='37' align='left'>");
			returnStr.append("<a href=\"javascript:moveLinkPage('" + net + "');\"> <div class='btn_arrow'>&gt;</div> </a>");
			returnStr.append("</td>");
		} else {
			returnStr.append("");
		}
		
		returnStr.append("</tr>");
		returnStr.append("</table>");

		return returnStr;
	}
	
}
