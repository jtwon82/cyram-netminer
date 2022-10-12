package com.netminer.download_buy.buy.service;

import com.netminer.download_buy.buy.model.UpgradeModel;

public interface UpgradeServiceIf {

	public void create_package(UpgradeModel model) throws Exception;
	public void create_version(UpgradeModel model) throws Exception;
	public UpgradeModel read_package(UpgradeModel model) throws Exception;
}
