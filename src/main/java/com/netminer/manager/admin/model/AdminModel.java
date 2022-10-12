package com.netminer.manager.admin.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.SelectBoxModel;



public class AdminModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String adminid;
	private String adminpw;
	private String adminname;
	private String reg_date;
	private String del;
	private List<SelectBoxModel> delList;
	
	public List<SelectBoxModel> getDelList() {
		delList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("Y");
		selectBoxModel.setText("사용안함");
		delList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("N");
		selectBoxModel.setText("사용");
		delList.add(selectBoxModel);
		return delList;
	}
	public void setDelList(List<SelectBoxModel> delList) {
		this.delList = delList;
	}
	
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
}
