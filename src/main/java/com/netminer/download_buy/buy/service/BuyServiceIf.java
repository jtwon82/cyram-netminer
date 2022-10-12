package com.netminer.download_buy.buy.service;

import com.netminer.download_buy.buy.model.BuyModel;

public interface BuyServiceIf {

	public String[] create(BuyModel model) throws Exception;
	public BuyModel read(BuyModel model) throws Exception;
	public BuyModel read_package(BuyModel model) throws Exception;
	public BuyModel read_edition(BuyModel model) throws Exception;
	public BuyModel readExtension(BuyModel model) throws Exception;
	public BuyModel read_editionpackage(BuyModel model) throws Exception;
	
}
