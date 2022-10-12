package com.netminer.manager.license.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.model.SelectBoxModel;
import com.netminer.manager.license.dao.LicenseDao;
import com.netminer.manager.license.model.LicenseModel;

@Service
public class LicenseService implements LicenseServiceIf {

	@Inject
	private LicenseDao licenseDao;

	@Override
	public List<SelectBoxModel> readList_usages(String productId) throws Exception {
		return licenseDao.readList_usages(productId);
	}

	@Override
	public List<SelectBoxModel> readList_terms(String productId) throws Exception {
		return licenseDao.readList_terms(productId);
	}

	@Override
	public List<SelectBoxModel> readList_sizes(String productId) throws Exception {
		return licenseDao.readList_sizes(productId);
	}

	@Override
	public List<SelectBoxModel> readList_termsByType(LicenseModel model) throws Exception {
		return licenseDao.readList_termsByType(model);
	}
	
	@Override
	public List<SelectBoxModel> readList_sizesByType(LicenseModel model) throws Exception {
		return licenseDao.readList_sizesByType(model);
	}

	@Override
	public LicenseModel read_factor(LicenseModel model) throws Exception {
		return licenseDao.read_factor(model);
	}
	
}
