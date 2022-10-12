package com.netminer.manager.productpackage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.productpackage.model.ProductpackageModel;

@Repository
public class ProductpackageDao extends IbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ProductpackageModel> readList(ProductpackageModel model) throws Exception {
		return (List<ProductpackageModel>) readList("ProductpackageDao.readList", model);
	}

}
