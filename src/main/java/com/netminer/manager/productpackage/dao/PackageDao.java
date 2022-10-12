package com.netminer.manager.productpackage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.productpackage.model.PackageModel;

@Repository
public class PackageDao extends IbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<PackageModel> readList() throws Exception {
		return (List<PackageModel>) readList("PackageDao.readList", null);
	}

}
