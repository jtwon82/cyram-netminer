package com.netminer.manager.edition.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.edition.dao.EditionDao;
import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;

@Service
public class EditionService implements EditionServiceIf {

	@Inject
	private EditionDao editionDao;

	@Override
	public List<EditionModel> readList_editionDetail(ProductpackageModel model)
			throws Exception {
		return editionDao.readList_editionDetail(model);
	}

	@Override
	public List<EditionpackageModel> readList_editionpackage(EditionpackageModel model)
			throws Exception {
		return editionDao.readList_editionpackage(model);
	}

}
