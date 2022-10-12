package com.netminer.download_buy.buy.service;

import com.netminer.download_buy.buy.model.BuyEnterpriseModel;

public interface BuyEnterpriseServiceIf {

	public void create(BuyEnterpriseModel model) throws Exception;
	public void create_site(BuyEnterpriseModel model) throws Exception;
}
