package com.netminer.common.board.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.MultipartModel;
import com.cyframe.model.SelectBoxModel;



public class BoardModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private int wr_id = 0;
    private int wr_num = 0;
    private String wr_reply = "";
    private int wr_parent = 0;
    private int wr_is_comment = 0;
    private int wr_comment = 0;
    private String wr_comment_reply = "";
    private String ca_name = "";
    private String searchCa_name = "";
    private String wr_option = "";
    private String wr_subject = "";
    private String wr_content = "";
    private String wr_content_view = "";
    private String wr_link1 = "";
    private String wr_link2 = "";
    private String wr_link1_hit = "0";
    private String wr_link2_hit = "0";
    private String wr_trackback = "";
    private String wr_hit = "0";
    private String wr_good = "0";
    private String wr_nogood = "0";
    private String mb_id = "";
    private String wr_password = "";
    private String wr_name = "";
    private String wr_email = "";
    private String wr_homepage = "";
    private String wr_datetime = "";
    private String wr_last = "";
    private String wr_ip = "";
    private String wr_1 = "";
    private String wr_2 = "";
    private String wr_3 = "";
    private String wr_4 = "";
    private String wr_5 = "";
    private String wr_6 = "";
    private String wr_7 = "";
    private String wr_8 = "";
    private String wr_9 = "";
    private String wr_10 = "";
    private String bn_id = "";

    //comment 관련
    private String comment_wr_content = "";
    private String comment_mb_id = "";
    private String comment_wr_password = "";
    private String comment_delete_password = "";

	private MultipartModel[] attach_files;
	private String[] delete_files;
	private List<String> base64FileList;

	private List<SelectBoxModel> selectBoxModelList;

	private List<SelectBoxModel> ca_nameList;
	private List<SelectBoxModel> ca_nameSearchList;
	
	private List<BoardModel> commentList;

    private String attachFilePrint;

	public String getSearchCa_name() {
		return searchCa_name;
	}

	public void setSearchCa_name(String searchCa_name) {
		this.searchCa_name = searchCa_name;
	}

	public String getWr_content_view() {
		return wr_content_view;
	}

	public void setWr_content_view(String wr_content_view) {
		this.wr_content_view = wr_content_view;
	}

	public String getBn_id() {
		return bn_id;
	}

	public void setBn_id(String bn_id) {
		this.bn_id = bn_id;
	}

	public String getAttachFilePrint() {
		return attachFilePrint;
	}

	public void setAttachFilePrint(String attachFilePrint) {
		this.attachFilePrint = attachFilePrint;
	}

	public List<String> getBase64FileList() {
		return base64FileList;
	}

	public void setBase64FileList(List<String> base64FileList) {
		this.base64FileList = base64FileList;
	}

	public String getComment_delete_password() {
		return comment_delete_password;
	}

	public void setComment_delete_password(String comment_delete_password) {
		this.comment_delete_password = comment_delete_password;
	}

	public String getComment_wr_content() {
		return comment_wr_content;
	}

	public void setComment_wr_content(String comment_wr_content) {
		this.comment_wr_content = comment_wr_content;
	}

	public String getComment_mb_id() {
		return comment_mb_id;
	}

	public void setComment_mb_id(String comment_mb_id) {
		this.comment_mb_id = comment_mb_id;
	}

	public String getComment_wr_password() {
		return comment_wr_password;
	}

	public void setComment_wr_password(String comment_wr_password) {
		this.comment_wr_password = comment_wr_password;
	}

	public List<BoardModel> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<BoardModel> commentList) {
		this.commentList = commentList;
	}

	public String[] getDelete_files() {
		return delete_files;
	}

	public void setDelete_files(String[] delete_files) {
		this.delete_files = delete_files;
	}

	public int getWr_id() {
		return wr_id;
	}

	public void setWr_id(int wr_id) {
		this.wr_id = wr_id;
	}

	public int getWr_num() {
		return wr_num;
	}

	public void setWr_num(int wr_num) {
		this.wr_num = wr_num;
	}

	public String getWr_reply() {
		return wr_reply;
	}

	public void setWr_reply(String wr_reply) {
		this.wr_reply = wr_reply;
	}

	public int getWr_parent() {
		return wr_parent;
	}

	public void setWr_parent(int wr_parent) {
		this.wr_parent = wr_parent;
	}

	public int getWr_is_comment() {
		return wr_is_comment;
	}

	public void setWr_is_comment(int wr_is_comment) {
		this.wr_is_comment = wr_is_comment;
	}

	public int getWr_comment() {
		return wr_comment;
	}

	public void setWr_comment(int wr_comment) {
		this.wr_comment = wr_comment;
	}

	public String getWr_comment_reply() {
		return wr_comment_reply;
	}

	public void setWr_comment_reply(String wr_comment_reply) {
		this.wr_comment_reply = wr_comment_reply;
	}

	public String getCa_name() {
		return ca_name;
	}

	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}

	public String getWr_option() {
		return wr_option;
	}

	public void setWr_option(String wr_option) {
		this.wr_option = wr_option;
	}

	public String getWr_subject() {
		return wr_subject;
	}

	public void setWr_subject(String wr_subject) {
		this.wr_subject = wr_subject;
	}

	public String getWr_content() {
		return wr_content;
	}

	public void setWr_content(String wr_content) {
		this.wr_content = wr_content;
	}

	public String getWr_link1() {
		return wr_link1;
	}

	public void setWr_link1(String wr_link1) {
		this.wr_link1 = wr_link1;
	}

	public String getWr_link2() {
		return wr_link2;
	}

	public void setWr_link2(String wr_link2) {
		this.wr_link2 = wr_link2;
	}

	public String getWr_link1_hit() {
		return wr_link1_hit;
	}

	public void setWr_link1_hit(String wr_link1_hit) {
		this.wr_link1_hit = wr_link1_hit;
	}

	public String getWr_link2_hit() {
		return wr_link2_hit;
	}

	public void setWr_link2_hit(String wr_link2_hit) {
		this.wr_link2_hit = wr_link2_hit;
	}

	public String getWr_trackback() {
		return wr_trackback;
	}

	public void setWr_trackback(String wr_trackback) {
		this.wr_trackback = wr_trackback;
	}

	public String getWr_hit() {
		return wr_hit;
	}

	public void setWr_hit(String wr_hit) {
		this.wr_hit = wr_hit;
	}

	public String getWr_good() {
		return wr_good;
	}

	public void setWr_good(String wr_good) {
		this.wr_good = wr_good;
	}

	public String getWr_nogood() {
		return wr_nogood;
	}

	public void setWr_nogood(String wr_nogood) {
		this.wr_nogood = wr_nogood;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getWr_password() {
		return wr_password;
	}

	public void setWr_password(String wr_password) {
		this.wr_password = wr_password;
	}

	public String getWr_name() {
		return wr_name;
	}

	public void setWr_name(String wr_name) {
		this.wr_name = wr_name;
	}

	public String getWr_email() {
		return wr_email;
	}

	public void setWr_email(String wr_email) {
		this.wr_email = wr_email;
	}

	public String getWr_homepage() {
		return wr_homepage;
	}

	public void setWr_homepage(String wr_homepage) {
		this.wr_homepage = wr_homepage;
	}

	public String getWr_datetime() {
		return wr_datetime;
	}

	public void setWr_datetime(String wr_datetime) {
		this.wr_datetime = wr_datetime;
	}

	public String getWr_last() {
		return wr_last;
	}

	public void setWr_last(String wr_last) {
		this.wr_last = wr_last;
	}

	public String getWr_ip() {
		return wr_ip;
	}

	public void setWr_ip(String wr_ip) {
		this.wr_ip = wr_ip;
	}

	public String getWr_1() {
		return wr_1;
	}

	public void setWr_1(String wr_1) {
		this.wr_1 = wr_1;
	}

	public String getWr_2() {
		return wr_2;
	}

	public void setWr_2(String wr_2) {
		this.wr_2 = wr_2;
	}

	public String getWr_3() {
		return wr_3;
	}

	public void setWr_3(String wr_3) {
		this.wr_3 = wr_3;
	}

	public String getWr_4() {
		return wr_4;
	}

	public void setWr_4(String wr_4) {
		this.wr_4 = wr_4;
	}

	public String getWr_5() {
		return wr_5;
	}

	public void setWr_5(String wr_5) {
		this.wr_5 = wr_5;
	}

	public String getWr_6() {
		return wr_6;
	}

	public void setWr_6(String wr_6) {
		this.wr_6 = wr_6;
	}

	public String getWr_7() {
		return wr_7;
	}

	public void setWr_7(String wr_7) {
		this.wr_7 = wr_7;
	}

	public String getWr_8() {
		return wr_8;
	}

	public void setWr_8(String wr_8) {
		this.wr_8 = wr_8;
	}

	public String getWr_9() {
		return wr_9;
	}

	public void setWr_9(String wr_9) {
		this.wr_9 = wr_9;
	}

	public String getWr_10() {
		return wr_10;
	}

	public void setWr_10(String wr_10) {
		this.wr_10 = wr_10;
	}

	public MultipartModel[] getAttach_files() {
		return attach_files;
	}

	public void setAttach_files(MultipartModel[] attach_files) {
		this.attach_files = attach_files;
	}

	public void setSelectBoxModelList(List<SelectBoxModel> selectBoxModelList) {
		this.selectBoxModelList = selectBoxModelList;
	}

	public List<SelectBoxModel> getSelectBoxModelList() {
		if("notice".equalsIgnoreCase(super.getController())) {
			selectBoxModelList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject");
			selectBoxModel.setText("Subject");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_content");
			selectBoxModel.setText("Content");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject+wr_content");
			selectBoxModel.setText("Subject + Content");
			selectBoxModelList.add(selectBoxModel);
			
		} else if("appstore".equalsIgnoreCase(super.getController())) {
			selectBoxModelList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject");
			selectBoxModel.setText("Subject");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_content");
			selectBoxModel.setText("Content");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject+wr_content");
			selectBoxModel.setText("Subject + Content");
			selectBoxModelList.add(selectBoxModel);
			
		} else if("qna".equalsIgnoreCase(super.getController())) {
			selectBoxModelList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject");
			selectBoxModel.setText("Subject");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_content");
			selectBoxModel.setText("Content");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject+wr_content");
			selectBoxModel.setText("Subject + Content");
			selectBoxModelList.add(selectBoxModel);
			
		} else if("faq".equalsIgnoreCase(super.getController())) {
			selectBoxModelList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject");
			selectBoxModel.setText("Subject");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_content");
			selectBoxModel.setText("Content");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject+wr_content");
			selectBoxModel.setText("Subject + Content");
			selectBoxModelList.add(selectBoxModel);
			
		} else if("history".equalsIgnoreCase(super.getController())) {
			selectBoxModelList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject");
			selectBoxModel.setText("Subject");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_content");
			selectBoxModel.setText("Content");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject+wr_content");
			selectBoxModel.setText("Subject + Content");
			selectBoxModelList.add(selectBoxModel);
		}else if("forum".equalsIgnoreCase(super.getController())) {
			selectBoxModelList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject");
			selectBoxModel.setText("Subject");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_content");
			selectBoxModel.setText("Content");
			selectBoxModelList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("wr_subject+wr_content");
			selectBoxModel.setText("Subject + Content");
			selectBoxModelList.add(selectBoxModel);
		}

		return selectBoxModelList;
	}

	public List<SelectBoxModel> getCa_nameList() {
		if("appstore".equalsIgnoreCase(super.getController())) {
			ca_nameList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Plug-in");
			selectBoxModel.setText("Plug-in");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Script");
			selectBoxModel.setText("Script");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Python");
			selectBoxModel.setText("Python");
			ca_nameList.add(selectBoxModel);
		} else if("faq".equalsIgnoreCase(super.getController())) {
			ca_nameList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Order/Delivery");
			selectBoxModel.setText("Order/Delivery");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("License");
			selectBoxModel.setText("License");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Student License");
			selectBoxModel.setText("Student License");
			ca_nameList.add(selectBoxModel);

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Discount Program");
			selectBoxModel.setText("Discount Program");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Error/Issue");
			selectBoxModel.setText("Error/Issue");
			ca_nameList.add(selectBoxModel);
			
			
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("주문/배송");
//			selectBoxModel.setText("주문/배송");
//			ca_nameList.add(selectBoxModel);
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("라이선스");
//			selectBoxModel.setText("라이선스");
//			ca_nameList.add(selectBoxModel);
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("Student 라이선스");
//			selectBoxModel.setText("Student 라이선스");
//			ca_nameList.add(selectBoxModel);
//
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("할인");
//			selectBoxModel.setText("할인");
//			ca_nameList.add(selectBoxModel);
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("오류/기타");
//			selectBoxModel.setText("오류/기타");
//			ca_nameList.add(selectBoxModel);
		
		}else if("forum".equalsIgnoreCase(super.getController())) {
			ca_nameList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Event/Conference");
			selectBoxModel.setText("Event/Conference");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("News");
			selectBoxModel.setText("News");
			ca_nameList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Journal/Paper");
			selectBoxModel.setText("Journal/Paper");
			ca_nameList.add(selectBoxModel);

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Etc.");
			selectBoxModel.setText("Etc.");
			ca_nameList.add(selectBoxModel);
	
		
		}		
				
		
		return ca_nameList;
	}

	public void setCa_nameList(List<SelectBoxModel> ca_nameList) {
		this.ca_nameList = ca_nameList;
	}
	
	public List<SelectBoxModel> getCa_nameSearchList() {
		if("appstore".equalsIgnoreCase(super.getController())) {
			ca_nameSearchList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("ALL");
			selectBoxModel.setText("ALL");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Plug-in");
			selectBoxModel.setText("Plug-in");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Script");
			selectBoxModel.setText("Script");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Python");
			selectBoxModel.setText("Python");
			ca_nameSearchList.add(selectBoxModel);
			
		} else if("faq".equalsIgnoreCase(super.getController())) {
			ca_nameSearchList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("ALL");
			selectBoxModel.setText("ALL");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Order/Delivery");
			selectBoxModel.setText("Order/Delivery");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("License");
			selectBoxModel.setText("License");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Student License");
			selectBoxModel.setText("Student License");
			ca_nameSearchList.add(selectBoxModel);

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Discount Program");
			selectBoxModel.setText("Discount Program");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Error/Issue");
			selectBoxModel.setText("Error/Issue");
			ca_nameSearchList.add(selectBoxModel);

//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("주문/배송");
//			selectBoxModel.setText("주문/배송");
//			ca_nameSearchList.add(selectBoxModel);
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("라이선스");
//			selectBoxModel.setText("라이선스");
//			ca_nameSearchList.add(selectBoxModel);
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("Student 라이선스");
//			selectBoxModel.setText("Student 라이선스");
//			ca_nameSearchList.add(selectBoxModel);
//
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("할인");
//			selectBoxModel.setText("할인");
//			ca_nameSearchList.add(selectBoxModel);
//			
//			selectBoxModel = new SelectBoxModel();
//			selectBoxModel.setValue("오류/기타");
//			selectBoxModel.setText("오류/기타");
//			ca_nameSearchList.add(selectBoxModel);
			
			
			
		}else if("forum".equalsIgnoreCase(super.getController())) {
			ca_nameSearchList = new ArrayList<SelectBoxModel>();
			SelectBoxModel selectBoxModel;
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("ALL");
			selectBoxModel.setText("ALL");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Event/Conference");
			selectBoxModel.setText("Event/Conference");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("News");
			selectBoxModel.setText("News");
			ca_nameSearchList.add(selectBoxModel);
			
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Jounal/Paper");
			selectBoxModel.setText("Jounal/Paper");
			ca_nameSearchList.add(selectBoxModel);

			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue("Etc.");
			selectBoxModel.setText("Etc.");
			ca_nameSearchList.add(selectBoxModel);
	
		}		
		
		return ca_nameSearchList;
	}
	
	public void setCa_nameSearchList(List<SelectBoxModel> ca_nameSearchList) {
		this.ca_nameSearchList = ca_nameSearchList;
	}
	
}
