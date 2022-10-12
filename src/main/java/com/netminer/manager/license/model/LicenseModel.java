package com.netminer.manager.license.model;

import com.cyframe.model.CyframeModel;



public class LicenseModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String licensetype = "";
	private String category = "";
	private String factor = "";
	private String type = "";

	public String getLicensetype() {
		return licensetype;
	}

	public void setLicensetype(String licensetype) {
		this.licensetype = licensetype;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFactor() {
		return factor;
	}

	public void setFactor(String factor) {
		this.factor = factor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
}
