package com.netminer.download_buy.buy.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.MultipartModel;
import com.cyframe.model.SelectBoxModel;
import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;

import lombok.Getter;
import lombok.Setter;



public class BuyModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String saleid;
	private String licenseusage;
	private String productid;
	private String proofUrl;
	private String proofFile;
	private String licenseterm;
	private String licensesize;
	private String edition;
	private String qty;
	private String email;
	private String pay;
	private String shipping;
	private String on_offline;
	private String status;
	private String price;
	private String sum;
	private String surtax;
	private String surtax_sum;
	private String discount;
	private String delivery;
	private String delivery2;
	private String manual;
	private String education;
	private String address1;
	private String address2;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private String phone;
	private String returnUrl;
	private String platform;
	private String registercount;
	private String registered;
	private String extensionPrice;
	private String extensionSum;
	
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getDelivery2() {
		return delivery2;
	}
	public void setDelivery2(String delivery2) {
		this.delivery2 = delivery2;
	}
	private String total;
	private String user_update;
	private String[] packages;
	@Getter @Setter private String[] extensions;
	private String[] saleids;
	private MultipartModel[] attach_files;
	private DacomEncryptSettlement dacomEncryptSettlement;

	private List<SelectBoxModel> licensetermsList;
	private List<SelectBoxModel> licensesizesList;
	private List<SelectBoxModel> qtyList;
	private List<ProductpackageModel> productpackageModelList;
	private List<SelectBoxModel> countryList;
	private List<EditionModel> editionModelList;
	private List<EditionpackageModel> editionpackageList;
	@Getter @Setter private List<ExtensionModel> extensionModelList;
	
	/*
	 * 결제 관련
	 */
	private String mid;
	private String encrypted_oid;
	private String buyer;
	private String productinfo;
	private String currency;
	private String encrypted_amount;
	private String home_url;
	private String encrypted_ret_url;
	private String encrypted_fail_url;
	private String encrypted_note_url;
	private String hashdata;

	private String timestamp;

	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getEncrypted_oid() {
		return encrypted_oid;
	}
	public void setEncrypted_oid(String encrypted_oid) {
		this.encrypted_oid = encrypted_oid;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getProductinfo() {
		return productinfo;
	}
	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getEncrypted_amount() {
		return encrypted_amount;
	}
	public void setEncrypted_amount(String encrypted_amount) {
		this.encrypted_amount = encrypted_amount;
	}
	public String getHome_url() {
		return home_url;
	}
	public void setHome_url(String home_url) {
		this.home_url = home_url;
	}
	public String getEncrypted_ret_url() {
		return encrypted_ret_url;
	}
	public void setEncrypted_ret_url(String encrypted_ret_url) {
		this.encrypted_ret_url = encrypted_ret_url;
	}
	public String getEncrypted_fail_url() {
		return encrypted_fail_url;
	}
	public void setEncrypted_fail_url(String encrypted_fail_url) {
		this.encrypted_fail_url = encrypted_fail_url;
	}
	public String getEncrypted_note_url() {
		return encrypted_note_url;
	}
	public void setEncrypted_note_url(String encrypted_note_url) {
		this.encrypted_note_url = encrypted_note_url;
	}
	public String getHashdata() {
		return hashdata;
	}
	public void setHashdata(String hashdata) {
		this.hashdata = hashdata;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}
	public DacomEncryptSettlement getDacomEncryptSettlement() {
		return dacomEncryptSettlement;
	}
	public void setDacomEncryptSettlement(DacomEncryptSettlement dacomEncryptSettlement) {
		this.dacomEncryptSettlement = dacomEncryptSettlement;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getSurtax() {
		return surtax;
	}
	public void setSurtax(String surtax) {
		this.surtax = surtax;
	}
	public String getSurtax_sum() {
		return surtax_sum;
	}
	public void setSurtax_sum(String surtax_sum) {
		this.surtax_sum = surtax_sum;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public MultipartModel[] getAttach_files() {
		return attach_files;
	}
	public void setAttach_files(MultipartModel[] attach_files) {
		this.attach_files = attach_files;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOn_offline() {
		return on_offline;
	}
	public void setOn_offline(String on_offline) {
		this.on_offline = on_offline;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public String[] getSaleids() {
		return saleids;
	}
	public void setSaleids(String[] saleids) {
		this.saleids = saleids;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public List<SelectBoxModel> getLicensetermsList() {
		return licensetermsList;
	}
	public void setLicensetermsList(List<SelectBoxModel> licensetermsList) {
		this.licensetermsList = licensetermsList;
	}
	public List<SelectBoxModel> getLicensesizesList() {
		return licensesizesList;
	}
	public void setLicensesizesList(List<SelectBoxModel> licensesizesList) {
		this.licensesizesList = licensesizesList;
	}
	public void setQtyList(List<SelectBoxModel> qtyList) {
		this.qtyList = qtyList;
	}

	public String[] getPackages() {
		return packages;
	}
	public void setPackages(String[] packages) {
		this.packages = packages;
	}

	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public List<ProductpackageModel> getProductpackageModelList() {
		return productpackageModelList;
	}
	public void setProductpackageModelList(List<ProductpackageModel> productpackageModelList) {
		this.productpackageModelList = productpackageModelList;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public List<EditionModel> getEditionModelList() {
		return editionModelList;
	}
	public void setEditionModelList(List<EditionModel> editionModelList) {
		this.editionModelList = editionModelList;
	}
	public List<EditionpackageModel> getEditionpackageList() {
		return editionpackageList;
	}
	public void setEditionpackageList(List<EditionpackageModel> editionpackageList) {
		this.editionpackageList = editionpackageList;
	}
	public String getProofFile() {
		return proofFile;
	}
	public void setProofFile(String proofFile) {
		this.proofFile = proofFile;
	}
	public String getProofUrl() {
		return proofUrl;
	}
	public void setProofUrl(String proofUrl) {
		this.proofUrl = proofUrl;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}

	public void setQtyList(int q) {
		qtyList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		for(int i = 1; i <= q; i++) {
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue(String.valueOf(i));
			selectBoxModel.setText(String.valueOf(i));
			qtyList.add(selectBoxModel);
		}
	}
	
	public List<SelectBoxModel> getQtyList() {
		return qtyList;
	}
	
	public List<SelectBoxModel> getCountryList() {
		return countryList;
	}
	public void setCountryList(List<SelectBoxModel> countryList) {
		this.countryList = countryList;
	}
	public String getManual() {
		return manual;
	}
	public void setManual(String manual) {
		this.manual = manual.split(",")[0];
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education.split(",")[0];
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	
	public String getTimestamp() {
		return timestamp;
	}
	public String getReturnurl() {
		return returnUrl;
	}
	public void setReturnurl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getRegistercount() {
		return registercount;
	}
	public void setRegistercount(String registercount) {
		this.registercount = registercount;
	}
	public String getRegistered() {
		return registered;
	}
	public void setRegistered(String registered) {
		this.registered = registered;
	}
	public String getExtensionSum() {
		return extensionSum;
	}
	public void setExtensionSum(String extensionSum) {
		this.extensionSum = extensionSum;
	}
	public String getExtensionPrice() {
		return extensionPrice;
	}
	public void setExtensionPrice(String extensionPrice) {
		this.extensionPrice = extensionPrice;
	}
}
