package com.netminer.manager.edition.service;

import java.util.List;

import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;

public interface EditionServiceIf {
	
	public List<EditionModel> readList_editionDetail(ProductpackageModel model) throws Exception;
	
	public List<EditionpackageModel> readList_editionpackage(EditionpackageModel model) throws Exception;

}
