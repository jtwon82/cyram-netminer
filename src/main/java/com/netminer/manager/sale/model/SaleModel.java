package com.netminer.manager.sale.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.MultipartModel;
import com.cyframe.model.NationModel;
import com.cyframe.model.SelectBoxModel;
import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;

import lombok.Getter;
import lombok.Setter;



public class SaleModel extends CyframeModel implements Cloneable {

	private static final long serialVersionUID = 1L;

	public static final String NEW_PRODUCT = "69";
	public static final String LICENSETERM_ONE_YEAR = "5";
	public static final String LICENSEUSAGE_STUDENT = "6";
	public static final String LICENSEUSAGE_ACADEMIC = "7";
	public static final String LICENSEUSAGE_COMMERCIAL = "8";
	public static final String EDITION_PREMIUM = "7";
	public static final String LICENSESIZE_HUGE = "3";
	public static final String PLAN_STANDARD = "6";
	public static final String PLAN_PREMIUM = "7";


	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	private String saleid = "";
	private String loginid = "";
	private String oid = "";
	private String filename = "";
	private String productid = SaleModel.NEW_PRODUCT;
	private String edition = "";
	private String licenseusage = "";
	private String licenseusage_name = "";
	private String licenseusagefactor = "";
	private String licenseterm = "";
	private String licenseterm_name = "";
	private String licensetermfactor = "";
	private String licensesize = "1";
	private String licensesize_name = "";
	private String edition_name = "";
	private String licensesizefactor = "";
	private String serialnum = "";
	private String productserial = "";
	private String next_productserial = "";
	private String hardwarekey = "0";
	private String next_hardwarekey = "";
	private String replacedid = "";
	private String saledate = "";
	private String saletime = "";
	private String expiredate = "";
	private String shipping = "";
	private String isshipped = "0";
	private String shippingid = "";
	private String academicauth = "1";
	private String proofUrl = "";
	private String proofImage = "";
	private String prooforg = "";
	private String confirmdate = "";
	private String confirmed = "";
	private String fullname = "";
	private String orgname = "";
	private String address1 = "";
	private String address2 = "";
	private String city = "";
	private String state = "";
	private String zipcode = "";
	private String country = "";
	private String phone = "";
	private String email = "";
	private String on_offline = "";
	private String note = "";
	private String wintype = "0";
	private String offlinecode = "";
	private String rangeChk="";
	private String s_year = "";
	private String s_month = "";
	private String s_day = "";
	private String e_year = "";
	private String e_month = "";
	private String e_day = "";
	private String licenseKeyYN = "";
	private String shippingYN = "";
	private String price;
	private String sum;
	private String surtax;
	private String surtax_sum;
	private String discount;
	private String delivery;
	private String total;
	private String abroad;
	private String currency;
	private String pay;
	private String manual;
	private String education;
	private String registercount;
	private String registered;
	private String[] packages;
	private String[] saleids;
	private String[] editionpackages;
	@Getter @Setter private String[] extensions;
	private String hardwareType;
	private String extensionPrice;
	private String extensionSum;
	@Getter private String modelNameKor;

	private MultipartModel[] attach_files;
	@Getter @Setter private String extensionNames;
	
	private List<SelectBoxModel> selectBoxModelList;
	private List<SelectBoxModel> shippingRequestList;
	private List<SelectBoxModel> shippihgStatusList;
	private List<SelectBoxModel> academicApprovalList;
	private List<SelectBoxModel> onOffLineList;
	
	private List<SelectBoxModel> licenseusagesList;
	private List<SelectBoxModel> licensetermsList;
	private List<SelectBoxModel> licensesizesList;
	private List<SelectBoxModel> packagesList;
	private List<SelectBoxModel> currencyList;
	private List<SelectBoxModel> countryList;
	
	private List<EditionModel> editionList;
	
	@Setter private List<SelectBoxModel> yesnoList;

	// 구매할 수 있는 모든 패키지 목록
	private List<ProductpackageModel> productpackageModelList;
	
	private List<ProductpackageModel> productpackagePriceList;
	
	// 메일 발송에 사용하는 선택한 패키지 목록
	private List<ProductpackageModel> salePackageModelList;
	
	private List<EditionpackageModel> edtionpackageModelList;
	
	@Getter @Setter private List<ExtensionModel> availableExtensions = new ArrayList<>();
	
	

