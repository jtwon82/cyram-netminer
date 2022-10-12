package com.netminer.manager.sale.model;

import java.math.BigDecimal;

import com.cyframe.model.CyframeModel;



public class SalePackageModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String saleid = ""; 
	private String productpackageid = ""; 
	private String krwprice = ""; 
	private String usdprice = "";
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}
	public String getProductpackageid() {
		return productpackageid;
	}
	public void setProductpackageid(String productpackageid) {
		this.productpackageid = productpackageid;
	}
	public String getKrwprice() {
		return krwprice;
	}
	public void setKrwprice(String krwprice) {
		BigDecimal bd = new BigDecimal(krwprice);
		this.krwprice = Long.toString(bd.longValue()).split("\\.")[0];
	}
	public String getUsdprice() {
		return usdprice;
	}
	public void setUsdprice(String usdprice) {
		this.usdprice = usdprice;
	} 

	
}
