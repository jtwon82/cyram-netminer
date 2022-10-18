package com.cyframe.model;

import java.io.Serializable;


public class SelectBoxModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String text;
	private String value;

	public SelectBoxModel() {
	}
	
	public SelectBoxModel(String _text, String _value) {
		text=_text;
		value=_value;
	}
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
