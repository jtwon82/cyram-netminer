package com.netminer.manager.sale.model;

import com.cyframe.model.CyframeModel;

import lombok.Getter;
import lombok.Setter;

public class SaleExtensionModel extends CyframeModel {
	@Getter @Setter private String saleId;
	@Getter @Setter private String extensionId;
	@Getter @Setter private String priceKrw;
	@Getter @Setter private String priceUsd;
	@Getter @Setter private String licenseUsage;
}
