package com.netminer.manager.productpackage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.productpackage.dao.PackageDao;
import com.netminer.manager.productpackage.model.PackageModel;

@Service
public class PackageService implements PackageServiceIf {

	@Inject
	private PackageDao packageDao;

	@Override
	public List<PackageModel> readList() throws Exception {
		return packageDao.readList();
	}

}
