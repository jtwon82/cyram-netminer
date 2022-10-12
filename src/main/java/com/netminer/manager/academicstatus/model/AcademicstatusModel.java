package com.netminer.manager.academicstatus.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.SelectBoxModel;



public class AcademicstatusModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String id = "";
	private String oid = "";
	private String name = "";
	private String degree = "";
	private String major = "";
	private String url = "";
	private String imagepath = "";
	private String orgname = "";
	private String confirmed = "";
	private String confirmdate = "";
	private String instructor = "";
	private String course = "";
	private String courseUrl = "";
	private String year = "";
	private String season = "";
	
	private String search_confirmed = "";
	
	private List<SelectBoxModel> selectBoxModelList;
	private List<SelectBoxModel> confirmedList;

	public List<SelectBoxModel> getSelectBoxModelList() {
		selectBoxModelList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("oid");
		selectBoxModel.setText("oid");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("degree");
		selectBoxModel.setText("degree");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("name");
		selectBoxModel.setText("name");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("major");
		selectBoxModel.setText("major");
		selectBoxModelList.add(selectBoxModel);
		
		return selectBoxModelList;
	}

	public void setSelectBoxModelList(List<SelectBoxModel> selectBoxModelList) {
		this.selectBoxModelList = selectBoxModelList;
	}

	public List<SelectBoxModel> getConfirmedList() {
		confirmedList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("");
		selectBoxModel.setText("Confirmed 선택");
		confirmedList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("Y");
		selectBoxModel.setText("확인");
		confirmedList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("N");
		selectBoxModel.setText("미확인");
		confirmedList.add(selectBoxModel);
		
		return confirmedList;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public void setConfirmedList(List<SelectBoxModel> confirmedList) {
		this.confirmedList = confirmedList;
	}
	
	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public String getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(String confirmed) {
		this.confirmed = confirmed;
	}

	public String getConfirmdate() {
		return confirmdate;
	}

	public void setConfirmdate(String confirmdate) {
		this.confirmdate = confirmdate;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getCourseUrl() {
		return courseUrl;
	}

	public void setCourseUrl(String courseUrl) {
		this.courseUrl = courseUrl;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSearch_confirmed() {
		return search_confirmed;
	}

	public void setSearch_confirmed(String search_confirmed) {
		this.search_confirmed = search_confirmed;
	}


}
