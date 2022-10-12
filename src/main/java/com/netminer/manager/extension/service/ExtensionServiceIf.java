package com.netminer.manager.extension.service;

import java.util.List;

import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;
import com.netminer.manager.sale.model.SaleModel;

public interface ExtensionServiceIf {

	List<ExtensionModel> readExtensionDetailList(ProductpackageModel productpackageModel);

	List<ExtensionModel> readAvailableExtensions(SaleModel model);

	ExtensionModel[] readExtensions(String productSerial, String usage);

	void deleteExtensions(String productSerial);

}