	public List<SelectBoxModel> getYesnoList() {
		if(yesnoList==null) {
			yesnoList= new ArrayList<SelectBoxModel>();
		}
		yesnoList.add(new SelectBoxModel("Y","Y"));
		yesnoList.add(new SelectBoxModel("N","N"));
		return yesnoList;
	}
	
	
	
	
	
	
	
	
	public String[] getSaleids() {
		return saleids;
	}
	public void setSaleids(String[] saleids) {
		this.saleids = saleids;
	}
	
	public String[] getEditionpackages() {
		return editionpackages;
	}
	public void setEditionpackages(String[] editionpackages) {
		this.editionpackages = editionpackages;
	}
	public List<ProductpackageModel> getSalePackageModelList() {
		return salePackageModelList;
	}
	public void setSalePackageModelList(List<ProductpackageModel> salePackageModelList) {
		this.salePackageModelList = salePackageModelList;
	}
	public List<ProductpackageModel> getProductpackagePriceList() {
		return productpackagePriceList;
	}
	public void setProductpackagePriceList(
			List<ProductpackageModel> productpackagePriceList) {
		this.productpackagePriceList = productpackagePriceList;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public List<EditionModel> getEditionList() {
		return editionList;
	}
	public void setEditionList(List<EditionModel> editionList) {
		this.editionList = editionList;
	}
	public List<EditionpackageModel> getEdtionpackageModelList() {
		return edtionpackageModelList;
	}
	public void setEdtionpackageModelList(List<EditionpackageModel> edtionpackageModelList) {
		this.edtionpackageModelList = edtionpackageModelList;
	}
	public String getLicenseusage_name() {
		return licenseusage_name;
	}
	public void setLicenseusage_name(String licenseusage_name) {
		this.licenseusage_name = licenseusage_name;
	}
	public String getLicenseterm_name() {
		return licenseterm_name;
	}
	public void setLicenseterm_name(String licenseterm_name) {
		this.licenseterm_name = licenseterm_name;
	}
	public String getLicensesize_name() {
		return licensesize_name;
	}
	public void setLicensesize_name(String licensesize_name) {
		this.licensesize_name = licensesize_name;
	}
	public String getEdition_name() {
		return edition_name;
	}
	public void setEdition_name(String edition_name) {
		this.edition_name = edition_name;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getAbroad() {
		return abroad;
	}
	public void setAbroad(String abroad) {
		this.abroad = abroad;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getProoforg() {
		return prooforg;
	}
	public void setProoforg(String prooforg) {
		this.prooforg = prooforg;
	}
	public String getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(String confirmed) {
		this.confirmed = confirmed;
	}
	public String getConfirmdate() {
		return confirmdate;
	}
	public void setConfirmdate(String confirmdate) {
		this.confirmdate = confirmdate;
	}
	public String getProofImage() {
		return proofImage;
	}
	public void setProofImage(String proofImage) {
		this.proofImage = proofImage;
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
	public String getNext_productserial() {
		return next_productserial;
	}
	public void setNext_productserial(String next_productserial) {
		this.next_productserial = next_productserial.split("\\.")[0];
	}
	public String getNext_hardwarekey() {
		return next_hardwarekey;
	}
	public void setNext_hardwarekey(String next_hardwarekey) {
		this.next_hardwarekey = next_hardwarekey;
	}
	public String[] getPackages() {
		return packages;
	}
	public void setPackages(String[] packages) {
		this.packages = packages;
	}
	public List<SelectBoxModel> getPackagesList() {
		return packagesList;
	}
	public void setPackagesList(List<SelectBoxModel> packagesList) {
		this.packagesList = packagesList;
	}
	public List<ProductpackageModel> getProductpackageModelList() {
		return productpackageModelList;
	}
	public void setProductpackageModelList(List<ProductpackageModel> productpackageModelList) {
		this.productpackageModelList = productpackageModelList;
	}
	public void setOnOffLineList(List<SelectBoxModel> onOffLineList) {
		this.onOffLineList = onOffLineList;
	}
	
	public List<SelectBoxModel> getLicenseusagesList() {
		return licenseusagesList;
	}
	public void setLicenseusagesList(List<SelectBoxModel> licenseusagesList) {
		this.licenseusagesList = licenseusagesList;
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
	public void setAcademicApprovalList(List<SelectBoxModel> academicApprovalList) {
		this.academicApprovalList = academicApprovalList;
	}
	
	public void setShippihgStatusList(List<SelectBoxModel> shippihgStatusList) {
		this.shippihgStatusList = shippihgStatusList;
	}
	
	public void setSelectBoxModelList(List<SelectBoxModel> selectBoxModelList) {
		this.selectBoxModelList = selectBoxModelList;
	}

	public List<SelectBoxModel> getCountryList() {
		return countryList;
	}
	public void setCountryList(List<SelectBoxModel> countryList) {
		this.countryList = countryList;
	}
	
	public String getShippingYN() {
		return shippingYN;
	}
	public void setShippingYN(String shippingYN) {
		this.shippingYN = shippingYN;
	}
	public String getLicenseKeyYN() {
		return licenseKeyYN;
	}
	public void setLicenseKeyYN(String licenseKeyYN) {
		this.licenseKeyYN = licenseKeyYN;
	}
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getLicenseusage() {
		return licenseusage;
	}
	public void setLicenseusage(String licenseusage) {
		this.licenseusage = licenseusage;
		if(licenseusage.equals("7")) {
			modelNameKor = "아카데믹";
		} else if (licenseusage.equals("8")) {
			modelNameKor = "기관/기업용";
		}
	}
	public String getLicenseusagefactor() {
		return licenseusagefactor;
	}
	public void setLicenseusagefactor(String licenseusagefactor) {
		this.licenseusagefactor = licenseusagefactor;
	}
	public String getLicenseterm() {
		return licenseterm;
	}
	public void setLicenseterm(String licenseterm) {
		this.licenseterm = licenseterm;
	}
	public String getLicensetermfactor() {
		return licensetermfactor;
	}
	public void setLicensetermfactor(String licensetermfactor) {
		this.licensetermfactor = licensetermfactor;
	}
	public String getLicensesize() {
		return licensesize;
	}
	public void setLicensesize(String licensesize) {
		this.licensesize = licensesize;
	}
	public String getLicensesizefactor() {
		return licensesizefactor;
	}
	public void setLicensesizefactor(String licensesizefactor) {
		this.licensesizefactor = licensesizefactor;
	}
	public String getSerialnum() {
		return serialnum;
	}
	public void setSerialnum(String serialnum) {
		this.serialnum = serialnum;
	}
	public String getProductserial() {
		return productserial;
	}
	public void setProductserial(String productserial) {
		this.productserial = productserial;
	}
	public String getHardwarekey() {
		return hardwarekey;
	}
	public void setHardwarekey(String hardwarekey) {
		this.hardwarekey = hardwarekey;
	}
	public String getReplacedid() {
		return replacedid;
	}
	public void setReplacedid(String replacedid) {
		this.replacedid = replacedid;
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
	public String getExpiredate() {
		return expiredate;
	}
	public void setExpiredate(String expiredate) {
		this.expiredate = expiredate;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public String getIsshipped() {
		return isshipped;
	}
	public void setIsshipped(String isshipped) {
		this.isshipped = isshipped;
	}
	public String getShippingid() {
		return shippingid;
	}
	public void setShippingid(String shippingid) {
		this.shippingid = shippingid;
	}
	public String getAcademicauth() {
		return academicauth;
	}
	public void setAcademicauth(String academicauth) {
		this.academicauth = academicauth;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOn_offline() {
		return on_offline;
	}
	public void setOn_offline(String on_offline) {
		this.on_offline = on_offline;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getWintype() {
		return wintype;
	}
	public void setWintype(String wintype) {
		this.wintype = wintype;
	}
	public String getOfflinecode() {
		return offlinecode;
	}
	public void setOfflinecode(String offlinecode) {
		this.offlinecode = offlinecode;
	}
	public String getS_year() {
		return s_year;
	}
	public void setS_year(String s_year) {
		this.s_year = s_year;
	}
	public String getS_month() {
		return s_month;
	}
	public void setS_month(String s_month) {
		this.s_month = s_month;
	}
	public String getS_day() {
		return s_day;
	}
	public void setS_day(String s_day) {
		this.s_day = s_day;
	}
	public String getE_year() {
		return e_year;
	}
	public void setE_year(String e_year) {
		this.e_year = e_year;
	}
	public String getE_month() {
		return e_month;
	}
	public void setE_month(String e_month) {
		this.e_month = e_month;
	}
	public String getE_day() {
		return e_day;
	}
	public void setE_day(String e_day) {
		this.e_day = e_day;
	}
	public String getProofUrl() {
		return proofUrl;
	}
	public void setProofUrl(String proofUrl) {
		this.proofUrl = proofUrl;
	}
	public void setShippingRequestList(List<SelectBoxModel> shippingRequestList) {
		this.shippingRequestList = shippingRequestList;
	}
	
	public void setCurrencyList(List<SelectBoxModel> currencyList) {
		this.currencyList = currencyList;
	}
	
	public String getHardwareType() {
		return hardwareType;
	}
	public void setHardwareType(String hardwareType) {
		this.hardwareType = hardwareType;
	}
	
	public List<SelectBoxModel> getCurrencyList() {
		currencyList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("KRW");
		selectBoxModel.setText("KRW");
		currencyList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("USD");
		selectBoxModel.setText("USD");
		currencyList.add(selectBoxModel);
		
		return currencyList;
	}
	public List<SelectBoxModel> getOnOffLineList() {
		onOffLineList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("online");
		selectBoxModel.setText("online");
		onOffLineList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("offline");
		selectBoxModel.setText("offline");
		onOffLineList.add(selectBoxModel);
		
		return onOffLineList;
	}
	public List<SelectBoxModel> getAcademicApprovalList() {
		academicApprovalList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("0");
		selectBoxModel.setText("정상확인");
		academicApprovalList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("1");
		selectBoxModel.setText("미확인");
		academicApprovalList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("2");
		selectBoxModel.setText("불확실");
		academicApprovalList.add(selectBoxModel);
		
		return academicApprovalList;
	}
	public List<SelectBoxModel> getShippihgStatusList() {
		shippihgStatusList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("0");
		selectBoxModel.setText("Not Shipped Yet");
		shippihgStatusList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("1");
		selectBoxModel.setText("Shipped");
		shippihgStatusList.add(selectBoxModel);
		
		return shippihgStatusList;
	}
	public List<SelectBoxModel> getShippingRequestList() {
		shippingRequestList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("0");
		selectBoxModel.setText("Not to Ship");
		shippingRequestList.add(selectBoxModel);
		
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("1");
		selectBoxModel.setText("Ship It");
		shippingRequestList.add(selectBoxModel);
		
		return shippingRequestList;
	}
	public List<SelectBoxModel> getSelectBoxModelList() {
		selectBoxModelList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("fullname_orgname");
		selectBoxModel.setText("이름 또는 소속");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("loginid");
		selectBoxModel.setText("loginid");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("productserial");
		selectBoxModel.setText("productid");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("oid");
		selectBoxModel.setText("orderid");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("saleid");
		selectBoxModel.setText("saleid");
		selectBoxModelList.add(selectBoxModel);
		
		return selectBoxModelList;
	}
	
	public String getManual() {
		return manual;
	}
	public void setManual(String manual) {
		this.manual = manual;
	}
	public String getEducation() {
		return education;
	}
	
	public void setEducation(String eduation) {
		this.education = eduation;
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
	public String getExtensionPrice() {
		return extensionPrice;
	}
	public void setExtensionPrice(String extensionPrice) {
		this.extensionPrice = extensionPrice;
	}
	public String getExtensionSum() {
		return extensionSum;
	}
	public void setExtensionSum(String extensionSum) {
		this.extensionSum = extensionSum;
	}
	public String getRangeChk() {
		return rangeChk;
	}
	public void setRangeChk(String rangeChk) {
		this.rangeChk = rangeChk;
	}
	

	/* 
	 * free education	
	 * */
	@Getter @Setter private List<NationModel> nationList;
	@Getter @Setter private String NATION_CODE;
	@Getter @Setter private String APPLCNT_NM;
	@Getter @Setter private String PSITN_INSTT;
	@Getter @Setter private String PSITN_SUBJCT;
	@Getter @Setter private String CHARGER_EMAIL;
	@Getter @Setter private String LCTRE_NM;
	@Getter @Setter private String ATNLC_NMPR;
	@Getter @Setter private String LCTRE_INTRCN;
	@Getter @Setter private String RESULT;
	@Getter @Setter private String agree2;
	@Getter @Setter private String agree3;
	@Setter private List<SelectBoxModel> selectBoxFreeSearchFld;

	public List<SelectBoxModel> getSelectBoxFreeSearchFld() {
		selectBoxFreeSearchFld = new ArrayList<SelectBoxModel>();
		// 성함, 국가, 소속 기관, 소속 학과, 이메일, 강의명
		selectBoxFreeSearchFld.add(new SelectBoxModel("성함","APPLCNT_NM"));
		selectBoxFreeSearchFld.add(new SelectBoxModel("국가","NATION_CODE"));
		selectBoxFreeSearchFld.add(new SelectBoxModel("소속기관","PSITN_INSTT"));
		selectBoxFreeSearchFld.add(new SelectBoxModel("이메일","CHARGER_EMAIL"));
		selectBoxFreeSearchFld.add(new SelectBoxModel("강의","LCTRE_INTRCN"));
		return selectBoxFreeSearchFld;
	}
	
}
