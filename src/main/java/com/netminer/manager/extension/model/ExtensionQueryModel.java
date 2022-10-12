package com.netminer.manager.extension.model;

import com.cyframe.model.CyframeModel;

import lombok.Getter;
import lombok.Setter;

public class ExtensionQueryModel extends CyframeModel {
	private static final long serialVersionUID = -4566396512284055377L;
	
	@Getter @Setter private String id;
	@Getter @Setter private String productSerial;
	@Getter @Setter private String licenseUsage;
	@Getter @Setter private String expireDate;

	public String getExpireDateFormat() {
		return expireDate.substring(0, 4) + "-" + expireDate.substring(4, 6) + "-" + expireDate.substring(6, 8);
	}
}
