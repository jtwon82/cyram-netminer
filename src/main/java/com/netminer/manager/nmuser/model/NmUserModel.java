package com.netminer.manager.nmuser.model;

import java.util.ArrayList;
import java.util.List;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.SelectBoxModel;



public class NmUserModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private List<SelectBoxModel> selectBoxModelList;

	private String userid = "";
	private String saleid = "";
	private String loginid = "";
	private String firstname = "";
	private String lastname = "";
	private String pwd = "";
	private String pwd2 = "";
	private String email = "";
	private String industry = "";
	private String occupation = "";
	private String organization = "";
	private String department = "";
	private String title = "";
	private String country = "";
	private String city = "";
	private String birthday = "";
	private String gender = "1";
	private String mailing = "0";
	private String mailtype = "0";
	private String registerdate = "";
	private String registertime = "";
	private String dup = "";
	private String ems = "";
	private String buyer = "false";

	private List<SelectBoxModel> occupationList;
	private List<SelectBoxModel> industryList;
	private List<SelectBoxModel> countryList;
	private List<SelectBoxModel> genderList;
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getDup() {
		return dup;
	}
	public void setDup(String dup) {
		this.dup = dup;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	public void setOccupationList(List<SelectBoxModel> occupationList) {
		this.occupationList = occupationList;
	}
	public void setIndustryList(List<SelectBoxModel> industryList) {
		this.industryList = industryList;
	}
	public void setCountryList(List<SelectBoxModel> countryList) {
		this.countryList = countryList;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMailing() {
		return mailing;
	}
	public void setMailing(String mailing) {
		this.mailing = mailing;
	}
	public String getMailtype() {
		return mailtype;
	}
	public void setMailtype(String mailtype) {
		this.mailtype = mailtype;
	}
	public String getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}
	public String getRegistertime() {
		return registertime;
	}
	public void setRegistertime(String registertime) {
		this.registertime = registertime;
	}

	public String getEms() {
		return ems;
	}

	public void setEms(String ems) {
		this.ems = ems;
	}

	private String[] countrys = new String[237];

	public NmUserModel() {
		countrys[0] = "Afghanistan";
		countrys[1] = "Albania";
		countrys[2] = "Algeria";
		countrys[3] = "American Samoa";
		countrys[4] = "Andorra";
		countrys[5] = "Angola";
		countrys[6] = "Anguilla";
		countrys[7] = "Antarctica";
		countrys[8] = "Antigua and Barbuda";
		countrys[9] = "Argentina";
		countrys[10] = "Armenia";
		countrys[11] = "Aruba";
		countrys[12] = "Australia";
		countrys[13] = "Austria";
		countrys[14] = "Azerbaijan";
		countrys[15] = "Bahamas";
		countrys[16] = "Bahrain";
		countrys[17] = "Bangladesh";
		countrys[18] = "Barbados";
		countrys[19] = "Belarus";
		countrys[20] = "Belgium";
		countrys[21] = "Belize";
		countrys[22] = "Benin";
		countrys[23] = "Bermuda";
		countrys[24] = "Bhutan";
		countrys[25] = "Bolivia";
		countrys[26] = "Bosnia and Herzegovina";
		countrys[27] = "Botswana";
		countrys[28] = "Bouvet Island";
		countrys[29] = "Brazil";
		countrys[30] = "British Indian Ocean Territories";
		countrys[31] = "Brunei Darussalam";
		countrys[32] = "Bulgaria";
		countrys[33] = "Burkina Faso";
		countrys[34] = "Burundi";
		countrys[35] = "Cambodia";
		countrys[36] = "Cameroon";
		countrys[37] = "Canada";
		countrys[38] = "Cape Verde";
		countrys[39] = "Cayman Islands";
		countrys[40] = "Central African Republic";
		countrys[41] = "Chile";
		countrys[42] = "China, People's Republic of";
		countrys[43] = "Christmas Island";
		countrys[44] = "Cocos Islands";
		countrys[45] = "Colombia";
		countrys[46] = "Comoros";
		countrys[47] = "Congo";
		countrys[48] = "Cook Islands";
		countrys[49] = "Costa Rica";
		countrys[50] = "Cote D'ivoire";
		countrys[51] = "Croatia";
		countrys[52] = "Cuba";
		countrys[53] = "Cyprus";
		countrys[54] = "Czech Republic";
		countrys[55] = "Denmark";
		countrys[56] = "Djibouti";
		countrys[57] = "Dominica";
		countrys[58] = "Dominican Republic";
		countrys[59] = "East Timor";
		countrys[60] = "Ecuador";
		countrys[61] = "Egypt";
		countrys[62] = "El Salvador";
		countrys[63] = "Equatorial Guinea";
		countrys[64] = "Eritrea";
		countrys[65] = "Estonia";
		countrys[66] = "Ethiopia";
		countrys[67] = "Falkland Islands";
		countrys[68] = "Faroe Islands";
		countrys[69] = "Fiji";
		countrys[70] = "Finland";
		countrys[71] = "France";
		countrys[72] = "France, Metropolitan";
		countrys[73] = "French Guiana";
		countrys[74] = "French Polynesia";
		countrys[75] = "French Southern Territories";
		countrys[76] = "FYROM";
		countrys[77] = "Gabon";
		countrys[78] = "Gambia";
		countrys[79] = "Georgia";
		countrys[80] = "Germany";
		countrys[81] = "Ghana";
		countrys[82] = "Gibraltar";
		countrys[83] = "Greece";
		countrys[84] = "Greenland";
		countrys[85] = "Grenada";
		countrys[86] = "Guadeloupe";
		countrys[87] = "Guam";
		countrys[88] = "Guatemala";
		countrys[89] = "Guinea";
		countrys[90] = "Guinea-Bissau";
		countrys[91] = "Guyana";
		countrys[92] = "Haiti";
		countrys[93] = "Heard Island And Mcdonald Islands";
		countrys[94] = "Honduras";
		countrys[95] = "Hong Kong";
		countrys[96] = "Hungary";
		countrys[97] = "Iceland";
		countrys[98] = "India";
		countrys[99] = "Indonesia";
		countrys[100] = "Iran";
		countrys[101] = "Iraq";
		countrys[102] = "Ireland";
		countrys[103] = "Israel";
		countrys[104] = "Italy";
		countrys[105] = "Jamaica";
		countrys[106] = "Japan";
		countrys[107] = "Jordan";
		countrys[108] = "Kazakhstan";
		countrys[109] = "Kenya";
		countrys[110] = "Kiribati";
		countrys[111] = "Korea, Democratic People's Republic of";
		countrys[112] = "Korea, Republic of";
		countrys[113] = "Kuwait";
		countrys[114] = "Kyrgyzstan";
		countrys[115] = "Lao Peoples Democratic Republic";
		countrys[116] = "Latvia";
		countrys[117] = "Lebanon";
		countrys[118] = "Lesotho";
		countrys[119] = "Liberia";
		countrys[120] = "Libyan Arab Jamahiriya";
		countrys[121] = "Liechtenstein";
		countrys[122] = "Lithuania";
		countrys[123] = "Luxembourg";
		countrys[124] = "Macau";
		countrys[125] = "Madagascar";
		countrys[126] = "Malawi";
		countrys[127] = "Malaysia";
		countrys[128] = "Maldives";
		countrys[129] = "Mali";
		countrys[130] = "Malta";
		countrys[131] = "Marshall Islands";
		countrys[132] = "Martinique";
		countrys[133] = "Mauritania";
		countrys[134] = "Mauritius";
		countrys[135] = "Mayotte";
		countrys[136] = "Mexico";
		countrys[137] = "Micronesia";
		countrys[138] = "Moldova";
		countrys[139] = "Monaco";
		countrys[140] = "Mongolia";
		countrys[141] = "Montserrat";
		countrys[142] = "Morocco";
		countrys[143] = "Mozambique";
		countrys[144] = "Myanmar";
		countrys[145] = "Namibia";
		countrys[146] = "Nauru";
		countrys[147] = "Nepal";
		countrys[148] = "Netherlands";
		countrys[149] = "New Caledonia";
		countrys[150] = "New Zealand";
		countrys[151] = "Nicaragua";
		countrys[152] = "Niger";
		countrys[153] = "Nigeria";
		countrys[154] = "Niue";
		countrys[155] = "Norfolk";
		countrys[156] = "Northern Mariana Islands";
		countrys[157] = "Norway";
		countrys[158] = "Oman";
		countrys[159] = "Pakistan";
		countrys[160] = "Palau";
		countrys[161] = "Panama";
		countrys[162] = "Papua New Guinea";
		countrys[163] = "Paraguay";
		countrys[164] = "Peru";
		countrys[165] = "Philippines";
		countrys[166] = "Pitcairn";
		countrys[167] = "Poland";
		countrys[168] = "Portugal";
		countrys[169] = "Puerto Rico";
		countrys[170] = "Qatar";
		countrys[171] = "Reunion";
		countrys[172] = "Romania";
		countrys[173] = "Russian Federation";
		countrys[174] = "Rwanda";
		countrys[175] = "Saint Helena";
		countrys[176] = "Saint Kitts and Nevis";
		countrys[177] = "Saint Lucia";
		countrys[178] = "Saint Pierre and Miquelon";
		countrys[179] = "Saint Vincent and The Grenadines";
		countrys[180] = "Samoa";
		countrys[181] = "San Marino";
		countrys[182] = "Sao Tome and Principe";
		countrys[183] = "Saudi Arabia";
		countrys[184] = "Senegal";
		countrys[185] = "Seychelles";
		countrys[186] = "Sierra";
		countrys[187] = "Singapore";
		countrys[188] = "Slovakia";
		countrys[189] = "Slovenia";
		countrys[190] = "Solomon";
		countrys[191] = "Somalia";
		countrys[192] = "South Africa";
		countrys[193] = "South Georgia and Sandwich Islands";
		countrys[194] = "Spain";
		countrys[195] = "Sri Lanka";
		countrys[196] = "Sudan";
		countrys[197] = "Suriname";
		countrys[198] = "Svalbard and Jan Mayen";
		countrys[199] = "Swaziland";
		countrys[200] = "Sweden";
		countrys[201] = "Switzerland";
		countrys[202] = "Syrian Arab Republic";
		countrys[203] = "Taiwan";
		countrys[204] = "Tajikistan";
		countrys[205] = "Tanzania";
		countrys[206] = "Thailand";
		countrys[207] = "Togo";
		countrys[208] = "Tokelau";
		countrys[209] = "Tonga";
		countrys[210] = "Trinidad and Tobag";
		countrys[211] = "Tunisia";
		countrys[212] = "Turkey";
		countrys[213] = "Turkmenistan";
		countrys[214] = "Turks and Caicos Islands";
		countrys[215] = "Tuvalu";
		countrys[216] = "Uganda";
		countrys[217] = "Ukraine";
		countrys[218] = "United Arab Emirates";
		countrys[219] = "United Kingdom";
		countrys[220] = "United States";
		countrys[221] = "United States Minor Outlying Islands";
		countrys[222] = "Uruguay";
		countrys[223] = "Uzbekistan";
		countrys[224] = "Vanuatu";
		countrys[225] = "Vatican";
		countrys[226] = "Venezuela";
		countrys[227] = "Vietnam";
		countrys[228] = "Virgin Islands (British)";
		countrys[229] = "Virgin Islands (U.S.)";
		countrys[230] = "Wallis And Futuna Islands";
		countrys[231] = "Western Sahara";
		countrys[232] = "Yemen";
		countrys[233] = "Yugoslavia";
		countrys[234] = "Zaire";
		countrys[235] = "Zambia";
		countrys[236] = "Zimbabwe";
	}
	
	public List<SelectBoxModel> getCountryList() {
		countryList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("");
		selectBoxModel.setText("Select a Country");
		countryList.add(selectBoxModel);
		
		for(String country : countrys) {
			selectBoxModel = new SelectBoxModel();
			selectBoxModel.setValue(country);
			selectBoxModel.setText(country);
			countryList.add(selectBoxModel);
		}
		
		return countryList;
	}
	public List<SelectBoxModel> getIndustryList() {
		industryList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("0");
		selectBoxModel.setText("select industry");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("1");
		selectBoxModel.setText("education");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("2");
		selectBoxModel.setText("research/consulting");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("3");
		selectBoxModel.setText("government");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("4");
		selectBoxModel.setText("legal services");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("5");
		selectBoxModel.setText("financial/banking/insurance/real estate");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("6");
		selectBoxModel.setText("medical/pharmaceutical/health care");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("7");
		selectBoxModel.setText("telecommunication");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("8");
		selectBoxModel.setText("consumer retail/whole sale");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("9");
		selectBoxModel.setText("distribution");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("10");
		selectBoxModel.setText("computer-related(IS, MIS, DP, Internet)");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("11");
		selectBoxModel.setText("computer-related(hardware)");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("12");
		selectBoxModel.setText("computer-related(software)");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("13");
		selectBoxModel.setText("engineering/construction");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("14");
		selectBoxModel.setText("business supplies or services");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("15");
		selectBoxModel.setText("entertainment/media/publishing");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("16");
		selectBoxModel.setText("hospitality(travel/accommodations)");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("17");
		selectBoxModel.setText("nonprofit/membership organizations");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("50");
		selectBoxModel.setText("none, not employed");
		industryList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("51");
		selectBoxModel.setText("other");
		industryList.add(selectBoxModel);
		
		return industryList;
	}
	public List<SelectBoxModel> getOccupationList() {
		occupationList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("0");
		selectBoxModel.setText("select Occupation");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("1");
		selectBoxModel.setText("academic/professor/educator");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("2");
		selectBoxModel.setText("researcher/consultant");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("3");
		selectBoxModel.setText("executive/managerial");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("4");
		selectBoxModel.setText("professional(doctor, lawyer, etc.)");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("5");
		selectBoxModel.setText("service/customer support");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("6");
		selectBoxModel.setText("computer technical/engineering");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("7");
		selectBoxModel.setText("other technical/engineering");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("8");
		selectBoxModel.setText("tradesman/craftsman");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("9");
		selectBoxModel.setText("clerical/administrative");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("10");
		selectBoxModel.setText("sales/marketing");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("11");
		selectBoxModel.setText("college/graduate student");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("12");
		selectBoxModel.setText("homemaker");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("13");
		selectBoxModel.setText("self-employed/own company");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("14");
		selectBoxModel.setText("unemployed/looking for work");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("15");
		selectBoxModel.setText("retired");
		occupationList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("50");
		selectBoxModel.setText("other");
		occupationList.add(selectBoxModel);
		
		return occupationList;
	}
	public List<SelectBoxModel> getGenderList() {
		genderList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("1");
		selectBoxModel.setText("Male");
		genderList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("2");
		selectBoxModel.setText("Female");
		genderList.add(selectBoxModel);
		
		return genderList;
	}
	public void setGenderList(List<SelectBoxModel> genderList) {
		this.genderList = genderList;
	}
	public List<SelectBoxModel> getSelectBoxModelList() {
		selectBoxModelList = new ArrayList<SelectBoxModel>();
		SelectBoxModel selectBoxModel;

		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("loginid");
		selectBoxModel.setText("ID");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("email");
		selectBoxModel.setText("Email");
		selectBoxModelList.add(selectBoxModel);
		
		selectBoxModel = new SelectBoxModel();
		selectBoxModel.setValue("firstname+lastname");
		selectBoxModel.setText("firstname + lastname");
		selectBoxModelList.add(selectBoxModel);
		
		return selectBoxModelList;
	}
	public void setSelectBoxModelList(List<SelectBoxModel> selectBoxModelList) {
		this.selectBoxModelList = selectBoxModelList;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	
}
