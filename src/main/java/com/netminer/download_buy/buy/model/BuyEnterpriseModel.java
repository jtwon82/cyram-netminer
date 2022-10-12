package com.netminer.download_buy.buy.model;

import com.cyframe.model.CyframeModel;

import lombok.Getter;
import lombok.Setter;

public class BuyEnterpriseModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	@Getter @Setter private String name;
	@Getter @Setter private String email;
	@Getter @Setter private String organization;
	@Getter @Setter private String department;
	@Getter @Setter private String position;
	@Getter @Setter private String contactinfo;
	@Getter @Setter private String licensetype;
	@Getter @Setter private String datasize;
	@Getter @Setter private String numberofusers;
	@Getter @Setter private String licenseusage;
	@Getter @Setter private String message;
	@Getter @Setter private String edition;
	@Getter @Setter private String licenseterm;
	@Getter @Setter private boolean sns;
	@Getter @Setter private boolean bibl;

}
