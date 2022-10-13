package com.netminer.common.nation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.model.NationModel;
import com.netminer.common.nation.dao.NationDao;
import com.netminer.manager.sale.model.SaleModel;

@Service
public class NationService implements NationServiceIf {

	@Inject
	private NationDao nationDao;
	
	@Override
	public List<NationModel> readList(SaleModel param) throws Exception {
		return nationDao.readList(param);
	}

}
