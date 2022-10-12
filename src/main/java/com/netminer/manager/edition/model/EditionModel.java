package com.netminer.manager.edition.model;

import java.math.BigDecimal;

import com.cyframe.model.CyframeModel;

public class EditionModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String id = "";
	private String label = "";
	private String description = "";
	private String descriptionkr = "";
	private String usdprice = "";
	private String krwprice = "";

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescriptionkr() {
		return descriptionkr;
	}

	public void setDescriptionkr(String descriptionkr) {
		this.descriptionkr = descriptionkr;
	}

	public String getUsdprice() {
		return usdprice;
	}

	public void setUsdprice(String usdprice) {
		this.usdprice = usdprice;
	}

	public String getKrwprice() {
		return krwprice;
	}

	public void setKrwprice(String krwprice) {
		BigDecimal bd = new BigDecimal(krwprice);
		this.krwprice = Long.toString(bd.longValue()).split("\\.")[0];
	}

}
