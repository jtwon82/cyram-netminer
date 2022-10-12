package com.netminer.manager.sale.model;

import com.cyframe.model.CyframeModel;



public class SaleLicenseModel extends CyframeModel implements Cloneable {

	private static final long serialVersionUID = 1L;

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	private String license = "";

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}
	
	
	
}
