package com.netminer.manager.edition.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.productpackage.model.ProductpackageModel;

@Repository
public class EditionDao extends IbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<EditionModel> readList_edition() throws Exception {
		return (List<EditionModel>) readList("EditionDao.readList.edition", null);
	}
	
	@SuppressWarnings("unchecked")
	public List<EditionModel> readList_editionDetail(ProductpackageModel model) throws Exception {
		return (List<EditionModel>) readList("EditionDao.readList.editionDetail", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<EditionpackageModel> readList_editionpackage(EditionpackageModel model) throws Exception {
		return (List<EditionpackageModel>) readList("EditionDao.readList.editionpackage", model);
	}

}
