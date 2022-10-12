package com.netminer.manager.productpackage.service;

import java.util.List;

import com.netminer.manager.productpackage.model.PackageModel;

public interface PackageServiceIf {

	public List<PackageModel> readList() throws Exception;

}
