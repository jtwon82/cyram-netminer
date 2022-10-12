package com.netminer.manager.edition.model;

import com.cyframe.model.CyframeModel;



public class EditionpackageModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String id = ""; 
	private String editionid = ""; 
	private String packageid = ""; 
	private String licensesize = "";
	private String licenseterm = "";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEditionid() {
		return editionid;
	}
	public void setEditionid(String editionid) {
		this.editionid = editionid;
	}
	public String getPackageid() {
		return packageid;
	}
	public void setPackageid(String packageid) {
		this.packageid = packageid;
	}
	public String getLicensesize() {
		return licensesize;
	}
	public void setLicensesize(String licensesize) {
		this.licensesize = licensesize;
	}
	public String getLicenseterm() {
		return licenseterm;
	}
	public void setLicenseterm(String licenseterm) {
		this.licenseterm = licenseterm;
	}
}
