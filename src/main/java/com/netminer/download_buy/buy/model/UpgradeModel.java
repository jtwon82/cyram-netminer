package com.netminer.download_buy.buy.model;

import java.util.List;

import com.cyframe.model.CyframeModel;
import com.netminer.manager.productpackage.model.PackageModel;

import lombok.Getter;
import lombok.Setter;

public class UpgradeModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String name;
	private String email;
	private String organization;
	private String department;
	private String position;
	private String contactinfo;
	private String licensetype;
	private String datasize;
	private String numberofusers;
	private String licenseusage;
	private String message;
	private String productid;
	private String productserial;
	private String payment;
	private String[] packages;
	@Getter @Setter private boolean sns;
	@Getter @Setter private boolean bibl;
	
	private List<PackageModel> packageModelList;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getContactinfo() {
		return contactinfo;
	}
	public void setContactinfo(String contactinfo) {
		this.contactinfo = contactinfo;
	}
	public String getLicensetype() {
		return licensetype;
	}
	public void setLicensetype(String licensetype) {
		this.licensetype = licensetype;
	}
	public String getDatasize() {
		return datasize;
	}
	public void setDatasize(String datasize) {
		this.datasize = datasize;
	}
	public String getNumberofusers() {
		return numberofusers;
	}
	public void setNumberofusers(String numberofusers) {
		this.numberofusers = numberofusers;
	}
	public String getLicenseusage() {
		return licenseusage;
	}
	public void setLicenseusage(String licenseusage) {
		this.licenseusage = licenseusage;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getProductserial() {
		return productserial;
	}
	public void setProductserial(String productserial) {
		this.productserial = productserial;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String[] getPackages() {
		return packages;
	}
	public void setPackages(String[] packages) {
		this.packages = packages;
	}
	public List<PackageModel> getPackageModelList() {
		return packageModelList;
	}
	public void setPackageModelList(List<PackageModel> packageModelList) {
		this.packageModelList = packageModelList;
	}
	
	
}
