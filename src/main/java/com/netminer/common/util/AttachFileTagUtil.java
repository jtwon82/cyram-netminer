package com.netminer.common.util;

import java.text.DecimalFormat;

import org.springframework.ui.Model;

import com.cyframe.model.ConstantModel;
import com.cyframe.model.MultipartModel;
import com.netminer.common.board.model.BoardModel;
import com.netminer.manager.admin.model.AdminModel;


public class AttachFileTagUtil {
	
	/**
	 * add, delete 버튼 생성
	 * @return
	 */
	public static String getAttachFileButton() {
		String retVal =
				"<span class='mdl10 '><a href=\"javascript:add_file();\"><img src=\"/images/sub/btn_fileplus.gif\" alt=\"fileplus\" width=\"13\" height=\"13\"  class=\"mdt2\" /></a>\n"
				+ "<a href=\"javascript:del_file();\"><img src='/images/sub/btn_filemu.gif' alt='minus' width='13' height='13' class='mdt2' /></a></span>\n";
		return retVal;
	}
	
	/**
	 * add, delete 스크립트 생성
	 * @return
	 */
	public static String getAttachFileScript() {
		String retVal =
				"<table id=\"fileList\" cellpadding=0 cellspacing=0></table>\n"
						+ "<script>\n"
						+ "		var flen = 0; \n"
						+ " \n"
						+ "		function add_file(delete_code) { \n"
						+ "		    var upload_count = 0; \n"
						+ "		    if (upload_count && flen >= upload_count) { \n"
						+ "		        alert(\"Maximum Attachments is \"); \n"
						+ "		        return; \n"
						+ "		    } \n"
						+ " \n"
						+ "			var objTbl; \n"
						+ "			var objRow; \n"
						+ "			var objCell; \n"
						+ "			    objTbl = document.getElementById(\"fileList\"); \n"
						+ " \n"
						+ "			objRow = objTbl.insertRow(objTbl.rows.length); \n"
						+ "			objCell = objRow.insertCell(0); \n"
						+ " \n"
						+ "			objCell.innerHTML = \"<input type='file' name='" + ConstantModel.MULTIPART_FIELD_NAME + "' />\"; \n"
						+ " \n"
						+ "			if (delete_code) { \n"
						+ "		        objCell.innerHTML += delete_code; \n"
						+ "		    } else { \n"
						+ "		        ; \n"
						+ "		    } \n"
						+ " \n"
						+ "		    flen++; \n"
						+ "		} \n"
						+ " \n"
						+ "		function del_file() { \n"
						+ "		var file_length = 0; \n"
						+ "		var objTbl = document.getElementById(\"fileList\"); \n"
						+ "		    if (objTbl.rows.length - 1 > file_length) { \n"
						+ "		        objTbl.deleteRow(objTbl.rows.length - 1); \n"
						+ "		        flen--; \n"
						+ "		    } \n"
						+ "		} \n"
						+ " \n"
						+ "		add_file(''); //최초 하나 생성\n"
						+ " \n"
						+ "</script>\n";
		return retVal;
	}

	/**
	 * 첨부파일 스크립트 및 태그
	 * @param boardModel
	 * @param withDelete
	 * @param isFront
	 * @return
	 */
	public static String getAttachFilePrint(BoardModel boardModel, boolean withDelete, boolean isFront) {
		
		
		StringBuffer sb = new StringBuffer();
		
		MultipartModel[] multipartModels = boardModel.getAttach_files();
		
		if(multipartModels != null && multipartModels.length > 0) {
			sb.append("<script>\n");
			
			if((boardModel.getSessionId() != null && boardModel.getSessionId().equals(boardModel.getMb_id()))|| (boardModel.getSessionAdminId() != null && boardModel.getSessionAdminId().equals("admin") )) {
				sb.append("function deleteFile(wr_id, bf_no, bf_file) {\n");
				sb.append("	if (confirm(\"Are you sure you want to delete?\")){\n");
				sb.append("		$(\"#file_\" + bf_no).hide(0);\n");
				sb.append("		$(\"#div_delete_files\").append(\"<input type='hidden' name='" + ConstantModel.MULTIPART_DELETE_FIELD_NAME + "' value='\" + wr_id + \"[cyram_d_f]\" + bf_no + \"[cyram_d_f]\" + bf_file + \"'/>\");\n");
				sb.append("	}\n");
				sb.append("}\n");
				sb.append("\n");
			}
			
			sb.append("function downloadFile(bf_file, bf_source){\n");
			sb.append("	$(\"#downloadFileHTML\").html(\"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>\");\n");
			sb.append("	var formData = \"<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile-read.do?bf_file=\" + bf_file + \"&bf_source=\" + bf_source + \"'></form>\";\n");
			sb.append("	$(formData).appendTo('body').submit().remove();\n");
			sb.append("}\n");
			
			sb.append("</script>\n");
			
			if((boardModel.getSessionId() != null && boardModel.getSessionId().equals(boardModel.getMb_id()))|| (boardModel.getSessionAdminId() != null && boardModel.getSessionAdminId().equals("admin") )) {
				sb.append("<div id=\"div_delete_files\"></div>\n");
			}

			double d = 0;
			double s = 0;
			String size = "";
			DecimalFormat formater = new DecimalFormat(".#");

			for(MultipartModel multipartModel : multipartModels) {
				s = Double.parseDouble(String.valueOf(multipartModel.getFile_size()));
				d = s / 1000000;
				
				if(d > 1) {
					size = formater.format(d) + " MB";
				} else {
					d = s / 1000;
					size = formater.format(d) + " KB";
				}
				
				if(isFront) {
					sb.append("<div id=\"file_" + multipartModel.getAttach_file_id() + "\" class=\"btn_mnoti03\">\n");
				} else {
					sb.append("<div id=\"file_" + multipartModel.getAttach_file_id() + "\" class=\"btn_mnoti\">\n");
				}
				
				sb.append("	<a href=\"javascript:downloadFile('" + multipartModel.getFile_name() + "', '" + multipartModel.getFile_org_name() + "');\">" + multipartModel.getFile_org_name() + " (" + size + ") </a>\n");
				
				if(withDelete) {
					if((boardModel.getSessionId() != null && boardModel.getSessionId().equals(boardModel.getMb_id()))|| (boardModel.getSessionAdminId() != null && boardModel.getSessionAdminId().equals("admin") )) {
						sb.append("	<a href=\"javascript:deleteFile('" + multipartModel.getMaster_file_id() + "', '" + multipartModel.getAttach_file_id() + "', '" + multipartModel.getFile_name() + "');\"> <img src='/images/sub/btn_del.gif' alt='delete'> </a>");
					}
				}
				
				sb.append("</div>\n");
			}
		}
		
		return sb.toString();
	}
	
}
