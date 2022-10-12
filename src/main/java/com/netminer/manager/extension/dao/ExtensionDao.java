package com.netminer.manager.extension.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;
import com.netminer.manager.sale.model.SaleModel;

@Repository
public class ExtensionDao extends IbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ExtensionModel> readList_extensionDetail(ProductpackageModel model) {
		return (List<ExtensionModel>) readList("ExtensionDao.readList.extensionDetail", model);
	}

	@SuppressWarnings("unchecked")
	public List<ExtensionModel> readAvailableExtensions(SaleModel model) {
		return (List<ExtensionModel>) readList("ExtensionDao.readList.available", model);
	}

	@SuppressWarnings("unchecked")
	public ExtensionModel[] readExtensions(String productSerial, String usage) {
		HashMap<String, String> param = new HashMap<>();
		param.put("serial", productSerial);
		param.put("usage", usage);
		List<ExtensionModel> l = (List<ExtensionModel>) readList("ExtensionDao.readList.extensions", param);
		return l.toArray(new ExtensionModel[l.size()]);
	}

	public void deleteExtensions(String productSerial) {
		this.delete("ExtensionDao.delete.extensions", productSerial);
	}
}
