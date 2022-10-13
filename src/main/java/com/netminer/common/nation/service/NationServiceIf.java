package com.netminer.common.nation.service;

import java.util.List;

import com.cyframe.model.NationModel;
import com.netminer.manager.sale.model.SaleModel;

public interface NationServiceIf {

	public List<NationModel> readList(SaleModel param) throws Exception;
}
