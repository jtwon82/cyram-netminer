package com.netminer.manager.extension.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.extension.dao.ExtensionDao;
import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;
import com.netminer.manager.sale.model.SaleModel;

@Service
public class ExtensionService implements ExtensionServiceIf {

	@Inject
	private ExtensionDao extensionDao;

	@Override
	public List<ExtensionModel> readExtensionDetailList(ProductpackageModel model) {
		return extensionDao.readList_extensionDetail(model);
	}

	@Override
	public List<ExtensionModel> readAvailableExtensions(SaleModel model) {
		return extensionDao.readAvailableExtensions(model);
	}

	@Override
	public ExtensionModel[] readExtensions(String productSerial, String usage) {
		return extensionDao.readExtensions(productSerial, usage);
	}

	@Override
	public void deleteExtensions(String productSerial) {
		extensionDao.deleteExtensions(productSerial);
	}

}
