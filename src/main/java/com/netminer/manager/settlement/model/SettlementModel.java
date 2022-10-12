package com.netminer.manager.settlement.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.SelectBoxModel;



public class SettlementModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String s_idx = "";
	private String s_sid = "";
	private String s_spw = "";
	private String s_orderid = "";
	private String s_product = "";
	private String s_poinvoice = "";
	private String s_licenseinfo_1 = "";
	private String s_licenseinfo_2 = "";
	private String s_licenseinfo_3 = "";
	private String s_memo = "";
	private String s_price = "";
	private String s_location = "";
	private String s_paidstatus = "";
	private String s_createdate = "";
	private String s_year = "";
	private String s_month = "";
	private String s_day = "";
	private String e_year = "";
	private String e_month = "";
	private String e_day = "";
	private String mailMemo = "";
	private String mailURL = "";
	private String ems = "";

	private String CST_PLATFORM;
	private String CST_MID;
	private String LGD_MID;
	private String LGD_OID;
	private String LGD_BUYER;
	private String LGD_PRODUCTINFO;
	private String LGD_AMOUNT;
	private String LGD_BUYEREMAIL;
	private String LGD_CUSTOM_SKIN;
	private String LGD_CUSTOM_PROCESSTYPE;
	private String LGD_TIMESTAMP;
	private String LGD_HASHDATA;
	private String LGD_PAYKEY;
	private String LGD_CUSTOM_USABLEPAY;
	private String LGD_WINDOW_VER;
	private String LGD_RETURNURL;
	private String LGD_RESPCODE;
	private String LGD_RESPMSG;
	private String SCRIPT;

	private List<SelectBoxModel> licenseinfo_1List;
	private List<SelectBoxModel> locationList;
	private List<SelectBoxModel> paidstatusList;
	private List<SelectBoxModel> selectBoxModelList;
	
	public String getSCRIPT() {
		return SCRIPT;
	}

	public void setSCRIPT(String sCRIPT) {
		SCRIPT = sCRIPT;
	}

	public String getCST_PLATFORM() {
		return CST_PLATFORM;
	}

	public void setCST_PLATFORM(String cST_PLATFORM) {
		CST_PLATFORM = cST_PLATFORM;
	}

	public String getCST_MID() {
		return CST_MID;
	}

	public void setCST_MID(String cST_MID) {
		CST_MID = cST_MID;
	}

	public String getLGD_MID() {
		return LGD_MID;
	}

	public void setLGD_MID(String lGD_MID) {
		LGD_MID = lGD_MID;
	}

	public String getLGD_OID() {
		return LGD_OID;
	}

	public void setLGD_OID(String lGD_OID) {
		LGD_OID = lGD_OID;
	}

	public String getLGD_BUYER() {
		return LGD_BUYER;
	}

	public void setLGD_BUYER(String lGD_BUYER) {
		LGD_BUYER = lGD_BUYER;
	}

	public String getLGD_PRODUCTINFO() {
		return LGD_PRODUCTINFO;
	}

	public void setLGD_PRODUCTINFO(String lGD_PRODUCTINFO) {
		LGD_PRODUCTINFO = lGD_PRODUCTINFO;
	}

	public String getLGD_AMOUNT() {
		return LGD_AMOUNT;
	}

	public void setLGD_AMOUNT(String lGD_AMOUNT) {
		LGD_AMOUNT = lGD_AMOUNT;
	}

	public String getLGD_BUYEREMAIL() {
		return LGD_BUYEREMAIL;
	}

	public void setLGD_BUYEREMAIL(String lGD_BUYEREMAIL) {
		LGD_BUYEREMAIL = lGD_BUYEREMAIL;
	}

	public String getLGD_CUSTOM_SKIN() {
		return LGD_CUSTOM_SKIN;
	}

	public void setLGD_CUSTOM_SKIN(String lGD_CUSTOM_SKIN) {
		LGD_CUSTOM_SKIN = lGD_CUSTOM_SKIN;
	}

	public String getLGD_CUSTOM_PROCESSTYPE() {
		return LGD_CUSTOM_PROCESSTYPE;
	}

	public void setLGD_CUSTOM_PROCESSTYPE(String lGD_CUSTOM_PROCESSTYPE) {
		LGD_CUSTOM_PROCESSTYPE = lGD_CUSTOM_PROCESSTYPE;
	}

	public String getLGD_TIMESTAMP() {
		return LGD_TIMESTAMP;
	}

	public void setLGD_TIMESTAMP(String lGD_TIMESTAMP) {
		LGD_TIMESTAMP = lGD_TIMESTAMP;
	}

	public String getLGD_HASHDATA() {
		return LGD_HASHDATA;
	}

	public void setLGD_HASHDATA(String lGD_HASHDATA) {
		LGD_HASHDATA = lGD_HASHDATA;
	}

	public String getLGD_PAYKEY() {
		return LGD_PAYKEY;
	}

	public void setLGD_PAYKEY(String lGD_PAYKEY) {
		LGD_PAYKEY = lGD_PAYKEY;
	}

	public String getLGD_CUSTOM_USABLEPAY() {
		return LGD_CUSTOM_USABLEPAY;
	}

	public void setLGD_CUSTOM_USABLEPAY(String lGD_CUSTOM_USABLEPAY) {
		LGD_CUSTOM_USABLEPAY = lGD_CUSTOM_USABLEPAY;
	}

	public void setLGD_WINDOW_VER(String lGD_WINDOW_VER) {
		LGD_WINDOW_VER = lGD_WINDOW_VER;
	}
	
	public String getLGD_WINDOW_VER() {
		return LGD_WINDOW_VER;
	}
	
	public void setLGD_RETURNURL(String lGD_RETURNURL) {
		LGD_RETURNURL = lGD_RETURNURL;
	}
	
	public String getLGD_RETURNURL() {
		return LGD_RETURNURL;
	}

	public String getCST_WINDOW_TYPE() {
		return "popup";
	}
	
	public String getLGD_RESPCODE() {
		return LGD_RESPCODE;
	}

	public void setLGD_RESPCODE(String lGD_RESPCODE) {
		LGD_RESPCODE = lGD_RESPCODE;
	}

	public String getLGD_RESPMSG() {
		return LGD_RESPMSG;
	}

	public void setLGD_RESPMSG(String lGD_RESPMSG) {
		LGD_RESPMSG = lGD_RESPMSG;
	}

	public String getEms() {
		return ems;
	}

	public void setEms(String ems) {
		this.ems = ems;
	}

	public String getMailMemo() {
		return mailMemo;
	}

	public void setMailMemo(String mailMemo) {
		this.mailMemo = mailMemo;
	}

	public String getMailURL() {
		return mailURL;
	}

	public void setMailURL(String mailURL) {
		this.mailURL = mailURL;
	}

	public String getS_year() {
		return s_year;
	}

	public void setS_year(String s_year) {
		this.s_year = s_year;
	}

	public String getS_month() {
		return s_month;
	}

	public void setS_month(String s_month) {
		this.s_month = s_month;
	}

	public String getS_day() {
		return s_day;
	}

	public void setS_day(String s_day) {
		this.s_day = s_day;
	}

	public String getE_year() {
		return e_year;
	}

	public void setE_year(String e_year) {
		this.e_year = e_year;
	}

	public String getE_month() {
		return e_month;
	}

	public void setE_month(String e_month) {
		this.e_month = e_month;
	}

	public String getE_day() {
		return e_day;
	}

	public void setE_day(String e_day) {
		this.e_day = e_day;
	}

	public String getS_idx() {
		return s_idx;
	}

	public void setS_idx(String s_idx) {
		this.s_idx = s_idx;
	}

	public String getS_sid() {
		return s_sid;
	}

	public void setS_sid(String s_sid) {
		this.s_sid = s_sid;
	}

	public String getS_spw() {
		return s_spw;
	}

	public void setS_spw(String s_spw) {
		this.s_spw = s_spw;
	}

	public String getS_orderid() {
		return s_orderid;
	}

	public void setS_orderid(String s_orderid) {
		this.s_orderid = s_orderid;
	}

	public String getS_product() {
		return s_product;
	}

	public void setS_product(String s_product) {
		this.s_product = s_product;
	}

	public String getS_poinvoice() {
		return s_poinvoice;
	}

	public void setS_poinvoice(String s_poinvoice) {
		this.s_poinvoice = s_poinvoice;
	}

	public String getS_licenseinfo_1() {
		return s_licenseinfo_1;
	}

	public void setS_licenseinfo_1(String s_licenseinfo_1) {
		this.s_licenseinfo_1 = s_licenseinfo_1;
	}

	public String getS_licenseinfo_2() {
		return s_licenseinfo_2;
	}

	public void setS_licenseinfo_2(String s_licenseinfo_2) {
		this.s_licenseinfo_2 = s_licenseinfo_2;
	}

	public String getS_licenseinfo_3() {
		return s_licenseinfo_3;
	}

	public void setS_licenseinfo_3(String s_licenseinfo_3) {
		this.s_licenseinfo_3 = s_licenseinfo_3;
	}

	public String getS_memo() {
		return s_memo;
	}

	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
	}

	public String getS_price() {
		return s_price;
	}

	public void setS_price(String s_price) {
		this.s_price = s_price;
	}

	public String getS_location() {
		return s_location;
	}

	public void setS_location(String s_location) {
		this.s_location = s_location;
	}

	public String getS_paidstatus() {
		return s_paidstatus;
	}

	public void setS_paidstatus(String s_paidstatus) {
		this.s_paidstatus = s_paidstatus;
	}

	public String getS_createdate() {
		return s_createdate;
	}

	public void setS_createdate(String s_createdate) {
		this.s_createdate = s_createdate;
	}

	public void setLicenseinfo_1List(List<SelectBoxModel> licenseinfo_1List) {
		this.licenseinfo_1List = licenseinfo_1List;
	}

	public void setLocationList(List<SelectBoxModel> locationList) {
		this.locationList = locationList;
	}

	public void setPaidstatusList(List<SelectBoxModel> paidstatusList) {
		this.paidstatusList = paidstatusList;
	}

	public void setSelectBoxModelList(List<SelectBoxModel> selectBoxModelList) {
		this.selectBoxModelList = selectBoxModelList;
	}

	public List<SelectBoxModel> getSelectBoxModelList() {
		selectBoxModelList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("s_sid");
		selectBoxModel.setText("아이디");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("s_orderid");
		selectBoxModel.setText("Order ID");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("s_product");
		selectBoxModel.setText("Product");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("s_poinvoice");
		selectBoxModel.setText("PO# Invoice#");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("s_memo");
		selectBoxModel.setText("Memo");
		selectBoxModelList.add(selectBoxModel);
		
		return selectBoxModelList;
	}
	public List<SelectBoxModel> getPaidstatusList() {
		paidstatusList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("확인중");
		selectBoxModel.setText("확인중");
		paidstatusList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("결제완료");
		selectBoxModel.setText("결제완료");
		paidstatusList.add(selectBoxModel);
		
		return paidstatusList;
	}
	
	public List<SelectBoxModel> getLocationList() {
		locationList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("domestic");
		selectBoxModel.setText("국내");
		locationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("oversea");
		selectBoxModel.setText("해외");
		locationList.add(selectBoxModel);
		
		return locationList;
	}
	
	public List<SelectBoxModel> getLicenseinfo_1List() {
		licenseinfo_1List = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("프로그램");
		selectBoxModel.setText("프로그램");
		licenseinfo_1List.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("교육");
		selectBoxModel.setText("교육");
		licenseinfo_1List.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("컨설팅");
		selectBoxModel.setText("컨설팅");
		licenseinfo_1List.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("기타");
		selectBoxModel.setText("기타");
		licenseinfo_1List.add(selectBoxModel);
		
		return licenseinfo_1List;
	}

}
