package com.netminer.download_buy.buy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.download_buy.buy.model.BuyModel;

@Repository
public class BuyDao extends IbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<BuyModel> readList(BuyModel model) throws Exception {
		return (List<BuyModel>) readList("BuyDao.readList", model);
	}

}
