package com.netminer.common.layout.model;

import com.cyframe.model.CyframeModel;

public class TopModel extends CyframeModel {

	private static final long serialVersionUID = 1L;
	
	private boolean lang;

	public boolean isLang() {
		return lang;
	}

	public void setLang(boolean lang) {
		this.lang = lang;
	}
	
}