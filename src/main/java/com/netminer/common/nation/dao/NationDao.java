package com.netminer.common.nation.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.cyframe.model.NationModel;
import com.netminer.manager.sale.model.SaleModel;

@Repository
public class NationDao extends IbatisAbstractDAO{

	public List<NationModel> readList(SaleModel param) throws Exception {
		return (List<NationModel>) readList("NationDao.nationList", param);
	}
}
