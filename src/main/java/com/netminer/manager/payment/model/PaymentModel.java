package com.netminer.manager.payment.model;

import com.cyframe.model.CyframeModel;

import lombok.Getter;
import lombok.Setter;



public class PaymentModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String id = "";
	private String oid = "";
	private String abroad = "";
	private String price = "";
	private String unitsprice = "";
	private String upgradediffer = "";
	private String vat = "";
	private String shipping_cost = "";
	private String currency = "";
	private String saledate = "";
	private String saletime = "";
	@Getter @Setter private String extensionPrice = "";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getAbroad() {
		return abroad;
	}
	public void setAbroad(String abroad) {
		this.abroad = abroad;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUnitsprice() {
		return unitsprice;
	}
	public void setUnitsprice(String unitsprice) {
		this.unitsprice = unitsprice;
	}
	public String getUpgradediffer() {
		return upgradediffer;
	}
	public void setUpgradediffer(String upgradediffer) {
		this.upgradediffer = upgradediffer;
	}
	public String getVat() {
		return vat;
	}
	public void setVat(String vat) {
		this.vat = vat;
	}
	public String getShipping_cost() {
		return shipping_cost;
	}
	public void setShipping_cost(String shipping_cost) {
		this.shipping_cost = shipping_cost;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getSaledate() {
		return saledate;
	}
	public void setSaledate(String saledate) {
		this.saledate = saledate;
	}
	public String getSaletime() {
		return saletime;
	}
	public void setSaletime(String saletime) {
		this.saletime = saletime;
	}


}
