package com.netminer.manager.productpackage.model;

import java.math.BigDecimal;

import com.cyframe.model.CyframeModel;



public class ProductpackageModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String id = ""; 
	private String product = ""; 
	private String category = ""; 
	private String subcategory = "";
	private String packageid = "";
	private String name = ""; 
	private String descriptionurl = ""; 
	private String note = ""; 
	private String usdprice = ""; 
	private String krwprice = ""; 
	private String licenseusage = ""; 
	private String licenseterm = ""; 
	private String licensesize = "";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getPackageid() {
		return packageid;
	}
	public void setPackageid(String packageid) {
		this.packageid = packageid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescriptionurl() {
		return descriptionurl;
	}
	public void setDescriptionurl(String descriptionurl) {
		this.descriptionurl = descriptionurl;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUsdprice() {
		return usdprice;
	}
	public void setUsdprice(String usdprice) {
		this.usdprice = usdprice.split("\\.")[0];
	}
	public String getKrwprice() {
		return krwprice;
	}
	public void setKrwprice(String krwprice) {
		BigDecimal bd = new BigDecimal(krwprice);
		this.krwprice = Long.toString(bd.longValue()).split("\\.")[0];
	}
	public String getLicenseusage() {
		return licenseusage;
	}
	public void setLicenseusage(String licenseusage) {
		this.licenseusage = licenseusage;
	}
	public String getLicenseterm() {
		return licenseterm;
	}
	public void setLicenseterm(String licenseterm) {
		this.licenseterm = licenseterm;
	}
	public String getLicensesize() {
		return licensesize;
	}
	public void setLicensesize(String licensesize) {
		this.licensesize = licensesize;
	} 
	
	
}
