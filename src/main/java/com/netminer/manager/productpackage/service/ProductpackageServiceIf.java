package com.netminer.manager.productpackage.service;

import java.util.List;

import com.netminer.manager.productpackage.model.ProductpackageModel;

public interface ProductpackageServiceIf {

	public List<ProductpackageModel> readList(ProductpackageModel model) throws Exception;

}
