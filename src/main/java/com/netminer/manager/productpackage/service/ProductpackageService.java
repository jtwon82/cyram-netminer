package com.netminer.manager.productpackage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.productpackage.dao.ProductpackageDao;
import com.netminer.manager.productpackage.model.ProductpackageModel;

@Service
public class ProductpackageService implements ProductpackageServiceIf {

	@Inject
	private ProductpackageDao productpackageDao;

	@Override
	public List<ProductpackageModel> readList(ProductpackageModel model) throws Exception {
		return productpackageDao.readList(model);
	}

}
